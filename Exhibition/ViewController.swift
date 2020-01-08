//
//  ViewController.swift
//  Exhibition
//
//  Created by Farido on 7/10/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import MOLH

class ViewController: UIViewController {
    
    @IBOutlet weak var bannerCollection: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    var images = [superBanners]()
    
    var timer = Timer()
    var counter = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerCollection.delegate = self
        bannerCollection.dataSource = self
        
        handleRefresh()
        
    }
    
    @IBAction func lang(_ sender: Any) {
        MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
        MOLH.reset(transition: .transitionCrossDissolve)
    }
    
    @objc private func handleRefresh() {
        API_home.superPanner{ (error: Error?, images: [superBanners]?) in
            if let images = images {
                self.images = images
                print("xxx\(self.images)")
                self.bannerCollection.reloadData()
                self.pageControl.numberOfPages = images.count
                self.pageControl.currentPage = 0
                DispatchQueue.main.async {
                    self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
                }
            }
        }
        
    }
    
    @objc func changeImage() {
        
        if counter < images.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.bannerCollection.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = counter
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.bannerCollection.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            pageControl.currentPage = counter
            counter = 1
        }
        
    }

    
}

extension ViewController: UICollectionViewDelegate ,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? bannerCell {
                let iamge = images[indexPath.item]
                cell.configuerCell(item: iamge)
                return cell
            }else {
                return bannerCell()
            }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        
    }
    
}



