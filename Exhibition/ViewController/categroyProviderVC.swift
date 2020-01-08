//
//  categroyProviderVC.swift
//  Exhibition
//
//  Created by Farido on 6/16/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class categroyProviderVC: UIViewController {

    @IBOutlet weak var collection: UICollectionView!
    
    var catProvider = [categoryProviderDetails]()
    var singItem: categoryProvider?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.delegate = self
        collection.dataSource = self
        
        handleRefreshCatugoryJops()

    }
    
    @objc private func handleRefreshCatugoryJops() {
        API_home.categoryProviderDetail(id: singItem?.id ?? 0) { (error: Error?, catProvider: [categoryProviderDetails]?) in
            if let catProvider = catProvider {
                self.catProvider = catProvider
                print("xxx\(self.catProvider)")
                self.collection.reloadData()
                //self.startTimer()
            }
        }
        
    }
}

extension categroyProviderVC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catProvider.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? categouryProviderDetilasCell {
            let iamge = catProvider[indexPath.item]
            cell.configuerCell(item: iamge)
            return cell
        }else {
            return categouryProviderDetilasCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenWidth = collectionView.frame.width
        
        var width = (screenWidth-30)/3
        
        width = width < 130 ? 160 : width
        
        return CGSize.init(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "suge", sender: catProvider[indexPath.row])
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaination = segue.destination as? categoryProviderDetialsVC {
            if let sub = sender as? categoryProviderDetails{
                destaination.singleItem = sub

            }
        }
    }
    
}
