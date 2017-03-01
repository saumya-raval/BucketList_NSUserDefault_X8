//
//  PostVC.swift
//  BucketList_NSUserDefaults_X8
//
//  Created by Saumya Raval on 2/24/17.
//  Copyright © 2017 PlayAgain. All rights reserved.
//

import UIKit

class PostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var selectImg: UIImageView!
    @IBOutlet weak var EnterTitle: UITextField!
    @IBOutlet weak var enterDesc: UITextField!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        selectImg.layer.cornerRadius = selectImg.frame.size.width / 2
        selectImg.clipsToBounds = true
        
    }

    @IBAction func AddPicBtnPressed(_ sender: UIButton) {
        sender.setTitle("", for: .normal)
        present(imagePicker!, animated: true, completion: nil)
        
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func postBtnPressed(_ sender: Any) {
        if let img = selectImg.image, let title = EnterTitle.text, let desc = enterDesc.text {
            let imgPath = dataService.instance.saveImgCreatePath(img: img)
            let post = Post(img: imgPath, title: title, desc: desc)
            dataService.instance.addPost(post: post)
            dismiss(animated: true, completion: nil)
            
        }
        
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        selectImg.image = info["UIImagePickerControllerOriginalImage"] as! UIImage?
    }
    
}

