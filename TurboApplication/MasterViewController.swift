//
//  MasterViewController.swift
//  TurboApplication
//
//  Created by BibiX  on 11/03/2016.
//  Copyright © 2016 BibiX . All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var jsonArray = [AnyObject]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Recuperate the data from the json file and fill ijn the jsonArray
        if let filePath = NSBundle.mainBundle().pathForResource("data_test_ios",ofType:"json") {
            do {
                let data = try NSData(contentsOfFile:filePath, options:NSDataReadingOptions.DataReadingUncached)
                do {
                    let json:AnyObject? = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
 
                    if let nsArrayObject = json as? NSArray {
                        if let swiftArray = nsArrayObject as Array? {
                            jsonArray = swiftArray
                            print(swiftArray)
                        }
                    }
                } catch let caught as NSError {
                    print(caught)
                }
            }
            catch {/* error handling here */}
        }
        
        UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 110.0
        
        self.tableView.reloadData()
        
    }

    override func viewWillAppear(animated: Bool) {
              super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return jsonArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("customCell", forIndexPath: indexPath) as? CustomcellTableViewCell
        
        
        let object = jsonArray[indexPath.row] as! NSDictionary
        
        cell?.titleLabel!.text = object.objectForKey("title") as? String
        cell?.descriptionLabel?.numberOfLines = 0
        

        
        cell?.turboImage.imageFromUrl((object.objectForKey("url") as? String)!)
           cell?.descriptionLabel!.text = object.objectForKey("description") as? String
        
        
        return cell!
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

}

extension UIImageView {
    public func imageFromUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(URL: url)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
                (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
                if let imageData = data as NSData? {
                    self.image = UIImage(data: imageData)
                }
            }
        }
    }
}

