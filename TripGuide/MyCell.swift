//
//  MyCell.swift
//  TripGuide
//
//  Created by Mangal Compu Solution on 12/27/17.
//  Copyright © 2017 Mangal Compu Solution. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {

    @IBOutlet var lblName: UILabel!
    
    @IBOutlet var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
