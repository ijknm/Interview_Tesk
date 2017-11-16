//
//  ListTableViewCell.swift
//  Task
//
//  Created by praveen on 11/15/17.
//  Copyright © 2017 com.praveen.praveen. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    func substring(_ from: Int) -> String {
        return self.substring(from: self.characters.index(self.startIndex, offsetBy: from))
    }
    
    var length: Int {
        return self.characters.count
    }
}
