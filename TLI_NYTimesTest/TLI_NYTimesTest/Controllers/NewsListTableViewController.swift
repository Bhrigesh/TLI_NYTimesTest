//
//  NewsList.swift
//  TLI_NYTimesTest
//
//  Created by Bhrigesh Kumar Chawda on 28/11/18.
//  Copyright © 2018 Bhrigesh Kumar Chawda. All rights reserved.
//

import UIKit

class NewsListTableViewController: UITableViewController {
    
    //MARK: Properties
    var newsStore: NewsStore!
    var news:[News]!
    var imageCache = NSCache<NSString,UIImage>()
    
    //MARK: Private Properties
    let reuseIdentifier = "NewsCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        news = [News]()
        fetchNews()
    }
    
    func fetchNews() {
        newsStore.fetchNews(for: .mostviewedNews) { (newsList) in
            switch newsList {
            case let .success(news):
                self.news = news
            case let .failure(error):
                print("Error fetching recent news: \(error)")
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func configureCell(for cell: NewsListTableViewCell, with indexPath: IndexPath) {
        cell.newsImageView.layer.cornerRadius =  37.0
        cell.newsImageView.clipsToBounds = true
        cell.newsImageView.layer.masksToBounds = true
        
        let newsItem = news[indexPath.row]
        cell.dateLabel.text = newsItem.newsDate
        cell.authorLabel.text = newsItem.newsAuthor
        cell.titleLabel.text = newsItem.newsTitle
        
        //Cache Image on Scrolling and Asynchronous Image loading for Cell Image
        let key = String(newsItem.id)
        if (imageCache.object(forKey: key as NSString) != nil) {
            cell.newsImageView.image = imageCache.object(forKey: key as NSString)
        } else {
            newsStore.fetchImage(for: newsItem) { (image) in
                if case .success(let image) = image {
                    DispatchQueue.main.async {
                        if let visibleCell = self.tableView.cellForRow(at: indexPath) as? NewsListTableViewCell{
                            visibleCell.newsImageView.image = image
                            self.imageCache.setObject(image, forKey: key as NSString)
                        }
                    }
                }
            }
        }
    }
}

//MARK: - Table view data source
extension NewsListTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath as IndexPath)
        
        if let cell = cell as? NewsListTableViewCell {
            configureCell(for: cell, with: indexPath as IndexPath)
            return cell
        }
        return cell
    }
    
}
