//
//  ListViewController.swift
//  Task
//
//  Created by praveen on 11/14/17.
//  Copyright © 2017 com.praveen.praveen. All rights reserved.
//

import UIKit

class ListViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    var listArray:NSMutableArray = []
 
 @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // NavBar Update
        self.navigationItem.title = "List View"
        self.navigationItem.setHidesBackButton(true, animated:true);
        
        // Load .xib files
        let nib = UINib(nibName: "ListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ListTableViewCell")
        
        // Google BOOK API URL
        let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=stephen+king")
        
        // Get The Data from Google Book API
        URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            if(error != nil){
                print("error: Http Response Error")
            }else{
                do{
                    let json: NSDictionary = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! NSDictionary
                    let itemsArray = json.object(forKey: "items") as! NSArray
                    for volumeInfo in (itemsArray as NSArray as! [NSDictionary]) {
                       let bookData:NSDictionary =  volumeInfo.object(forKey: "volumeInfo") as! NSDictionary
                       self.listArray.add(bookData)
                    }
                    OperationQueue.main.addOperation({
                        self.tableView.reloadData()
                    })
                    
                }catch let error as NSError{
                    print(error)
                }
            }
        }).resume()
    }
    
    // TableView Delegate Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
        
        // Update Cell with BOOK Information
        let bookInfo:NSDictionary = self.listArray.object(at: indexPath.row) as! NSDictionary
        cell.ibPublishedDateLbl.text = (String(format: "Published Date: %@",(bookInfo.object(forKey: "publishedDate") as? String)!))
        cell.ibPublisherLbl.text = (String(format: "Publisher: %@",(bookInfo.object(forKey: "publisher") as? String)!))
        cell.ibTitleLbl.text = (String(format: "Title: %@",(bookInfo.object(forKey: "title") as? String)!))
        
        // Load book image
        let imageLink:NSDictionary = bookInfo.object(forKey: "imageLinks") as! NSDictionary
        if (imageLink.object(forKey: "smallThumbnail") as? String) != nil {
            if cell.ibImageLbl.image == nil{
                let url = URL(string: imageLink.object(forKey: "smallThumbnail") as! String)
                URLSession.shared.dataTask(with: url!, completionHandler: {
                    (data, response, error) in
                    if(error == nil){
                        if data != nil{
                            if let image = UIImage(data: data!){
                                OperationQueue.main.addOperation({
                                    // update ui tableview cell after loading image
                                    if let cell: ListTableViewCell = tableView.cellForRow(at: indexPath) as? ListTableViewCell {
                                        cell.ibImageLbl.image = image
                                    }
                                })
                            }
                        }
                    }else{
                        
                    }
                }).resume()
            }
        }
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicked at: \(indexPath.row)")
        self.performSegue(withIdentifier: "DetailView", sender: self)
        // Here u can get the selected cell and add action related to this cell seelction
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailView" {
            // Send data to next view controller
            let index:IndexPath = self.tableView.indexPathForSelectedRow!
            let nextScene =  segue.destination as! DetailViewController
            nextScene.deatisData = self.listArray.object(at: index.row) as! NSDictionary
        }
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
