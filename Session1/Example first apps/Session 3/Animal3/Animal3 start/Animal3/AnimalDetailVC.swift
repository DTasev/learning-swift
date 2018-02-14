//
//  AnimalDetailVC.swift
//  Animal2
//
//  Created by Chris Price on 14/06/2016.
//  Copyright © 2016 Chris Price. All rights reserved.
//

import UIKit

class AnimalDetailVC: UIViewController {

    @IBOutlet weak var favourite: UILabel!
    
    var valueForLabel = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        favourite!.text = valueForLabel;
    }


}
