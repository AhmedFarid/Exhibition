//
//  homes.swift
//  Exhibition
//
//  Created by Farido on 5/22/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import SwiftyJSON

class superNews: NSObject {
    
    var img: String
    var title: String
    var descripti: String
    
    init?(dict: [String: JSON]){
        guard let img = dict["img"]?.string,let title = dict["title"]?.string,let descripti = dict["description"]?.string else {return nil}
        self.img = img
        self.title = title
        self.descripti = descripti
    }
}

class superBanners: NSObject {
    
    var img: String
    var title: String
    var date: String?
    var descripti: String
    
    init?(dict: [String: JSON]){
        
        if let img = dict["img"]?.string {
            self.img = img
        }else {
            self.img = ""
        }
        if let title = dict["title"]?.string {
            self.title = title
        }else {
            self.title = ""
        }
        
        if let date = dict["date"]?.string {
            self.date = date
        }else {
            self.date = ""
        }
        
        if let descripti = dict["descripti"]?.string {
            self.descripti = descripti
        }else {
            self.descripti = ""
        }
//        guard let img = dict["img"]?.string,let title = dict["title"]?.string,let descripti = dict["description"]?.string,let date = dict["date"]?.string else {return nil}
//        self.img = img
//        self.title = title
//        self.descripti = descripti
//        self.date = date
    }
}


//
//"id": 27,
//"id_user": "50",
//"title": "المعرض الألكتروني لجائزة أصيل للتميز",
//"link360": "https://developers.google.com/vr/discover/360-degree-media#common_formats",
//"description": "معرض يعرف بجائزة أصيل للتميز   ويبرز مبادرات المدارس الأهلية فيها .",
//"youtube": false,
//"img": "/uploads/BcCnCS3S0GQgFAdJodLdT4Y59QPAviKcFiMCsxV9.jpeg",
//"logo": "/uploads/Mozg6nDiyl9gsEdtWvhDawtxj9M9F4oxbgckB9aj.jpeg",
//"address": "",
//"phone": "",
//"start_date": "2019-05-04",
//"end_date": "2020-05-04"

//"id": 17,
//"id_user": "36",
//"title": "معرض الصقور والصيد",
//"link360": "https://developers.google.com/vr/discover/360-degree-media#common_formats",
//"description": "",
//"youtube": false,
//"img": "/uploads/ovYt1BUPvL6SFLsscoHAN5TWvu7XnfWvfpykezOM.jpeg",
//"logo": "/uploads/g3d36iqZeDydFK94qBOld5I8IqYbio1SHuGEiR54.png",
//"address": "الرياض-حي العاصمه",
//"phone": "9661234567890",
//"start_date": "2018-10-11",
//"end_date": "2018-12-08"

class currentFaire: NSObject {
    
    var id: Int
    var id_user: String
    var title: String
    var link360: String
    var descriptio: String
    var img: String?
    var logo: String
    var address: String
    var phone: String
    var start_date: String?
    var end_date: String
    var youtube: String
    var hole1: String
    var hole2: String
    var hole3: String
    var hole4: String

    
    init?(dict: [String: JSON]){
        

        if let youtube = dict["youtube"]?.string {
            self.youtube = youtube
        }else {
            self.youtube = ""
        }
        if let link360 = dict["link360"]?.string {
            self.link360 = link360
        }else {
            self.link360 = ""
        }
        
        if let logo = dict["logo"]?.string {
            self.logo = logo
        }else {
            self.logo = ""
        }
        
        if let hole1 = dict["hole1"]?.string {
            self.hole1 = hole1
        }else {
            self.hole1 = ""
        }
        
        if let hole2 = dict["hole2"]?.string {
            self.hole2 = hole2
        }else {
            self.hole2 = ""
        }
        if let hole3 = dict["hole3"]?.string {
            self.hole3 = hole3
        }else {
            self.hole3 = ""
        }
        
        if let hole4 = dict["hole4"]?.string {
            self.hole4 = hole4
        }else {
            self.hole4 = ""
        }
        
//        if let img = dict["img"]?.string {
//            self.img = img
//        }else {
//            self.img = ""
//        }
        
        
        
        guard let id = dict["id"]?.int,let id_user = dict["id_user"]?.string,let title = dict["title"]?.string,let descriptio = dict["description"]?.string,let img = dict["img"]?.string,let address = dict["address"]?.string,let phone = dict["phone"]?.string,let start_date = dict["start_date"]?.string,let end_date = dict["end_date"]?.string else {return nil}
        self.id = id
        self.title = title
        self.id_user = id_user
        self.descriptio = descriptio
        self.img = img
        self.address = address
        self.phone = phone
        self.start_date = start_date
        self.end_date = end_date
    }
}


class underconstructionFair: NSObject {
    
    var id: Int
    var id_user: String
    var title: String
    var link360: String
    var descriptio: String
    var img: String?
    var logo: String
    var address: String
    var phone: String
    var start_date: String?
    var end_date: String
    var youtube: String
    var hole1: String
    var hole2: String
    var hole3: String
    var hole4: String

    
    init?(dict: [String: JSON]){
        
        
        if let youtube = dict["youtube"]?.string {
            self.youtube = youtube
            
        }else {
            self.youtube = ""
        }
        
        if let link360 = dict["link360"]?.string {
            self.link360 = link360
        }else {
            self.link360 = ""
        }
        
        if let hole1 = dict["hole1"]?.string {
            self.hole1 = hole1
        }else {
            self.hole1 = ""
        }
        
        if let hole2 = dict["hole2"]?.string {
            self.hole2 = hole2
        }else {
            self.hole2 = ""
        }
        if let hole3 = dict["hole3"]?.string {
            self.hole3 = hole3
        }else {
            self.hole3 = ""
        }
        
        if let hole4 = dict["hole4"]?.string {
            self.hole4 = hole4
        }else {
            self.hole4 = ""
        }
        
        guard let id = dict["id"]?.int,let id_user = dict["id_user"]?.string,let title = dict["title"]?.string,let descriptio = dict["description"]?.string,let img = dict["img"]?.string,let logo = dict["logo"]?.string,let address = dict["address"]?.string,let phone = dict["phone"]?.string,let start_date = dict["start_date"]?.string,let end_date = dict["end_date"]?.string else {return nil}
        
        
        self.id = id
        self.title = title
        self.id_user = id_user
        self.descriptio = descriptio
        self.img = img
        self.logo = logo
        self.address = address
        self.phone = phone
        self.start_date = start_date
        self.end_date = end_date
    }
}


class categoryProvider: NSObject {
    
    var id: Int
    var title: String
    var img: String
    
    init?(dict: [String: JSON]){
        guard let id = dict["id"]?.int,let title = dict["title"]?.string,let img = dict["img"]?.string else {return nil}
        self.id = id
        self.title = title
        self.img = img
    }
}


class jops: NSObject {
    
    var title: String
    var email: String
    var img: String
    var descriptio: String
    var date: String
    
    init?(dict: [String: JSON]){
        guard let title = dict["title"]?.string,let email = dict["email"]?.string,let img = dict["img"]?.string,let descriptio = dict["description"]?.string,let date = dict["date"]?.string else {return nil}
        self.title = title
        self.email = email
        self.img = img
        self.descriptio = descriptio
        self.date = date
    }
}

class categoryProviderDetails: NSObject {
    
    var title: String
    var descriptio: String
    var img: String
    
    init?(dict: [String: JSON]){
        guard let title = dict["title"]?.string,let descriptio = dict["description"]?.string,let img = dict["img"]?.string else {return nil}
        self.title = title
        self.descriptio = descriptio
        self.img = img
    }
}

class imgMapIllustration: NSObject {
    
    var img: String
    
    init?(dict: [String: JSON]){
        guard let img = dict["img"]?.string else {return nil}
        self.img = img
    }
}
