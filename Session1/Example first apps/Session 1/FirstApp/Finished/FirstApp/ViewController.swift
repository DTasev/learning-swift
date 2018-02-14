//
//  ViewController.swift
//  FirstApp
//
//  Created by Chris Price on 24/05/2016.
//  Copyright © 2016 Chris Price. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func sayHello(sender: AnyObject) {        
        greeting.text = "Hullo world"
    }
    
    
    @IBOutlet weak var greeting: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

