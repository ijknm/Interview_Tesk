//
//  DetailViewController.swift
//  Task
//
//  Created by praveen on 11/14/17.
//  Copyright © 2017 com.praveen.praveen. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewController {

    var deatisData : NSDictionary = [:]
    
    @IBOutlet weak var ibDtailedTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Detail View"
        self.ibDtailedTextView.text = deatisData.object(forKey: "description") as? String
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
