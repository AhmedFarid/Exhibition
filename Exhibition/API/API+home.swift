//
//  API+home.swift
//  Exhibition
//
//  Created by Farido on 5/22/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire


class API_home: NSObject {
    
    class func supernew(completion: @escaping (_ error: Error?,_ sparParts: [superNews]?)-> Void) {
        
        let url = URLs.supernews
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang
        ]
        
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
                var products = [superNews]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = superNews.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func superPanner (completion: @escaping (_ error: Error?,_ sparParts: [superBanners]?)-> Void) {
        
        let url = URLs.superPanner
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang
        ]
        
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
                var products = [superBanners]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = superBanners.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func CurrentFair (completion: @escaping (_ error: Error?,_ sparParts: [currentFaire]?)-> Void) {
        
        let url = URLs.current_fair
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang
        ]
        
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
                var products = [currentFaire]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = currentFaire.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func CurrentFairSearch (key: String,completion: @escaping (_ error: Error?,_ sparParts: [currentFaire]?)-> Void) {
        
        let url = URLs.search_current_fair
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang,
            "key": key
        ]
        
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
                var products = [currentFaire]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = currentFaire.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func lastfairs (completion: @escaping (_ error: Error?,_ sparParts: [currentFaire]?)-> Void) {
        
        let url = URLs.last_fair
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang
        ]
        
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
                var products = [currentFaire]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = currentFaire.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func underconstFair (completion: @escaping (_ error: Error?,_ sparParts: [underconstructionFair]?)-> Void) {
        
        let url = URLs.underconstruction_fair
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang
        ]
        
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
                var products = [underconstructionFair]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = underconstructionFair.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func categoryProvid (completion: @escaping (_ error: Error?,_ sparParts: [categoryProvider]?)-> Void) {
        
        let url = URLs.category_provider
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang
        ]
        
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
                var products = [categoryProvider]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = categoryProvider.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    
    class func jop (completion: @escaping (_ error: Error?,_ sparParts: [jops]?)-> Void) {
        
        let url = URLs.jobs
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang
        ]
        
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
                var products = [jops]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = jops.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    
    class func career_exhibitors (id_user: String, fairs_id: String ,completion: @escaping (_ error: Error?,_ sparParts: [jops]?)-> Void) {
        
        let url = URLs.career_exhibitors
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang,
            "id_user": id_user,
            "fairs_id": fairs_id
        ]
        
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
                var products = [jops]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = jops.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func categiroProivderDetials(id: Int, completion: @escaping (_ error: Error?, _ success: Bool,_ status: Bool?, _ title: String?,_ description: String?,_ img: String?, _ errors: String?)->Void) {
        
        let url = URLs.category_provider_details
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        
        print(url)
        let parameters = [
            "id": id,
            "lang": lang
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
                        let description = json["data"][0]["description"].string
                        let img = json["data"][0]["img"].string
                        print(title ?? "")
                        completion(nil, true,status,title,description,img,nil)
                    }else {
                        let errors = json["error"].string
                        print(errors ?? "no")
                        completion(nil, false,status,nil,nil,nil,errors)
                    }
                }
                
            }
        }
    }
    
    
    class func categoryProviderDetail (id: Int ,completion: @escaping (_ error: Error?,_ sparParts: [categoryProviderDetails]?)-> Void) {
        
        let url = URLs.category_provider_details
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang,
            "id": id,
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
                var products = [categoryProviderDetails]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = categoryProviderDetails.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func imageMaping (id_fair: Int ,completion: @escaping (_ error: Error?,_ sparParts: [imgMapIllustration]?)-> Void) {
        
        let url = URLs.img_map_Illustration
        let lang = NSLocalizedString("en", comment: "profuct list lang")
        let parameters = [
            "lang": lang,
            "id_fair": id_fair,
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
                var products = [imgMapIllustration]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = imgMapIllustration.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
}
