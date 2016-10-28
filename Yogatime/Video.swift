//
//  Video.swift
//  Yogatime
//
//  Created by David  on 10/28/16.
//  Copyright © 2016 David. All rights reserved.
//

import UIKit

class Video {
    var title: String!
    var subtitle: String!
    var image: UIImage!
    var durationText: String!
    var levelText: String!
    var viewsText: String!
    var availableOffline: Bool = false
    
    convenience init(title: String!, subtitle: String!, image: UIImage!, availableOffline: Bool = false, durationText: String! = "15m", levelText: String! = "1-2 level", viewsText: String! = "324") {
        self.init()
        
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.availableOffline = availableOffline
        self.durationText = durationText
        self.levelText = levelText
        self.viewsText = viewsText
    }
}
