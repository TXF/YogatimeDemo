//
//  UIView+Clone.swift
//  Yogatime
//
//  Created by David  on 10/28/16.
//  Copyright © 2016 David. All rights reserved.
//

import UIKit

extension UIView {
    func clone() -> UIView {
        let data = NSKeyedArchiver.archivedDataWithRootObject(self)
        return NSKeyedUnarchiver.unarchiveObjectWithData(data) as! UIView
    }
}

