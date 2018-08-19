//
//  ViewController.swift
//  orangevalley
//
//  Created by aidin on 2/5/18.
//  Copyright © 2018 aidin. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionview: UICollectionView!
    let dataURL : URL = URL(string: "http://orangevalleycaa.org/api/videos")!
    var videos : [video] = [] {
        didSet {
            OperationQueue.main.addOperation {
                self.collectionview.reloadData()
            }
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataReceiver(url: dataURL)
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.cellNameLabel.text = videos[indexPath.row].name
        cell.cellDurationLabel.text = videos[indexPath.row].duration
        func imageLoader(url2 : URL) {
            let imageTask = URLSession.shared.dataTask(with: url2) { (imageData, imageResponse , imageError) in
                if let receivedImage = imageData {
                    OperationQueue.main.addOperation {
                        cell.cellImage.image = UIImage(data: receivedImage)
                    }
                }
            }
            imageTask.resume()
        }
        imageLoader(url2: URL(string: videos[indexPath.row].thumbnail)!)
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    
    func dataReceiver(url : URL) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let receivedData = data {
                do {
                    self.videos = try JSONDecoder().decode([video].self , from: receivedData)
                    print(self.videos)
                } catch {
                    print("error too func dataReceiver")
                }
            }
        }
        task.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "videosToVideo" {
            let destination = segue.destination as! videoViewController
            let cell = sender as? UICollectionViewCell
            let indexpath = self.collectionview.indexPath(for: cell!)
            destination.selectedVideo = videos[(indexpath?.row)!]
        } else {
            return
        }
    }


}
