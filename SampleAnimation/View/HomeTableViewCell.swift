//
//  HomeTableViewCell.swift
//  SampleAnimation
//
//  Created by Supriya Malgaonkar on 29/11/17.
//  Copyright © 2017 Supriya Malgaonkar. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
