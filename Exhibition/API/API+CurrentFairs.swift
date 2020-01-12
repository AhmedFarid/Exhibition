//
//  API+CurrentFairs.swift
//  Exhibition
//
//  Created by Farido on 5/23/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class API_CurrentFairs: NSObject {
    
    class func suponcers (id_fair: Int, completion: @escaping (_ error: Error?,_ sparParts: [currentFarieDetails]?)-> Void) {
        
        let url = URLs.sponser_fairs
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang,
            "id_fair": id_fair
            ] as [String : Any]
        
        print(parameters)
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard let dataArray = json["data"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [currentFarieDetails]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = currentFarieDetails.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func exhibitos (id_user: String, completion: @escaping (_ error: Error?,_ sparParts: [exhibitor]?)-> Void) {
        
        let url = URLs.exhibitors
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang,
            "id_user": id_user
            ] as [String : Any]
        
        print(parameters)
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard let dataArray = json["data"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [exhibitor]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = exhibitor.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    
    class func services (id_fair: Int, completion: @escaping (_ error: Error?,_ sparParts: [serviceProvider]?)-> Void) {
        
        let url = URLs.service_provider_fairs
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang,
            "id_fair": id_fair
            ] as [String : Any]
        
        print(parameters)
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard let dataArray = json["data"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [serviceProvider]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = serviceProvider.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func holeExhibitorNos (url:String ,id_fair: Int, completion: @escaping (_ error: Error?,_ sparParts: [holeExhibitorNo]?)-> Void) {
        
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang,
            "id_fair": id_fair
            ] as [String : Any]
        
        print(parameters)
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard let dataArray = json["data"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [holeExhibitorNo]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = holeExhibitorNo.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    
    class func holeExhibitorNos2 (url:String ,id_fair: Int, completion: @escaping (_ error: Error?,_ sparParts: [holeExhibitorNo2]?)-> Void) {
        
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang,
            "id_fair": id_fair
            ] as [String : Any]
        
        print(parameters)
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard let dataArray = json["data"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [holeExhibitorNo2]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = holeExhibitorNo2.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func holeExhibitorNos3 (url:String ,id_fair: Int, completion: @escaping (_ error: Error?,_ sparParts: [holeExhibitorNo3]?)-> Void) {
        
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang,
            "id_fair": id_fair
            ] as [String : Any]
        
        print(parameters)
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard let dataArray = json["data"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [holeExhibitorNo3]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = holeExhibitorNo3.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func holeExhibitorNos4 (url:String ,id_fair: Int, completion: @escaping (_ error: Error?,_ sparParts: [holeExhibitorNo4]?)-> Void) {
        
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang,
            "id_fair": id_fair
            ] as [String : Any]
        
        print(parameters)
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard let dataArray = json["data"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [holeExhibitorNo4]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = holeExhibitorNo4.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func availablePartitio (id_fair: Int, completion: @escaping (_ error: Error?,_ sparParts: [availablePartitions]?)-> Void) {
        
        let url = URLs.available_partitions
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang,
            "id_fair": id_fair
            ] as [String : Any]
        
        print(parameters)
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard let dataArray = json["data"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [availablePartitions]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = availablePartitions.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    
    class func servicesExhibitor (fairs_id: Int,id_user: Int, completion: @escaping (_ error: Error?,_ sparParts: [servicesExhibitors]?)-> Void) {
        
        let url = URLs.services_exhibitors
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang,
            "fairs_id": fairs_id,
            "id_user": id_user
            ] as [String : Any]
        
        print(parameters)
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard let dataArray = json["data"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [servicesExhibitors]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = servicesExhibitors.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func productExhibitor (fairs_id: Int,id_user: Int, completion: @escaping (_ error: Error?,_ sparParts: [productExhibitors]?)-> Void) {
        
        let url = URLs.product_exhibitors
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang,
            "fairs_id": fairs_id,
            "id_user": id_user
            ] as [String : Any]
        
        print(parameters)
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard let dataArray = json["data"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [productExhibitors]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = productExhibitors.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func exhibitorsDetials(id_user: Int, completion: @escaping (_ error: Error?, _ success: Bool,_ status: Bool?, _ id_exhibitor: String?,_ email: String?,_ link_map: String?,_ website_link: String?,_ youtube_link:String?,_ address: String?,_ phone: String?,_ snap_link: String?,_ instgram_link: String?, _ tweeter_link: String?, _ facebook_link: String?, _ map_fair: String?,_ img2: String?,_ tit_ser: String?, _ tit_prod: String?,_ map_3D: String?,_ des: String?,_ youtube: String?,  _ errors: String?)->Void) {
        
        let url = URLs.exhibitors_detials
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        print(url)
        let parameters = [
            "id_user": id_user,
            "lang": lang
            ] as [String : Any]
        
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false,false,nil,nil,nil,nil, nil, nil, nil, nil, nil, nil,nil,nil,nil,nil,nil,nil,nil,nil,nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(json)
                if let status = json["status"].bool {
                    if status == true{
                        let id_exhibitor = json["data"][0]["id_exhibitor"].string
                        let map_fair = json["data"][0]["map_fair"].string
                        let facebook_link = json["data"][0]["facebook_link"].string
                        let tweeter_link = json["data"][0]["tweeter_link"].string
                        let instgram_link = json["data"][0]["instgram_link"].string
                        let snap_link = json["data"][0]["snap_link"].string
                        let email = json["data"][0]["ecommerc_link"].string
                        let link_map = json["data"][0]["link_map"].string
                        let website_link = json["data"][0]["website_link"].string
                        let youtube_link = json["data"][0]["youtube_link"].string
                        let address = json["data"][0]["address"].string
                        let phone = json["data"][0]["phone"].string
                        let img2 = json["data"][0]["img2"].string
                        let tit_ser = json["data"][0]["tit_ser"].string
                        let tit_prod = json["data"][0]["tit_prod"].string
                        let map_3D = json["data"][0]["map_3D"].string
                        let des = json ["data"][0]["description"].string
                        let youtube = json["data"][0]["youtube"].string
                        print(phone ?? "")
                        completion(nil, true,status,id_exhibitor,email,link_map,website_link,youtube_link,address,phone,snap_link,instgram_link,tweeter_link,facebook_link,map_fair,img2,tit_ser,tit_prod,map_3D,des,youtube,nil)
                    }else {
                        let errors = json["error"].string
                        print(errors ?? "no")
                        completion(nil, false,false,nil,nil,nil,nil, nil, nil, nil,nil, nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,errors)
                    }
                }
                
            }
        }
    }
}
