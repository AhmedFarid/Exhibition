//
//  serviceProviderVC.swift
//  Exhibition
//
//  Created by Farido on 5/26/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class serviceProviderVC: UIViewController {

    
    @IBOutlet weak var categouryProviderCollection: UICollectionView!
    
    var categouryProviders = [categoryProvider]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        categouryProviderCollection.delegate = self
        categouryProviderCollection.dataSource = self
        
        handleRefreshCatugoryProvider()
        
    }
    

    
    @objc private func handleRefreshCatugoryProvider() {
        API_home.categoryProvid{ (error: Error?, categouryProviders: [categoryProvider]?) in
            if let categouryProviders = categouryProviders {
                self.categouryProviders = categouryProviders
                print("xxx\(self.categouryProviders)")
                self.categouryProviderCollection.reloadData()
                //self.startTimer()
            }
        }
        
    }

}

extension serviceProviderVC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return categouryProviders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if let cell = categouryProviderCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CategouryProviderCell {
                let iamge = categouryProviders[indexPath.item]
                cell.configuerCell(item: iamge)
                return cell
            }else {
                return CategouryProviderCell()
            }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let screenWidth = collectionView.frame.width
            
            var width = (screenWidth-30)/2
            
            width = width < 160 ? 200 : width
            
            return CGSize.init(width: width, height: width)
    }
    
}
