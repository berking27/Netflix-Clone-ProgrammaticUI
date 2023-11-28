//
//  DownloadsViewController.swift
//  NetflixClone ProgrammaticUI
//
//  Created by Berkin Koca on 17.11.2023.
//

import UIKit

class DownloadsViewController: UIViewController {
     
     private var titles: [TitleItem] = [TitleItem]()
     
     private let downloadTable: UITableView = {
          
          let table = UITableView()
          
          table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
          
          return table
     }()
     
     override func viewDidLoad() {
          super.viewDidLoad()
          // Do any additional setup after loading the view.
          view.backgroundColor = .systemBackground
          title = "Downloads"
          view.addSubview(downloadTable)
          navigationController?.navigationBar.prefersLargeTitles = true
          navigationController?.navigationItem.largeTitleDisplayMode = .always
          
          downloadTable.delegate = self
          downloadTable.dataSource = self
          
          fetchLocalStorage()
          NotificationCenter.default.addObserver(forName: NSNotification.Name("Downloaded"), object: nil, queue: nil) { _ in
               self.fetchLocalStorage()
          }
     }
     
     private func fetchLocalStorage() {
          DataPersistenceManager.shared.fetchingTitlesFromDatabase { [weak self] result in
               switch result {
               case .success(let titles):
                    self?.titles = titles
                    DispatchQueue.main.async{
                         self?.downloadTable.reloadData()
                    }
               case .failure(let error):
                    print(error.localizedDescription)
               }
          }
     }
     
     override func viewDidLayoutSubviews() {
          super.viewDidLayoutSubviews()
          downloadTable.frame = view.bounds
     }
     
     
}

extension DownloadsViewController: UITableViewDataSource, UITableViewDelegate {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return titles.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else {
               return UITableViewCell()
          }
          
          let title = titles[indexPath.row]
          cell.configure(with: TitleViewModel(titleName: title.original_title ?? title.original_name ?? "Unknown", posterURL: title.poster_path ?? ""))
          return cell
     }
     
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 180
     }
     
     
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          tableView.deselectRow(at: indexPath, animated: true)
          
          let title = titles[indexPath.row]
          
          guard let titleName = title.original_name ?? title.original_title else {
               return
          }
          
          APICaller.shared.getMovie(with: titleName) { [weak self] result in
               switch result {
               case .success(let videoElement):
                    DispatchQueue.main.async {
                         let vc = TitlePreviewViewController()
                         vc.configure(with: TitlePreviewViewModel(title: titleName, youtubeVideo: videoElement, titleOverView: title.overview ?? "Unknown overview"))
                         self?.navigationController?.pushViewController(vc, animated: true)
                    }
                    
               case .failure(let error):
                    print(error.localizedDescription)
               }
          }
     }
     
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
          switch editingStyle {
          case .delete:
               DataPersistenceManager.shared.deleteTitleWith(model: titles[indexPath.row]) { [weak self] result in
                    switch result {
                    case .success():
                         print("Deleted")
                    case .failure(let error):
                         print(error.localizedDescription)
                    }
                    self?.titles.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                    
               }
          default:
               break;
          }
     }
     
}

#Preview(){
     DownloadsViewController()
}
