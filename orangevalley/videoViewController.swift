//
//  videoViewController.swift
//  orangevalley
//
//  Created by aidin on 2/6/18.
//  Copyright © 2018 aidin. All rights reserved.
//

import UIKit
import AVKit

class videoViewController: UIViewController {
    
    var selectedVideo : video!
    let videoView = UIView()
    let nameText : UILabel = {
       let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = UIColor.lightGray
        text.font = UIFont.boldSystemFont(ofSize: 18)
        return text
    }()
    let createdByText : UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = UIColor.lightGray
        text.font = UIFont.systemFont(ofSize: 16)
        return text
    }()
    let descriptionText : UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.numberOfLines = 0
        text.textAlignment = .justified
        text.textColor = UIColor.white
        text.font = UIFont.systemFont(ofSize: 17)
        return text
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        objectsLayout()
        nameText.text = selectedVideo.name
        createdByText.text = selectedVideo.created_by
        descriptionText.text = selectedVideo.description
        videoLoader(url: selectedVideo.video_url, containerView: videoView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func objectsLayout() {
        view.addSubview(videoView)
        view.addSubview(nameText)
        view.addSubview(createdByText)
        view.addSubview(descriptionText)
        
        
        videoView.translatesAutoresizingMaskIntoConstraints = false
        
        let videoViewHeight = (UIScreen.main.bounds.height)*0.3
        videoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        videoView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        videoView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        videoView.heightAnchor.constraint(equalToConstant: videoViewHeight).isActive = true
        
        nameText.topAnchor.constraint(equalTo: videoView.bottomAnchor, constant: 8).isActive = true
        nameText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        nameText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        nameText.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        createdByText.topAnchor.constraint(equalTo: nameText.bottomAnchor, constant: 4).isActive = true
        createdByText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        createdByText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        createdByText.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        descriptionText.topAnchor.constraint(equalTo: createdByText.bottomAnchor, constant: 8).isActive = true
        descriptionText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        descriptionText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        descriptionText.heightAnchor.constraint(equalToConstant: 160).isActive = true
    }
    
    func videoLoader(url : String , containerView : UIView) {
        let videURL = URL(string: url)
        let player = AVPlayer(url: videURL!)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = containerView.bounds
        containerView.layer.addSublayer(playerLayer)
        player.play()
    }
    
    
}
