//
//  NewsListTableViewCell.swift
//  TLI_NYTimesTest
//
//  Created by Bhrigesh Kumar Chawda on 28/11/18.
//  Copyright © 2018 Bhrigesh Kumar Chawda. All rights reserved.
//

import UIKit

class NewsListTableViewCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UITextView!
    @IBOutlet weak var authorLabel: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
