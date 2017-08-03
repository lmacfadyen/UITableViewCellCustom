//
//  ViewController.swift
//  UITableViewCellCustom
//
//  Created by Lawrence F MacFadyen on 2016-04-26.
//  Copyright © 2016 LawrenceM. All rights reserved.
//

import UIKit

// Struct for the famous quotes
struct Quote {
    var text: String
    var author: String
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    // Famous quotes and authors
    let quotes = [Quote(text: "You miss 100% of the shots you don’t take.", author: "Wayne Gretzky"),Quote(text: "If you don’t design your own life plan, chances are you’ll fall into someone else’s plan. And guess what they have planned for you? Not much.", author: "Jim Rohn"),Quote(text: "A goal should scare you a little, and excite you a lot.", author: "Joe Vitale"),Quote(text: "Start by doing what's necessary; then do what's possible; and suddenly you are doing the impossible.", author: "Francis of Assisi")]
    
    // Identifier for the table view cell
    let cellIdentifier = "quoteCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Only show separators where there is data
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        // Dynamically size the height of the table view cells
        tableView.estimatedRowHeight = 64.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Only one section in the table view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Rows is equal to the number of Quotes defined above
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Our custom cell so we can access the quote text and author
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! QuoteTableViewCell
        
        // Surrounding quotes with quotation marks and factoring in locale
        let locale = Locale.current
        let qBegin = (locale as NSLocale).object(forKey: NSLocale.Key.quotationBeginDelimiterKey) as? String ?? "\""
        let qEnd = (locale as NSLocale).object(forKey: NSLocale.Key.quotationEndDelimiterKey) as? String ?? "\""
        
        let row = indexPath.row
        // Set the labels in the custom cell
        cell.quoteLabel.text = qBegin + quotes[row].text + qEnd
        cell.authorLabel.text = quotes[row].author
        
        return cell
    }

}

