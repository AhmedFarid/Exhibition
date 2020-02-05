//
//  exhibitorsDetialsVC.swift
//  Exhibition
//
//  Created by Farido on 5/29/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import WebKit
import MessageUI
import SafariServices

class 	exhibitorsDetialsVC: UIViewController,MFMailComposeViewControllerDelegate,SFSafariViewControllerDelegate  {
    
    
    
    @IBOutlet weak var youTubeLink: WKWebView!
    @IBOutlet weak var titile: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var site: UILabel!
    @IBOutlet weak var prodectCollection: UICollectionView!
    @IBOutlet weak var EShopCollection: UICollectionView!
    @IBOutlet weak var prodectLabel: UILabel!
    @IBOutlet weak var eShopLable: UILabel!
    @IBOutlet weak var imageBC: UIImageView!
    
    //@IBOutlet weak var addressx: UILabel!
    
    var singleItem: exhibitor?
    var singleItemHoela: holeExhibitorNo?
    var id: String?
    var farirId: Int?
    var x = 0
    var exhibtoreServices = [servicesExhibitors]()
    var exhibtoreProdect = [productExhibitors]()
    var phones = ""
    var emailex = ""
    var sitex = ""
    var fB = ""
    var twiteer = ""
    var snap = ""
    var youtubr = ""
    var insta = ""
    var map = ""
    var locationInExhibation = ""
    var link360 = ""
    var des = ""
    var ids = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        print(farirId ?? 0)
        x = singleItem?.id ?? 0
        print(x)
        handleRefreshServicesExh()
        handleRefreshProductExh()
        
        
        prodectCollection.delegate = self
        prodectCollection.dataSource = self
        
        EShopCollection.delegate = self
        EShopCollection.dataSource = self
        
    }
    
    func loadYoutube(videoID:String) {
        guard
            let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)")
            else { return }
        youTubeLink.load( URLRequest(url: youtubeURL) )
    }
    
    
    @IBAction func emalieBTN(_ sender: Any) {
        openUrl(urlStr: emailex)
    }
    
    
    
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["\(emailex)"])
            mail.setMessageBody("", isHTML: true)
            
            present(mail, animated: true)
        } else {
            // show failure alert
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    
    @IBAction func desBtn(_ sender: Any) {
        //
        performSegue(withIdentifier: "suger", sender: des)
        
    }
    
    @IBAction func snapBtn(_ sender: Any) {
        openUrl(urlStr: snap)
    }
    
    @IBAction func faceBTN(_ sender: Any) {
        openUrl(urlStr: fB)
    }
    @IBAction func twitterBTN(_ sender: Any) {
        openUrl(urlStr: twiteer)
    }
    @IBAction func youtubBTN(_ sender: Any) {
        openUrl(urlStr: youtubr)
    }
    
    @IBAction func instaBTN(_ sender: Any) {
        openUrl(urlStr: insta)
    }
    
    
    @IBAction func mapBTN(_ sender: Any) {
        performSegue(withIdentifier: "sugex", sender: map)
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
           controller.dismiss(animated: true, completion: nil)
       }
    
    
    
    @IBAction func opnLinkWebSite(_ sender: Any) {
         let safariVC = SFSafariViewController(url: NSURL(string:"http://" + sitex)! as URL)
                self.present(safariVC, animated: true, completion: nil)
                safariVC.delegate = self
        //        print(emailex)
        //        openUrl(urlStr: emailex)
    }
    
    @IBAction func openLink(_ sender: Any) {
        let safariVC = SFSafariViewController(url: NSURL(string:"http://" + emailex)! as URL)
        self.present(safariVC, animated: true, completion: nil)
        safariVC.delegate = self
//        print(emailex)
//        openUrl(urlStr: emailex)
    }
    
    @IBAction func phoneCallBTN(_ sender: Any) {
        guard let number = URL(string: "tel://" + phones) else { return }
        UIApplication.shared.open(number)

    }
    
    @IBAction func webSiteLinkBTN(_ sender: Any) {
         openUrl(urlStr: sitex)
    }
    
    @IBAction func linl360Btn(_ sender: Any) {
        openUrl(urlStr: link360)
    }
    
    @IBAction func whatsAppBtton(_ sender: Any) {
        let urlWhats = "whatsapp://send?phone=\(phone.text ?? "")&text=***"
        
        var characterSet = CharacterSet.urlQueryAllowed
        characterSet.insert(charactersIn: "?&")
        
        if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: characterSet){
            
            if let whatsappURL = NSURL(string: urlString) {
                if UIApplication.shared.canOpenURL(whatsappURL as URL){
                    UIApplication.shared.openURL(whatsappURL as URL)
                }
                else {
                    print("Install Whatsapp")
                    
                }
            }
        }
    }
    
    @IBAction func jops(_ sender: Any) {
        performSegue(withIdentifier: "suge", sender: nil)
    }
    
    @IBAction func exhibtionLoaction(_ sender: Any) {
        performSegue(withIdentifier: "sugex", sender: locationInExhibation)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? carresVC{
            destaiantion.id_user = "\(singleItem?.id ?? 0)"
            destaiantion.fairs_id = "\(farirId ?? 0)"
        }else if let destenation = segue.destination as? webFrameVC {
            destenation.x = sender as! String
        }else if let destenation = segue.destination as? aboutUsVC {
            destenation.dataDes = sender as! String
            destenation.id = "\(farirId ?? 0)"
        }else if let destenation = segue.destination as? imageViewVM {
            destenation.singleItme = sender as? servicesExhibitors
            destenation.singleItem2 = sender as? productExhibitors
        }
    }
    
    
    @objc private func handleRefreshServicesExh() {
        API_CurrentFairs.servicesExhibitor(fairs_id: farirId ?? 0, id_user: singleItem?.id ?? ids){ (error: Error?, exhibtoreServices: [servicesExhibitors]?) in
            if let exhibtoreServices = exhibtoreServices {
                self.exhibtoreServices = exhibtoreServices
                print("xxx\(self.exhibtoreServices)")
                self.prodectCollection.reloadData()
                //self.startTimer()
            }
        }
        
    }
    
    @objc private func handleRefreshProductExh() {
        API_CurrentFairs.productExhibitor(fairs_id: farirId ?? 0, id_user: singleItem?.id ?? ids ){ (error: Error?, exhibtoreProdect: [productExhibitors]?) in
            if let exhibtoreProdect = exhibtoreProdect {
                self.exhibtoreProdect = exhibtoreProdect
                print("xxx\(self.exhibtoreProdect)")
                self.EShopCollection.reloadData()
                //self.startTimer()
            }
        }
        
    }
    
    func openUrl(urlStr:String!) {
        
        guard let url = URL(string: urlStr) else {
          return //be safe
        }

        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
        
        
    }
    
    
    func getData() {
//        class func exhibitorsDetials(id_user: Int, completion: @escaping (_ error: Error?, _ success: Bool,_ status: Bool?, _ id_exhibitor: String?,_ email: String?,_ link_map: String?,_ website_link: String?,_ youtube_link:String?,_ address: String?,_ phone: String?,_ snap_link: String?,_ instgram_link: String?, _ tweeter_link: String?, _ facebook_link: String?, _ map_fair: String?,_ : String?,_ : String?, _ : String?,_ : String?, _ errors: String?)->Void)
//
        API_CurrentFairs.exhibitorsDetials(id_user: singleItem?.id ?? ids){ (erroe: Error?, Success,status ,id_exhibitor,email,link_map,website_link, youtube_link,address,phone,snap_link,instgram_link,tweeter_link,facebook_link,map_fair,img2,tit_ser,tit_prod,map_3D,des,youtube,errors)  in
            if Success {
                if status == true {
                    self.titile.text = self.singleItem?.name ?? ""
                    self.address.text = address ?? ""
                    self.phone.text = phone ?? ""
                    self.phones = phone ?? ""
                    self.email.text = email ?? ""
                    self.emailex = email ?? ""
                    self.site.text = website_link ?? ""
                    self.sitex = website_link ?? ""
                    self.fB = facebook_link ?? ""
                    self.twiteer = tweeter_link ?? ""
                    self.snap = snap_link ?? ""
                    self.youtubr = youtube_link ?? ""
                    self.insta = instgram_link ?? ""
                    self.map = map_fair ?? ""
                    self.prodectLabel.text = tit_ser ?? ""
                    self.eShopLable.text = tit_prod ?? ""
                    self.locationInExhibation = link_map ?? ""
                    self.link360 = map_3D ?? ""
                    self.des = des ?? ""
                    if youtube == nil {
                        self.imageBC.image = UIImage(named: "3")
                        let s = ("\(URLs.mainImage)\(img2 ?? "")")
                        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
                        let encodedURL = NSURL(string: encodedLink!)! as URL
                        
                        self.imageBC.kf.indicatorType = .activity
                        if let url = URL(string: "\(encodedURL)") {
                            print("g\(url)")
                            self.imageBC.kf.setImage(with: url)
                        }
                        
                    }else {
                        self.imageBC.isHidden = true
                        self.loadYoutube(videoID: youtube ?? "")
                    }
                }else {
                    
                }
            }else{
            }
        }
    }
}

extension exhibitorsDetialsVC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0{
            return exhibtoreServices.count
        }else {
            return exhibtoreProdect.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
            if let cell = prodectCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? servicesExhibitorsCell {
                let iamge = exhibtoreServices[indexPath.item]
                cell.configuerCell(item: iamge)
                return cell
            }else {
                return servicesExhibitorsCell()
            }
        }else {
            if let cell = EShopCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? prodectExhibterCell {
                let iamge = exhibtoreProdect[indexPath.item]
                cell.configuerCell(item: iamge)
                return cell
            }else {
                return prodectExhibterCell()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 0 {
        let screenWidth = collectionView.frame.width
        
        var width = (screenWidth-30)/2
        
        width = width < 160 ? 200 : width
        
        return CGSize.init(width: width, height: width)
        }else {
            let screenWidth = collectionView.frame.width
            
            var width = (screenWidth-30)/2
            
            width = width < 160 ? 200 : width
            
            return CGSize.init(width: width, height: width)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 0{
            performSegue(withIdentifier: "sugeImage", sender: exhibtoreServices[indexPath.item])
        }else {
            performSegue(withIdentifier: "sugeImage", sender: exhibtoreProdect[indexPath.item])
        }
    }
}
