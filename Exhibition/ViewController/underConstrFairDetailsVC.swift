//
//  underConstrFairDetailsVC.swift
//  Exhibition
//
//  Created by Farido on 5/24/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import WebKit

class underConstrFairDetailsVC: UIViewController {
    
    
    var singleItem: underconstructionFair?
    @IBOutlet weak var wv: WKWebView!
    @IBOutlet weak var suponcerCollection: UICollectionView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var exhibitorsCollection: UICollectionView!
    @IBOutlet weak var servicesCollection: UICollectionView!
//    @IBOutlet weak var holeNumberOneTableView: UITableView!
//    @IBOutlet weak var holeNumberTwoTableView: UITableView!
//    @IBOutlet weak var holeNumber3TableView: UITableView!
//    @IBOutlet weak var holeNumberFourTableView: UITableView!
    @IBOutlet weak var mapIlestrationCollectionView: UICollectionView!
    @IBOutlet weak var imageBC: UIImageView!
    @IBOutlet weak var holeNum1TF: UITextField!
    @IBOutlet weak var holeNum2TF: UITextField!
    @IBOutlet weak var holeNum3TF: UITextField!
    @IBOutlet weak var holeNum4TF: UITextField!
    @IBOutlet weak var holeLab1: UILabel!
    @IBOutlet weak var holeLab2: UILabel!
    @IBOutlet weak var holeLab3: UILabel!
    @IBOutlet weak var holeLab4: UILabel!
    
    
    var Sponcers = [currentFarieDetails]()
    var service = [serviceProvider]()
    var exhibitors = [exhibitor]()
    var holes = [holeExhibitorNo]()
    var holes2 = [holeExhibitorNo2]()
    var holes3 = [holeExhibitorNo3]()
    var holes4 = [holeExhibitorNo4]()
    var mapCollection = [imgMapIllustration]()
    
    var ids = 0
    var timer = Timer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        bordercollection()
        handleRefreshSUpncer()
        handleRefreshExhibetor()
        handleRefreshServices()
        
        handleRefreshHolasOne()
        handleRefreshHolasTow()
        handleRefreshHolas3()
        handleRefreshHolas4()
        
        createHole1Piker()
        createHole2Piker()
        createHole3Piker()
        createHole4Piker()
        
        handleRefreshMapIllestration()
        
        
        self.name.text = singleItem?.title
        
        suponcerCollection.delegate = self
        suponcerCollection.dataSource = self
        
        exhibitorsCollection.delegate = self
        exhibitorsCollection.dataSource = self
        
        servicesCollection.delegate = self
        servicesCollection.dataSource = self
        
//        holeNumberFourTableView.delegate = self
//        holeNumberFourTableView.dataSource = self
//
//        holeNumber3TableView.delegate = self
//        holeNumber3TableView.dataSource = self
//
//        holeNumberTwoTableView.delegate = self
//        holeNumberTwoTableView.dataSource = self
//
//        holeNumberOneTableView.delegate = self
//        holeNumberOneTableView.dataSource = self
//
        mapIlestrationCollectionView.delegate = self
        mapIlestrationCollectionView.dataSource = self
        setupNavagtion()
        
        textEnabeld()
        
        SetupViedo()
        
        setUpTheView()
        
    }
    
    func setUpTheView(){
        self.holeLab1.text = singleItem?.hole1
        self.holeLab2.text = singleItem?.hole2
        self.holeLab3.text = singleItem?.hole3
        self.holeLab4.text = singleItem?.hole4
        
    }
    
    func SetupViedo() {
        if singleItem?.youtube == "" {
            self.imageBC.image = UIImage(named: "3")
            let s = ("\(URLs.mainImage)\(singleItem?.img ?? "")")
            let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
            let encodedURL = NSURL(string: encodedLink!)! as URL
            
            self.imageBC.kf.indicatorType = .activity
            if let url = URL(string: "\(encodedURL)") {
                print("g\(url)")
                self.imageBC.kf.setImage(with: url)
            }
            
        }else {
            self.imageBC.isHidden = true
            loadYoutube(videoID: singleItem?.youtube ?? "")
        }
    }
    
    func setupNavagtion(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    
    func textEnabeld() {
        if holes.isEmpty == true {
            holeNum1TF.isEnabled = false
        }else {
            holeNum1TF.isEnabled = true
        }
        
        if holes2.isEmpty == true {
            holeNum2TF.isEnabled = false
        }else {
            holeNum2TF.isEnabled = true
        }
        
        if holes3.isEmpty == true {
            holeNum3TF.isEnabled = false
        }else {
            holeNum3TF.isEnabled = true
        }
        if holes4.isEmpty == true {
            holeNum4TF.isEnabled = false
        }else {
            holeNum4TF.isEnabled = true
        }
    }
    
    
    func createHole1Piker(){
        let hole1 = UIPickerView()
        hole1.delegate = self
        hole1.dataSource = self
        hole1.tag = 0
        holeNum1TF.inputView = hole1
        handleRefreshHolasOne()
        hole1.reloadAllComponents()
    }
    
    func createHole2Piker(){
        let hole2 = UIPickerView()
        hole2.delegate = self
        hole2.dataSource = self
        hole2.tag = 1
        holeNum2TF.inputView = hole2
        handleRefreshHolasTow()
        hole2.reloadAllComponents()
    }
    
    func createHole3Piker(){
        let hole3 = UIPickerView()
        hole3.delegate = self
        hole3.dataSource = self
        hole3.tag = 2
        holeNum3TF.inputView = hole3
        handleRefreshHolas3()
        hole3.reloadAllComponents()
    }
    
    func createHole4Piker(){
        let hole4 = UIPickerView()
        hole4.delegate = self
        hole4.dataSource = self
        hole4.tag = 3
        holeNum4TF.inputView = hole4
        handleRefreshHolas4()
        hole4.reloadAllComponents()
    }
    
    
    func bordercollection(){
        
        mapIlestrationCollectionView.layer.cornerRadius = 5.0
        mapIlestrationCollectionView.layer.borderWidth = 2.0
        mapIlestrationCollectionView.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        
        
        suponcerCollection.layer.cornerRadius = 5.0
        suponcerCollection.layer.borderWidth = 2.0
        suponcerCollection.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        
        exhibitorsCollection.layer.cornerRadius = 5.0
        exhibitorsCollection.layer.borderWidth = 2.0
        exhibitorsCollection.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        
        servicesCollection.layer.cornerRadius = 5.0
        servicesCollection.layer.borderWidth = 2.0
        servicesCollection.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        
//        holeNumberOneTableView.layer.cornerRadius = 5.0
//        holeNumberOneTableView.layer.borderWidth = 2.0
//        holeNumberOneTableView.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
//
//        holeNumberTwoTableView.layer.cornerRadius = 5.0
//        holeNumberTwoTableView.layer.borderWidth = 2.0
//        holeNumberTwoTableView.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
//
//        holeNumber3TableView.layer.cornerRadius = 5.0
//        holeNumber3TableView.layer.borderWidth = 2.0
//        holeNumber3TableView.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
//
//        holeNumberFourTableView.layer.cornerRadius = 5.0
//        holeNumberFourTableView.layer.borderWidth = 2.0
//        holeNumberFourTableView.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
    }
    @IBAction func link360(_ sender: Any) {
        openUrl(urlStr: singleItem?.link360)
    }
    @IBAction func showViewerBTN(_ sender: Any) {
        performSegue(withIdentifier: "suge2", sender: nil)
    }
    
    @IBAction func registerVistor(_ sender: Any) {
        performSegue(withIdentifier: "suge", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? visitorsRegisterVC{
            destaiantion.id = singleItem?.id ?? 0
        }else if let destaiantion = segue.destination as? registerViewerVC{
            
            destaiantion.id = singleItem?.id ?? 0
        }else  if let destaiantion = segue.destination as? exhibitorsDetialsVC{
            destaiantion.id = singleItem?.id_user ?? ""
            destaiantion.farirId = singleItem?.id ?? 0
            destaiantion.ids = ids
            if let sub = sender as? exhibitor{
                destaiantion.singleItem = sub
            }else if let sub = sender as? holeExhibitorNo {
                destaiantion.singleItemHoela = sub
            }
        }
    }
    
    
    func openUrl(urlStr:String!) {
        
        if let url = NSURL(string:urlStr) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
        
    }
    
    func loadYoutube(videoID:String) {
        
        guard
            //            let newUrl = URLComponents(string: videoID)?.queryItems?.first(where: { $0.name == "v" })?.value
            //            print("xxxxxxxscsdsd\(newUrl ?? "")")
            let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)")
            else { return }
        wv.load( URLRequest(url: youtubeURL) )
    }
    
    
    @objc private func handleRefreshSUpncer() {
        API_CurrentFairs.suponcers(id_fair: singleItem?.id ?? 0){ (error: Error?, Sponcers: [currentFarieDetails]?) in
            if let Sponcers = Sponcers {
                self.Sponcers = Sponcers
                print("xxx\(self.Sponcers)")
                self.suponcerCollection.reloadData()
            }
        }
        
    }
    
    @objc private func handleRefreshMapIllestration() {
        print("xxzzzxxx")
        API_home.imageMaping(id_fair: singleItem?.id ?? 0){ (error: Error?, mapCollection: [imgMapIllustration]?) in
            if let mapCollection = mapCollection {
                print("xxzzzxxx")
                self.mapCollection = mapCollection
                print("xxx\(self.mapCollection)")
                self.mapIlestrationCollectionView.reloadData()
            }
        }
        
    }
    
    @objc private func handleRefreshHolasOne() {
        API_CurrentFairs.holeExhibitorNos(url: URLs.hole_exhibitor_No_1,id_fair: singleItem?.id ?? 0){ (error: Error?, holes: [holeExhibitorNo]?) in
            if let holes = holes {
                self.holes = holes
                print("xxx\(self.holes)")
                self.textEnabeld()
            }
        }
        
    }
    
    @objc private func handleRefreshHolasTow() {
        API_CurrentFairs.holeExhibitorNos2(url: URLs.hole_exhibitor_No_2,id_fair: singleItem?.id ?? 0){ (error: Error?, holes2: [holeExhibitorNo2]?) in
            if let holes2 = holes2 {
                self.holes2 = holes2
                print("xxx\(self.holes2)")
                self.textEnabeld()
            }
        }
        
    }
    
    
    @objc private func handleRefreshHolas3() {
        API_CurrentFairs.holeExhibitorNos3(url: URLs.hole_exhibitor_No_3,id_fair: singleItem?.id ?? 0){ (error: Error?, holes3: [holeExhibitorNo3]?) in
            if let holes3 = holes3 {
                self.holes3 = holes3
                print("xxx\(self.holes3)")
                self.textEnabeld()
            }
        }
        
    }
    
    @objc private func handleRefreshHolas4() {
        API_CurrentFairs.holeExhibitorNos4(url: URLs.hole_exhibitor_No_4,id_fair: singleItem?.id ?? 0){ (error: Error?, holes4: [holeExhibitorNo4]?) in
            if let holes4 = holes4 {
                self.holes4 = holes4
                print("xxx\(self.holes4)")
                self.textEnabeld()
            }
        }
        
    }
    
    @objc private func handleRefreshExhibetor() {
        print("xxxxxxx")
        API_CurrentFairs.exhibitos(id_user: singleItem?.id_user ?? ""){ (error: Error?, exhibitors: [exhibitor]?) in
            if let exhibitors = exhibitors {
                self.exhibitors = exhibitors
                print("xxx\(self.exhibitors)")
                self.exhibitorsCollection.reloadData()
//                DispatchQueue.main.async {
//                    self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
//                }
            }
        }
    }
    
    @objc func changeImage() {
        
        if counter < exhibitors.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.exhibitorsCollection.scrollToItem(at: index, at: .centeredVertically, animated: true)
            //pageView.currentPage = counter
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.exhibitorsCollection.scrollToItem(at: index, at: .centeredVertically, animated: false)
            //pageView.currentPage = counter
            counter = 1
        }
        
    }
    
    @objc private func handleRefreshServices() {
        print("xxxxxxx")
        API_CurrentFairs.services(id_fair: singleItem?.id ?? 0){ (error: Error?, service: [serviceProvider]?) in
            if let service = service {
                self.service = service
                print("xxx\(self.service)")
                self.servicesCollection.reloadData()
            }
        }
    }
    
}

extension underConstrFairDetailsVC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return Sponcers.count
        }else if collectionView.tag == 6 {
            return mapCollection.count
        }else if collectionView.tag == 1 {
            return exhibitors.count
        }else {
            return service.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0{
            if let cell = suponcerCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? curentFarieDetialsCell {
                let iamge = Sponcers[indexPath.item]
                cell.configuerCell(item: iamge)
                return cell
            }else {
                return curentFarieDetialsCell()
            }
        }else if collectionView.tag == 1 {
            if let cell = exhibitorsCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? exhibitorsCell {
                let iamge = exhibitors[indexPath.item]
                cell.configuerCell(item: iamge)
                return cell
            }else {
                return exhibitorsCell()
            }
        }else if collectionView.tag == 6 {
            if let cell = mapIlestrationCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? mapIllustrationCell {
                let iamge = mapCollection[indexPath.item]
                cell.configuerCell(item: iamge)
                return cell
            }else {
                return mapIllustrationCell()
            }
        }else {
            if let cell = servicesCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? serviceProviderCell {
                let iamge = service[indexPath.item]
                cell.configuerCell(item: iamge)
                return cell
            }else {
                return serviceProviderCell()
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 0{
            return CGSize(width: 165, height: 165)
        }else if collectionView.tag == 1  {
            let screenWidth = collectionView.frame.width
            
            var width = (screenWidth-30)/2
            
            width = width < 130 ? 160 : width
            
            return CGSize.init(width: width, height: width)
        }else if collectionView.tag == 6 {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }else {
            return CGSize(width: 165, height: 165)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 1 {
            performSegue(withIdentifier: "sugex", sender: exhibitors[indexPath.row])
        }
    }
}


//extension underConstrFairDetailsVC: UITableViewDelegate,UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if tableView.tag == 0 {
//            return holes.count
//        }else if tableView.tag == 1{
//            return holes.count
//        }else if tableView.tag == 2{
//            return holes.count
//        }else {
//            return holes.count
//        }
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if tableView.tag == 0 {
//            if let cell = holeNumberOneTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? hoallNumberCell {
//                let iamge = holes[indexPath.item]
//                cell.configuerCell(item: iamge)
//                return cell
//            }else {
//                return hoallNumberCell()
//            }
//        }else if tableView.tag == 1{
//            if let cell = holeNumberTwoTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? hoallNumberCell {
//                let iamge = holes[indexPath.item]
//                cell.configuerCell(item: iamge)
//                return cell
//            }else {
//                return hoallNumberCell()
//            }
//        }else if tableView.tag == 2{
//            if let cell = holeNumber3TableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? hoallNumberCell {
//                let iamge = holes[indexPath.item]
//                cell.configuerCell(item: iamge)
//                return cell
//            }else {
//                return hoallNumberCell()
//            }
//        }else {
//            if let cell = holeNumberFourTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? hoallNumberCell {
//                let iamge = holes[indexPath.item]
//                cell.configuerCell(item: iamge)
//                return cell
//            }else {
//                return hoallNumberCell()
//            }
//        }
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "sugeHole", sender: holes[indexPath.row])
//    }
//}


extension underConstrFairDetailsVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0{
            return holes.count
        }else if pickerView.tag == 1{
            return holes2.count
        }else if pickerView.tag == 2 {
            return holes3.count
        }else if pickerView.tag == 3 {
            return holes4.count
        }else {
            return holes4.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0{
            return holes[row].title
        }else if pickerView.tag == 1{
            return holes2[row].title
        }else if pickerView.tag == 2 {
            return holes3[row].title
        }else if pickerView.tag == 3{
            return holes4[row].title
        }else {
            return holes4[row].title
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0{
            self.ids = holes[row].id
            performSegue(withIdentifier: "sugeHole", sender: nil)
            self.view.endEditing(false)
        }else if pickerView.tag == 1{
            self.ids = holes2[row].id
            performSegue(withIdentifier: "sugeHole", sender: nil)
            self.view.endEditing(false)
        }else if pickerView.tag == 2 {
            self.ids = holes3[row].id
            performSegue(withIdentifier: "sugeHole", sender: nil)
            self.view.endEditing(false)
        }else if pickerView.tag == 3{
            self.ids = holes4[row].id
            performSegue(withIdentifier: "sugeHole", sender: nil)
            self.view.endEditing(false)
        }else {
            performSegue(withIdentifier: "sugeHole", sender: holes4[row])
            self.view.endEditing(false)
        }
    }
}
