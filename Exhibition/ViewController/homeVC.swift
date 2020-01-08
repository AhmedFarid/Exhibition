//
//  ViewController.swift
//  Exhibition
//
//  Created by Farido on 5/19/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class homeVC: UIViewController {
    
    @IBOutlet weak var serchTF: shadowTextFiled!
    @IBOutlet weak var newsColloction: UICollectionView!
    @IBOutlet weak var bannerCollection: UICollectionView!
    @IBOutlet weak var currentFairColloction: UICollectionView!
    @IBOutlet weak var underconFarisCollection: UICollectionView!
    @IBOutlet weak var categouryProviderCollection: UICollectionView!
    @IBOutlet weak var jopsCollection: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var pageControl2: UIPageControl!
    
    var timer = Timer()
    var counter = 0
    
    var timer2 = Timer()
    var counter2 = 0
    
    var banner = [superNews]()
    var seconedBanner = [superBanners]()
    var currentFairs = [currentFaire]()
    var undererConstracFaris = [underconstructionFair]()
    var categouryProviders = [categoryProvider]()
    var jop = [jops]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleRefreshSuperNews()
        setupNavagtion()
        handleRefreshSuperNews()
        handleRefreshSuperBanner()
        handleRefreshcurentFair()
        handleRefreshcUndercounstactFaris()
        handleRefreshCatugoryProvider()
        handleRefreshCatugoryJops()
        imageText()
        bordercollection()
        
        serchTF.delegate = self
        
        
        newsColloction.delegate = self
        newsColloction.dataSource = self
        
        bannerCollection.delegate = self
        bannerCollection.dataSource = self
        
        currentFairColloction.delegate = self
        currentFairColloction.dataSource = self
        
        underconFarisCollection.delegate = self
        underconFarisCollection.dataSource = self
        
        categouryProviderCollection.delegate = self
        categouryProviderCollection.dataSource = self
        
        jopsCollection.delegate = self
        jopsCollection.dataSource = self
        
    }
    
    func bordercollection(){
        
        bannerCollection.layer.cornerRadius = 5.0
        bannerCollection.layer.borderWidth = 2.0
        bannerCollection.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        
        currentFairColloction.layer.cornerRadius = 5.0
        currentFairColloction.layer.borderWidth = 2.0
        currentFairColloction.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        
        underconFarisCollection.layer.cornerRadius = 5.0
        underconFarisCollection.layer.borderWidth = 2.0
        underconFarisCollection.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        
        categouryProviderCollection.layer.cornerRadius = 5.0
        categouryProviderCollection.layer.borderWidth = 2.0
        categouryProviderCollection.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        
        jopsCollection.layer.cornerRadius = 5.0
        jopsCollection.layer.borderWidth = 2.0
        jopsCollection.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
    }
    
    @objc private func handleRefreshSuperNews() {
        API_home.supernew{ (error: Error?, banner: [superNews]?) in
            if let banner = banner {
                self.banner = banner
                print("xxx\(self.banner)")
                self.newsColloction.reloadData()
                self.pageControl.numberOfPages = banner.count
                self.pageControl.currentPage = 0
                DispatchQueue.main.async {
                    self.timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
                }
                
            }
        }
        
    }
    
    @objc func changeImage() {
        
        if counter < banner.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.newsColloction.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = counter
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.newsColloction.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            pageControl.currentPage = counter
            counter = 1
        }
        
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
    
    @objc private func handleRefreshcUndercounstactFaris() {
        API_home.underconstFair{ (error: Error?, undererConstracFaris: [underconstructionFair]?) in
            if let undererConstracFaris = undererConstracFaris {
                self.undererConstracFaris = undererConstracFaris
                print("xxx\(self.undererConstracFaris)")
                self.underconFarisCollection.reloadData()
            }
        }
        
    }
    
    @objc private func handleRefreshSuperBanner() {
        API_home.superPanner{ (error: Error?, seconedBanner: [superBanners]?) in
            if let seconedBanner = seconedBanner {
                self.seconedBanner = seconedBanner
                print("xxx\(self.seconedBanner)")
                self.bannerCollection.reloadData()
                self.pageControl2.numberOfPages = seconedBanner.count
                self.pageControl2.currentPage = 0
                DispatchQueue.main.async {
                    self.timer2 = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.changeImage2), userInfo: nil, repeats: true)
                }
            }
        }
        
    }
    
    @objc func changeImage2() {
        
        if counter2 < seconedBanner.count {
            let index = IndexPath.init(item: counter2, section: 0)
            self.bannerCollection.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageControl2.currentPage = counter2
            counter2 += 1
        } else {
            counter2 = 0
            let index = IndexPath.init(item: counter2, section: 0)
            self.bannerCollection.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            pageControl2.currentPage = counter2
            counter2 = 1
        }
        
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
    
    @objc private func handleRefreshCatugoryJops() {
        API_home.jop{ (error: Error?, jop: [jops]?) in
            if let jop = jop {
                self.jop = jop
                print("xxx\(self.jop)")
                self.jopsCollection.reloadData()
                //self.startTimer()
            }
        }
        
    }
    
    func setupNavagtion(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    
    func imageText() {
        
        if let myImage = UIImage(named: "ic_search"){
            
            serchTF.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
    }
}

extension homeVC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return banner.count
        }else if collectionView.tag == 1 {
            return seconedBanner.count
        }else if collectionView.tag == 2{
            return currentFairs.count
        }else if collectionView.tag == 3 {
            return undererConstracFaris.count
        }else if collectionView.tag == 4{
            return categouryProviders.count
        }else {
            return jop.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
            if let cell = newsColloction.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? superNewsCell {
                let iamge = banner[indexPath.item]
                cell.configuerCell(item: iamge)
                return cell
            }else {
                return superNewsCell()
            }
        }else if collectionView.tag == 1{
            if let cell = bannerCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? bannerCell {
                let iamge = seconedBanner[indexPath.item]
                cell.configuerCell(item: iamge)
                return cell
            }else {
                return bannerCell()
            }
        }else if collectionView.tag == 2 {
            if let cell = currentFairColloction.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? currentCell {
                let iamge = currentFairs[indexPath.item]
                cell.configuerCell(item: iamge)
                return cell
            }else {
                return currentCell()
            }
        }else if collectionView.tag == 3 {
            if let cell = underconFarisCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? undercontraterFarirsCell {
                let iamge = undererConstracFaris[indexPath.item]
                cell.configuerCell(item: iamge)
                return cell
            }else {
                return undercontraterFarirsCell()
            }
        }else if collectionView.tag == 4 {
            if let cell = categouryProviderCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CategouryProviderCell {
                let iamge = categouryProviders[indexPath.item]
                cell.configuerCell(item: iamge)
                return cell
            }else {
                return CategouryProviderCell()
            }
        }else {
            if let cell = jopsCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? jopsCell {
                let iamge = jop[indexPath.item]
                cell.configuerCell(item: iamge)
                return cell
            }else {
                return jopsCell()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 2 {
            performSegue(withIdentifier: "segue", sender: currentFairs[indexPath.row])
        }else if collectionView.tag == 3{
            performSegue(withIdentifier: "suge2", sender: undererConstracFaris[indexPath.row])
        }else if collectionView.tag == 5 {
            performSegue(withIdentifier: "suge5", sender: jop[indexPath.row])
        }else if collectionView.tag == 4{
            performSegue(withIdentifier: "suge1235", sender: categouryProviders[indexPath.row])
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? currentExhabtionVC{
            if let sub = sender as? currentFaire{
                destaiantion.singleItem = sub
            }
        }else if let destaiantion = segue.destination as? underConstrFairDetailsVC{
            if let sub = sender as? underconstructionFair{
                destaiantion.singleItem = sub
            }
        }else if let destaination = segue.destination as? currentFarisVC {
            destaination.kay = serchTF.text ?? ""
        }else if let destaination = segue.destination as? jopSDetilesVC {
            if let sub = sender as? jops{
                destaination.singleItem = sub
            }
        }else if let destaination = segue.destination as? categroyProviderVC {
            if let sub = sender as? categoryProvider {
                destaination.singItem = sub
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == newsColloction{
            let size = newsColloction.frame.size
            return CGSize(width: size.width, height: size.height)
        }else if collectionView.tag == 1 {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }else if collectionView.tag == 2 {
            //            let screenWidth = collectionView.frame.width
            //
            //            var width = (screenWidth-30)/2
            //
            //            width = width < 130 ? 160 : width
            //
            //            return CGSize.init(width: width, height: width)
            return CGSize(width: 190, height: collectionView.frame.height - 10)
            
        }else if collectionView.tag == 3 {
            //            let screenWidth = collectionView.frame.width
            //
            //            var width = (screenWidth-30)/2
            //
            //            width = width < 130 ? 160 : width
            //
            //            return CGSize.init(width: width, height: width)
            
            return CGSize(width: 190, height: collectionView.frame.height - 10)
        }else if collectionView.tag == 4 {
            let screenWidth = collectionView.frame.width
            
            var width = (screenWidth-30)/3
            
            width = width < 30 ? 60 : width
            
            return CGSize.init(width: width, height: width)
        }else {
            return CGSize(width: 190, height: collectionView.frame.height)
        }
    }
}

extension homeVC: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //textField code
        
        textField.resignFirstResponder()  //if desired
        performAction()
        return true
    }
    
    func performAction() {
        //action events
        performSegue(withIdentifier: "xx", sender: nil)
    }
    
    
}
