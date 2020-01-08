//
//  API+Menue.swift
//  Exhibition
//
//  Created by Farido on 5/28/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API_Menue: NSObject {
    
    class func aboutUs (completion: @escaping (_ error: Error?, _ success: Bool,_ status: Bool?, _ title: String?,_ QRcode: String?,_ phone: String?, _ errors: String?)->Void) {
        
        let url = URLs.super_abouts
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        
        print(url)
        let parameters = [
            "lang": lang,
            ] as [String : Any]
        
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false,false,nil,nil,nil,nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(json)
                if let status = json["status"].bool {
                    if status == true{
                        let title = json["data"][0]["description"].string
                        let QRcode = json["data"][0]["QRcode"].string
                        let phone = json["data"][0]["phone"].string
                        print(title ?? "")
                        completion(nil, true,status,title,QRcode,phone,nil)
                    }else {
                        let errors = json["error"].string
                        print(errors ?? "no")
                        completion(nil, false,status,nil,nil,nil,errors)
                    }
                }
                
            }
        }
    }
    
    class func counectUs(name: String,email: String,phone: String, message: String,reason: String, completion: @escaping (_ error: Error?, _ success: Bool,_ status: Bool?, _ title: String?,_ QRcode: String?,_ phone: String?, _ errors: String?)->Void) {
        
        let url = URLs.super_inbox
        
        print(url)
        let parameters = [
            "name": name,
            "email": email,
            "phone": phone,
            "message":message,
            "reason": reason
            ] as [String : Any]
        
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false,false,nil,nil,nil,nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(json)
                if let status = json["status"].bool {
                    if status == true{
                        let title = json["data"].string
                        let QRcode = json["data"][0]["QRcode"].string
                        let phone = json["data"][0]["phone"].string
                        print(title ?? "")
                        completion(nil, true,status,title,QRcode,phone,nil)
                    }else {
                        let errors = json["error"].string
                        print(errors ?? "no")
                        completion(nil, false,status,nil,nil,nil,errors)
                    }
                }
                
            }
        }
    }
    
    
    
    

}
