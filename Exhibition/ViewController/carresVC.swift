//
//  carresVC.swift
//  Exhibition
//
//  Created by Farido on 6/12/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class carresVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var jop = [jops]()
    
    
    var id_user = ""
    var fairs_id = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        if id_user == ""{
        handleRefreshCatugoryJops()
        }else {
        handleRefreshcareerExhibitorsJops()
        }
    }
    
    @objc private func handleRefreshcareerExhibitorsJops() {
        API_home.career_exhibitors(id_user: id_user, fairs_id: fairs_id){ (error: Error?, jop: [jops]?) in
            if let jop = jop {
                self.jop = jop
                print("xxx\(self.jop)")
                self.collectionView.reloadData()
                //self.startTimer()
            }
        }
        
    }
    
    @objc private func handleRefreshCatugoryJops() {
        API_home.jop{ (error: Error?, jop: [jops]?) in
            if let jop = jop {
                self.jop = jop
                print("xxx\(self.jop)")
                self.collectionView.reloadData()
                //self.startTimer()
            }
        }
        
    }
}


extension carresVC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return jop.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? jopsCell {
                let iamge = jop[indexPath.item]
                cell.configuerCell(item: iamge)
                return cell
            }else {
                return jopsCell()
            }
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            let screenWidth = collectionView.frame.width
            
            var width = (screenWidth-30)/3
            
            width = width < 130 ? 160 : width
            
            return CGSize.init(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            performSegue(withIdentifier: "suge5", sender: jop[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let destaination = segue.destination as? jopSDetilesVC {
            if let sub = sender as? jops{
                destaination.singleItem = sub
                
            }
        }
    }
    
}
