//
//  TitlePreviewViewController.swift
//  NetflixClone ProgrammaticUI
//
//  Created by Berkin Koca on 22.11.2023.
//

import UIKit
import WebKit

class TitlePreviewViewController: UIViewController {

     private let titleLabel: UILabel = {
          
          let label = UILabel()
          label.translatesAutoresizingMaskIntoConstraints = false
          label.text = "Spider Man"
          label.font = .systemFont(ofSize: 22, weight: .bold)
          
          return label
     }()
     
     private let overviewLabel: UILabel = {
          
          let label = UILabel()
          label.translatesAutoresizingMaskIntoConstraints = false
          label.text = "This is the best movie"
          label.font = .systemFont(ofSize: 18, weight: .regular)
          label.numberOfLines = 0
          return label
     }()
     
     private let downloadButton: UIButton = {
          
          let button = UIButton()
          button.translatesAutoresizingMaskIntoConstraints = false
          button.backgroundColor = .red
          button.setTitle("Download", for: .normal)
          button.setTitleColor(.white, for: .normal)
          button.layer.cornerRadius = 12
          button.layer.masksToBounds = true
          
          return button
     }()
     
     private let webView: WKWebView = {
          let webView = WKWebView()
          webView.translatesAutoresizingMaskIntoConstraints = false
          
          return webView
     }()
     
    override func viewDidLoad() {
        super.viewDidLoad()
         view.backgroundColor = .systemBackground
         view.addSubview(webView)
         view.addSubview(titleLabel)
         view.addSubview(overviewLabel)
         view.addSubview(downloadButton)
         
         applyConstraints()

        
    }
     
     
     func applyConstraints() {
          
          let webViewConstraints = [
               webView.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
               webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
               webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
               webView.heightAnchor.constraint(equalToConstant: 320)
          ]
          
          let titleLabelConstraints = [
               titleLabel.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 20),
               titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
          ]
          
          let overviewLabelConstraints = [
               overviewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
               overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
               overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
          ]
          
          let downloadButtonConstraints = [
               downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               downloadButton.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 24),
               downloadButton.widthAnchor.constraint(equalToConstant: 140),
               downloadButton.heightAnchor.constraint(equalToConstant: 40)
          ]
          
          NSLayoutConstraint.activate(webViewConstraints)
          NSLayoutConstraint.activate(titleLabelConstraints)
          NSLayoutConstraint.activate(overviewLabelConstraints)
          NSLayoutConstraint.activate(downloadButtonConstraints)
     }
     
     
     func configure(with model: TitlePreviewViewModel) {
          titleLabel.text = model.title
          overviewLabel.text = model.titleOverView
          let videoURL = model.youtubeVideo.id.videoId
          
          guard let url = URL(string: "https://www.youtube.com/embed/\(videoURL)") else {
               return
          }
          
          print(videoURL)
          print(url)
          
          webView.load(URLRequest(url: url))
     }
    
}


#Preview(){
     TitlePreviewViewController()
}
