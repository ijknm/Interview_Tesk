//
//  ListTableViewCell.swift
//  Task
//
//  Created by praveen on 11/15/17.
//  Copyright © 2017 com.praveen.praveen. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

   
    class var identifier: String { return String.className(self) }
    
    @IBOutlet weak var ibTitleLbl: UILabel!
    @IBOutlet weak var ibPublishedDateLbl: UILabel!
    @IBOutlet weak var ibRatingsCountLbl: UILabel!
    @IBOutlet weak var ibPublisherLbl: UILabel!
    @IBOutlet weak var ibImageLbl: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    open func setup() {
    }
    
    open class func height() -> CGFloat {
        return 48
    }
}
