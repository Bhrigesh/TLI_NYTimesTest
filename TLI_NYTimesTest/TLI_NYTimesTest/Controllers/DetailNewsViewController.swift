//
//  DetailNewsViewController.swift
//  TLI_NYTimesTest
//
//  Created by Bhrigesh Kumar Chawda on 28/11/18.
//  Copyright © 2018 Bhrigesh Kumar Chawda. All rights reserved.
//

import UIKit

class DetailNewsViewController: UITableViewController {
    
    //MARK: Outlets
    @IBOutlet weak var newImage: UIImageView!
    @IBOutlet weak var detailNewsLabel: UITextView!
    
    //MARK: Properties
    var news: News? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let news = news {
            detailNewsLabel.text = news.newsContent
            let hdImageURL = news.newsImageUrl
            let hdImageURLString = String(describing: hdImageURL).replacingOccurrences(of: "thumbStandard", with: "square320")
            let url = URL(string: hdImageURLString)
            NetworkManager.fetchNYTNews(with: url!, completion: { (data) in
                DispatchQueue.main.async {
                    self.newImage.image = UIImage(data: data)
                }
            })
        }
    }
    
}

