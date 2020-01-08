//
//  currentFarieDetails.swift
//  Exhibition
//
//  Created by Farido on 5/23/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import SwiftyJSON

class currentFarieDetails: NSObject {
    
    var id: Int
    var title: String
    var img: String
    
    init?(dict: [String: JSON]){
        guard let id = dict["id"]?.int,let title = dict["title"]?.string,let img = dict["img"]?.string else {return nil}
        self.title = title
        self.img = img
        self.id = id
    }
}


class exhibitor: NSObject {
    
    var id: Int
    var name: String
    var img: String
    
    init?(dict: [String: JSON]){
        guard let id = dict["id"]?.int,let name = dict["name"]?.string,let img = dict["image"]?.string else {return nil}
        self.name = name
        self.img = img
        self.id = id
    }
}


class serviceProvider: NSObject {
    
    var id: Int
    var title: String
    var img: String
    
    init?(dict: [String: JSON]){
        guard let id = dict["id"]?.int,let title = dict["title"]?.string,let img = dict["img"]?.string else {return nil}
        self.title = title
        self.img = img
        self.id = id
    }
}

class holeExhibitorNo: NSObject {
    
    var id: Int
    var title: String
    var img: String
    
    init?(dict: [String: JSON]){
        guard let id = dict["id"]?.int,let title = dict["title"]?.string,let img = dict["img"]?.string else {return nil}
        self.title = title
        self.img = img
        self.id = id
    }
    
}

class holeExhibitorNo2: NSObject {
    
    var id: Int
    var title: String
    var img: String
    
    init?(dict: [String: JSON]){
        guard let id = dict["id"]?.int,let title = dict["title"]?.string,let img = dict["img"]?.string else {return nil}
        self.title = title
        self.img = img
        self.id = id
    }
    
}

class holeExhibitorNo3: NSObject {
    
    var id: Int
    var title: String
    var img: String
    
    init?(dict: [String: JSON]){
        guard let id = dict["id"]?.int,let title = dict["title"]?.string,let img = dict["img"]?.string else {return nil}
        self.title = title
        self.img = img
        self.id = id
    }
    
}

class holeExhibitorNo4: NSObject {
    
    var id: Int
    var title: String
    var img: String
    
    init?(dict: [String: JSON]){
        guard let id = dict["id"]?.int,let title = dict["title"]?.string,let img = dict["img"]?.string else {return nil}
        self.title = title
        self.img = img
        self.id = id
    }
    
}


class availablePartitions: NSObject {
    
    
//    "id_partion": 42,
//    "number": "2",
//    "width": "2",
//    "height": "2",
//    "price": "22"
    var id_partion: Int
    var number: String
    var width: String
    var price: String
    var height: String
    
    init?(dict: [String: JSON]){
        guard let id_partion = dict["id_partion"]?.int,let number = dict["number"]?.string,let width = dict["width"]?.string,let height = dict["height"]?.string,let price = dict["price"]?.string else {return nil}
        
        self.id_partion = id_partion
        self.number = number
        self.width = width
        self.price = price
        self.height = height
    }
    
}


//
//"": "خدمة ديجتال ماركتنج 2",
//"description": null,
//"": "/uploads/cYLpjhd9kP9pg3T1ro0nAvZfWBhH2QoNNHTZbjV7.png"
//

class servicesExhibitors: NSObject {
    
    var title: String
    var img: String
    
    init?(dict: [String: JSON]){
        guard let title = dict["title"]?.string,let img = dict["img"]?.string else {return nil}
        self.title = title
        self.img = img
    }
    
}


//"title": "شاومي مي سبورت باند 3 جهاز تتبع اللياقة البدنية مع شاشة او ال اي دي ومراقب ضربات القلب، اسود",
//"price": "20",
//"sale_price": "15",
//"img": "/uploads/jp0IbOCZupFB3tSWyUfK1BnjhjPSf8U4IEXgBjLV.png"

class productExhibitors: NSObject {
    
    var title: String
    var img: String
    var price: String
    var sale_price: String
    
    
    init?(dict: [String: JSON]){
        guard let title = dict["title"]?.string,let img = dict["img"]?.string,let price = dict["price"]?.string,let sale_price = dict["sale_price"]?.string else {return nil}
        self.title = title
        self.img = img
        self.price = price
        self.sale_price = sale_price
    }
    
}


