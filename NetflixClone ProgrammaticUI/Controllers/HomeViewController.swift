//
//  HomeViewController.swift
//  NetflixClone ProgrammaticUI
//
//  Created by Berkin Koca on 17.11.2023.
//

import UIKit

class HomeViewController: UIViewController {
     
     let sectionTitles: [String] = [
          "Trending Movies",
          "Trending TV Series",
          "Popular",
          "Upcoming Movies",
          "Top Rated"
     ]
     
     private let homeFeedTable: UITableView = {
          let table = UITableView(frame: .zero, style: .grouped)
          table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
          return table
     }()
     
     override func viewDidLoad() {
          super.viewDidLoad()
          
          view.backgroundColor = .systemBackground
          view.addSubview(homeFeedTable)
          
          configureNavbar()
          
          homeFeedTable.delegate = self
          homeFeedTable.dataSource = self
          

          let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
          homeFeedTable.tableHeaderView = headerView
          
          fetchData()
     }
     
     private func configureNavbar() {
          
          var image = UIImage(named: "netflixLogo")
          image = image?.withRenderingMode(.alwaysOriginal) 
          //Use the image as it is.That's why we use var instead of let
          navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
          
          navigationItem.rightBarButtonItems = [
               UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
               UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
          ]
          navigationController?.navigationBar.tintColor = .white
               
     }
     
     override func viewDidLayoutSubviews() {
          super.viewDidLayoutSubviews()
          homeFeedTable.frame = view.bounds
     }
     
     private func fetchData(){
//          APICaller.shared.getTrendingMovies { results in
//               switch results {
//               case .success(let movies):
//                    print(movies)
//               case .failure(let error):
//                    print(error)
//               }
//     
//          }
          
//          APICaller.shared.getTrendingTvs { results in
//               switch results {
//               case .success(let tvSeries):
//                    print(tvSeries)
//               case .failure(let error):
//                    print(error)
//               }
//          }
          
//          APICaller.shared.getUpcomingMovies { _ in
//               //
//          }
          
//          APICaller.shared.getPopular { _ in
//               //
//          }
          
//          APICaller.shared.getTopRated { _ in
//               //
//          }
     }
     
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
     
     func numberOfSections(in tableView: UITableView) -> Int {
          return sectionTitles.count
     }
     
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
          guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else{
               return UITableViewCell()
          }
          
          return cell
     }
     
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return 1
     }
     
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 200
     }
     
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
          return 40
     }
     
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
          return sectionTitles[section]
     }
     
     func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
          
          guard let header = view as? UITableViewHeaderFooterView else { return }
          header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
          header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
          header.textLabel?.textColor = .white
          header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
          
     }
     
     func scrollViewDidScroll(_ scrollView: UIScrollView) {
          let defaultOffset = view.safeAreaInsets.top
          let offset = scrollView.contentOffset.y + defaultOffset
          
          //When you Scroll down navbar will disappear
          //When you Scroll up navbar won't slide
          navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
     }
     
}

#Preview(){
     //HomeViewController()
     MainTabBarViewController()
}
