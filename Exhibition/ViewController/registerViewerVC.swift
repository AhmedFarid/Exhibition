//
//  registerViewerVC.swift
//  Exhibition
//
//  Created by Farido on 5/26/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class registerViewerVC: UIViewController {
    
    @IBOutlet weak var name: shadowTextFiled!
    @IBOutlet weak var email: shadowTextFiled!
    @IBOutlet weak var phone: shadowTextFiled!
    @IBOutlet weak var tableView: UITableView!
    
    var id = 0
    var photo = ""
    var phoned = ""
    var names = ""
    var chckMarksID = 0
    var selected = [Int]()
    var selctedPartions = ""
    var palces = [availablePartitions]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        handleRefreshPlaces()
        
        
        self.tableView.allowsMultipleSelection = true
        self.tableView.allowsMultipleSelectionDuringEditing = true
        tableView.delegate = self
        tableView.dataSource = self
        setupNavagtion()
    }
    
    
    func setupNavagtion(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    
    
    func getPartiton(){
        let stringArray = selected.map { String($0) }
        selctedPartions = stringArray.joined(separator: ",")
        print(selctedPartions)
//        for i in selected{
//            //selctedPartions = (i, terminator: ",")
//            selctedPartions = dump("\(i)")
//        }
    }
    
    @objc private func handleRefreshPlaces() {
        API_CurrentFairs.availablePartitio(id_fair: id){ (error: Error?, palces: [availablePartitions]?) in
            if let palces = palces {
                self.palces = palces
                print("xxx\(self.palces)")
                self.tableView.reloadData()
            }
        }
        
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    @IBAction func registerBTN(_ sender: Any) {
        
        guard let names = name.text, !names.isEmpty else {
            let messages = NSLocalizedString("enter your Name", comment: "hhhh")
            let title = NSLocalizedString("Register", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let phones = phone.text, !phones.isEmpty else {
            let messages = NSLocalizedString("enter your phone", comment: "hhhh")
            let title = NSLocalizedString("Register", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard isValidEmail(testStr: email.text ?? "") == true else {
            let messages = NSLocalizedString("email not correct", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        
        API_Register.registerViewer(name: name.text ?? "", email: email.text ?? "", phone: phone.text ?? "", fairs_id: id, id_partion: selctedPartions){ (erroe: Error?, Success,status ,title,QRcode,phone,errors)  in
            if Success {
                if status == true {
                    print("xxxxxxx")
                    self.phoned = phone ?? ""
                    self.photo = QRcode ?? ""
                    self.names = title ?? ""
                    self.performSegue(withIdentifier: "suge", sender: nil)
                }else {
                    
                }
            }else{
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? qrRaderVC{
            destaiantion.images = photo
            destaiantion.phones = phoned
            destaiantion.titles = names
        }
    }
}



extension registerViewerVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return palces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? avlipaltiyPosationsCell {
            let iamge = palces[indexPath.item]
            cell.configuerCell(item: iamge)
            return cell
        }else {
            return avlipaltiyPosationsCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let iamge = palces[indexPath.item]
        
        if cell!.isSelected == true
        {
            selected.append(iamge.id_partion)
        }
        
        getPartiton()
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        //let cell = tableView.cellForRow(at: indexPath)
        let iamge = palces[indexPath.item]
        
        selected = selected.filter(){$0 != iamge.id_partion}
        
        getPartiton()
        
    }
}

