//
//  ViewController.swift
//  testPhotoMail
//
//  Created by Chris Price on 19/06/2016.
//  Copyright © 2016 Chris Price. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var mailButton: UIButton!
    
    @IBAction func takePhoto(sender: AnyObject) {
        let myPicker = UIImagePickerController.init()
        if UIImagePickerController.isSourceTypeAvailable( .Camera ) {
            myPicker.delegate = self; // Say that this viewcontroller will provide the necessary delegate methods
            myPicker.allowsEditing = true
            myPicker.sourceType = .Camera
            presentViewController( myPicker, animated: true, completion: nil )
        }
        else {print("No camera, mate!")}
    }
    
    @IBAction func mailPhoto(sender: UIButton) {
        guard MFMailComposeViewController.canSendMail() else {
            print("No mail can be sent")
            return
        }
        let makeMailVC = MFMailComposeViewController()
        makeMailVC.mailComposeDelegate = self
        
        // Configure the fields of the interface.
        makeMailVC.setToRecipients(["cjp@aber.ac.uk"])
        makeMailVC.setSubject("Lawks, what a picture!")
        makeMailVC.setMessageBody("I just took this picture for you.", isHTML: false)
        let imageData: NSData = UIImageJPEGRepresentation(photo.image!, 0.7)!
        makeMailVC.addAttachmentData(imageData, mimeType: "image/jpeg", fileName: "pic.jpg")
        
        // Present the view controller modally.
        presentViewController(makeMailVC, animated: true, completion: nil )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mailButton.hidden = true
    }

    // Delegate methods for the ImagePicker Controller
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        photo.image = info[UIImagePickerControllerEditedImage] as? UIImage
        mailButton.hidden = false
        // Remove the picker interface and release the picker object.
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // Delegate methods for the Mailer Controller
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        self.dismissViewControllerAnimated( true, completion: nil)
    }

}

