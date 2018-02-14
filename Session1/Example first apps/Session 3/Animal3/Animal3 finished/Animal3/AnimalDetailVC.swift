//
//  AnimalDetailVC.swift
//  Animal2
//
//  Created by Chris Price on 14/06/2016.
//  Copyright © 2016 Chris Price. All rights reserved.
//

import UIKit

class AnimalDetailVC: UIViewController {
    
    @IBOutlet weak var photo: UIImageView!
    
    var valueForLabel = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = valueForLabel
        photo.image = UIImage(named: "\(valueForLabel).jpg")
   }


}
