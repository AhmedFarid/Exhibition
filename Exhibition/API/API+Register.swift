//
//  API+Register.swift
//  Exhibition
//
//  Created by Farido on 5/26/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API_Register: NSObject {
    
    class func registerVistor(name: String,email: String,phone: String, fairs_id: Int, completion: @escaping (_ error: Error?, _ success: Bool,_ status: Bool?, _ title: String?,_ QRcode: String?,_ phone: String?, _ errors: String?)->Void) {
        
        let url = URLs.visitors
        
        print(url)
        let parameters = [
            "name": name,
            "email": email,
            "phone": phone,
            "fairs_id": fairs_id
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
                        let title = json["data"][0]["title"].string
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
    
    class func registerViewer(name: String,email: String,phone: String, fairs_id: Int,id_partion: String, completion: @escaping (_ error: Error?, _ success: Bool,_ status: Bool?, _ title: String?,_ QRcode: String?,_ phone: String?, _ errors: String?)->Void) {
        
        let url = URLs.visitors
        
        print(url)
        let parameters = [
            "name": name,
            "email": email,
            "phone": phone,
            "id_partion":id_partion,
            "fairs_id": fairs_id
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
                        let title = json["data"][0]["title"].string
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
    
    
    class func OwnerFairRequest(name: String,email: String,phone: String, date_from: String,date_to: String,message: String,location: String, completion: @escaping (_ error: Error?, _ success: Bool,_ status: Bool?, _ title: String?,_ QRcode: String?,_ phone: String?, _ errors: String?)->Void) {
        
        let url = URLs.super_OwnerFairRequest
        
        print(url)
        let parameters = [
            "name": name,
            "email": email,
            "phone": phone,
            "date_from": date_from,
            "date_to": date_to,
            "message": message,
            "location": location
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
                        print(title ?? "")
                        completion(nil, true,status,title,nil,nil,nil)
                    }else {
                        let errors = json["error"].string
                        print(errors ?? "no")
                        completion(nil, false,status,nil,nil,nil,errors)
                    }
                }
                
            }
        }
    }
    
    class func servicesProvider(name: String,email: String,phone: String,message: String,reason: String, completion: @escaping (_ error: Error?, _ success: Bool,_ status: Bool?, _ title: String?,_ QRcode: String?,_ phone: String?, _ errors: String?)->Void) {
        
        let url = URLs.request_services_provider
        
        print(url)
        let parameters = [
            "name": name,
            "email": email,
            "phone": phone,
            "message": message,
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
                        print(title ?? "")
                        completion(nil, true,status,title,nil,nil,nil)
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
