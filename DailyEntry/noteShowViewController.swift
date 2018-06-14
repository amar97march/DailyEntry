//
//  noteShowViewController.swift
//  DailyEntry
//
//  Created by amar on 07/06/18.
//  Copyright © 2018 amar. All rights reserved.
//

import UIKit

class noteShowViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @IBOutlet weak var dateshowlabel: UILabel!
    @IBOutlet weak var writingshowlabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var backgroundBtn: UIButton!
    @IBOutlet weak var mainbackground: UIImageView!
    @IBOutlet weak var clipButton: UIButton!
    @IBOutlet weak var foreImage: UIImageView!
    
    
    var clipsave : UIImage?
    var dateValue : String = ""
    var writingvalue : String = ""
    var forArray = ["for1","for2","for3","for4","for5"]
    let imagePicker : UIImagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateshowlabel.text = dateValue
        writingshowlabel.text = writingvalue
        imagePicker.delegate = self
      
        
    }
    
    @IBAction func imageClip(_ sender: UIButton) {
        clipButton.isHidden = true
        backButton.isHidden = true
        backgroundBtn.isHidden = true
        clipsave =  imageFromView(myView: self.view)
        
        clipButton.isHidden = false
        backButton.isHidden = false
        backgroundBtn.isHidden = false
        
        UIImageWriteToSavedPhotosAlbum(clipsave!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        
    }
    
    //MARK: - Add image to Library
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    func imageFromView(myView: UIView) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(myView.bounds.size, false, UIScreen.main.scale)
        myView.drawHierarchy(in: myView.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
    
    @IBAction func backFunc(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func backgroundChange(_ sender: UIButton) {
        let alertTemp = UIAlertController.init(title: "Background", message: "Choose Option:", preferredStyle: .actionSheet)
        alertTemp.addAction(UIAlertAction(title: "Gallary", style: .default, handler: { (alert
            ) in
            self.imagePicker.allowsEditing = false
            self.imagePicker.sourceType = .photoLibrary
            
            self.present(self.imagePicker, animated: true, completion: nil)
        }))
        alertTemp.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (alert
            ) in
            self.imagePicker.allowsEditing = false
            self.imagePicker.sourceType = .camera
            
            self.present(self.imagePicker, animated: true, completion: nil)

            
        }))
                
        alertTemp.popoverPresentationController?.sourceView = self.view
        alertTemp.popoverPresentationController?.sourceRect = sender.frame
    
        self.present(alertTemp, animated: true, completion: nil)
    }
    
    
    @IBAction func foreBtn(_ sender: UIButton) {
        let alertTemp = UIAlertController.init(title: "Foreground", message: "Choose Option:", preferredStyle: .actionSheet)
        alertTemp.addAction(UIAlertAction(title: "Wall1", style: .default, handler: { (alert
            ) in
            self.foreImage.image = UIImage(named: "for1")
        }))
        alertTemp.addAction(UIAlertAction(title: "Wall2", style: .default, handler: { (alert
            ) in
          
             self.foreImage.image = UIImage(named: "for2")
            
        }))
        alertTemp.addAction(UIAlertAction(title: "Wall3", style: .default, handler: { (alert
            ) in
            
             self.foreImage.image = UIImage(named: "for3")
            
        }))
        alertTemp.addAction(UIAlertAction(title: "Wall4", style: .default, handler: { (alert
            ) in
            
             self.foreImage.image = UIImage(named: "for4")
            
        }))
        alertTemp.addAction(UIAlertAction(title: "Wall5", style: .default, handler: { (alert
            ) in
            
             self.foreImage.image = UIImage(named: "for5")
            
        }))
        alertTemp.popoverPresentationController?.sourceView = self.view
        alertTemp.popoverPresentationController?.sourceRect = sender.frame
        
        self.present(alertTemp, animated: true, completion: nil)
    }
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
                    imagePicker.dismiss(animated: true, completion: nil)
                mainbackground.image=info[UIImagePickerControllerOriginalImage] as? UIImage
                print("amar")
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}
