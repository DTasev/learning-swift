//
//  ViewController.swift
//  LearningSwiftApp
//
//  Created by dbt on 14/02/2018.
//  Copyright © 2018 dbt. All rights reserved.
//

import UIKit

enum LabelState{
    case HELLO
    case GOODBYE
}
class ViewController: UIViewController {
    var labelState:LabelState = LabelState.HELLO
    
    @IBOutlet weak var suchANiceLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonPress(_ sender: UIButton) {
        switch(self.labelState){
        case LabelState.HELLO:
            self.suchANiceLabel.text = "Hello there"
            self.labelState = LabelState.GOODBYE
        case LabelState.GOODBYE:
            self.suchANiceLabel.text = "Goodbye"
            self.labelState = LabelState.HELLO
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

