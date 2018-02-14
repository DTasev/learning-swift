//
//  AnimalCell.swift
//  Animal4
//
//  Created by Chris Price on 14/06/2016.
//  Copyright © 2016 Chris Price. All rights reserved.
//

import UIKit

class AnimalCell: UITableViewCell {

  
    @IBOutlet weak var photo: UIImageView!

    
    @IBOutlet weak var animalName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
