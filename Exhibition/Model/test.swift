//
//  test.swift
//  Exhibition
//
//  Created by Farido on 7/15/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import UIKit

class banners: NSObject {
    
    var image: String
    
    init?(dict: [String: JSON]){
        
        guard let image = dict["image"]?.string else {return nil}
        self.image = image
        
    }
}


class API_Test: NSObject {
    
    class func banner (completion: @escaping (_ error: Error?,_ sparParts: [banners]?)-> Void) {
        
        let url = "http://www.dietfoodksa.com/site/public/api/banners"
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard let dataArray = json["message"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [banners]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = banners.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
}




class BannerCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    func configuerCell(prodect: banners) {
        
        imageView.image = UIImage(named: "3")
        let s = ("http://WWW.dietfoodksa.com/site\(prodect.image)")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        imageView.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            imageView.kf.setImage(with: url)
            //imageView.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "3"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
}
