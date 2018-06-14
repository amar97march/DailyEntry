//
//  noteMakerViewController.swift
//  DailyEntry
//
//  Created by amar on 07/06/18.
//  Copyright © 2018 amar. All rights reserved.
//

import UIKit

class noteMakerViewController: UIViewController,UITextFieldDelegate {

    var dated : String = ""
    @IBOutlet weak var textEntry: UITextView!
    
    @IBAction func datePicker(_ sender: UIDatePicker) {
    
        let recievedDate = sender.date
        let formatter = DateFormatter()
        
        formatter.dateFormat = "dd MMMM yyyy hh:mm"
        dated = formatter.string(from: recievedDate)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tempdate = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "dd MMMM yyyy hh:mm"
        dated = formatter.string(from: tempdate)
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func showPage(_ sender: UIButton) {
   let showPageVC = storyboard?.instantiateViewController(withIdentifier: "noteShow") as! noteShowViewController
        showPageVC.dateValue = dated
        showPageVC.writingvalue = textEntry.text!
        //navigationController?.pushViewController(showPageVC, animated: true)
        self.present(showPageVC, animated: true, completion: nil)
        print(dated)
        
        
    }
    
}

