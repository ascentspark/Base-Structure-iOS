//
//  VideoTableViewCell.swift
//  ProjectStructure
//
//  Created by Ascentspark on 12/06/18.
//  Copyright © 2018 Ascentspark. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainView : UIView!
    @IBOutlet weak var mainImageView : UIImageView!
    @IBOutlet weak var titleLabel : UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
