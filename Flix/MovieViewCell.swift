//
//  MovieViewCell.swift
//  Flix
//
//  Created by Nathan Ireland on 10/20/19.
//  Copyright © 2019 Nathan Ireland. All rights reserved.
//

import UIKit

class MovieViewCell: UITableViewCell {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var synopLbl: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
