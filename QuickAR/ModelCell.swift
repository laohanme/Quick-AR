//
//  ModelCell.swift
//  QuickAR
//
//  Created by laohanme on 07/05/2019.
//  Copyright © 2019 laohanme. All rights reserved.
//

import UIKit

class ModelCell: UITableViewCell {

    @IBOutlet var modelImage: UIImageView!
    @IBOutlet var modelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
