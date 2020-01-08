//
//  currentFarisVC.swift
//  Exhibition
//
//  Created by Farido on 5/26/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class currentFarisVC: UIViewController {
    
    
    @IBOutlet weak var currentFairColloction: UICollectionView!
    var currentFairs = [currentFaire]()
    var kay = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if kay == ""{
            handleRefreshcurentFair()
        }else{
            handleRefreshSearchcurentFair()
        }
        
        currentFairColloction.delegate = self
        currentFairColloction.dataSource = self
    }
    
    
    @objc private func handleRefreshcurentFair() {
        API_home.CurrentFair{ (error: Error?, currentFairs: [currentFaire]?) in
            if let currentFairs = currentFairs {
                self.currentFairs = currentFairs
                print("xxx\(self.currentFairs)")
                self.currentFairColloction.reloadData()
            }
        }
        
    }
    
    @objc private func handleRefreshSearchcurentFair() {
        API_home.CurrentFairSearch(key: kay){ (error: Error?, currentFairs: [currentFaire]?) in
            if let currentFairs = currentFairs {
                self.currentFairs = currentFairs
                print("xxx\(self.currentFairs)")
                self.currentFairColloction.reloadData()
            }
        }
        
    }
}


extension currentFarisVC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentFairs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = currentFairColloction.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? currentCell {
            let iamge = currentFairs[indexPath.item]
            cell.configuerCell(item: iamge)
            return cell
        }else {
            return currentCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segue", sender: currentFairs[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? currentExhabtionVC{
            if let sub = sender as? currentFaire{
                destaiantion.singleItem = sub
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = collectionView.frame.width
        
        var width = (screenWidth-30)/2
        
        width = width < 130 ? 160 : width
        
        return CGSize.init(width: width, height: width)
        
    }
    
}
