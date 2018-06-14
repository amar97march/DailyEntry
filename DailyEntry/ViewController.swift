//
//  ViewController.swift
//  DailyEntry
//
//  Created by amar on 07/06/18.
//  Copyright © 2018 amar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var iAgreeButtonBool : Bool?
    var iAgreelabelBool : Bool?
    var welcomeBool : Bool = false
    
    @IBOutlet weak var welcomelabel: UILabel!
    @IBOutlet weak var firstButtonShow: UIButton!
    @IBOutlet weak var iAgreeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomelabel.isHidden = true
       
        //For hiding I Agree button
        if  let btnVar = UserDefaults.standard.value(forKey: "falseDic") as? [String:Bool]{
        iAgreeButtonBool = btnVar["FirstButton"]
            welcomelabel.isHidden = btnVar["FirstButton"]!
            
        }
  
        if iAgreeButtonBool == false {
            firstButtonShow.isEnabled = false
            firstButtonShow.isHidden = true
          
        }
        
        // For hiding I Agree Label
        if let btnVar = UserDefaults.standard.value(forKey: "falseDic") as? [String:Bool]  {
            iAgreelabelBool = btnVar["labelShow"]
        
            
        }
        
        if iAgreelabelBool == false {
            iAgreeLabel.isEnabled = false
            iAgreeLabel.isHidden = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                let entryvc = self.storyboard?.instantiateViewController(withIdentifier: "noteMaker") as! noteMakerViewController
                
                self.present(entryvc, animated: true, completion: nil)
            }
        }
        
    }
    

    

    @IBAction func okButton(_ sender: UIButton) {
        let showSet = ["FirstButton":false,"labelShow":false] as [String:Bool]
        UserDefaults.standard.set(showSet, forKey: "falseDic")
        UserDefaults.standard.synchronize()
        //print(firstButton!)
        let entryvc = storyboard?.instantiateViewController(withIdentifier: "noteMaker") as! noteMakerViewController
        
        navigationController?.pushViewController(entryvc, animated: true)
        
    }

    

}

