//
//  VideoSection.swift
//  Yogatime
//
//  Created by David  Vasiljev M.B. on 16/02/16.
//  Copyright © 2016 David. All rights reserved.
//

import UIKit

class VideoSection {
    var title: String! = ""
    var videos = [Video]()
    
    class func testSections() -> [VideoSection] {
        let watchLaterSection = VideoSection()
        watchLaterSection.title = "WATCH LATER"
        watchLaterSection.videos = [
            Video(title: "Free in the Neck and Mind", subtitle: "Hatha Yoga with Rachel Novetsky", image: UIImage(named: "1")),
            Video(title: "Calming Practice with Inversions", subtitle: "Vinyasa Yoga with Sara Quiriconi", image: UIImage(named: "2")),
            Video(title: "Deep in the Hips", subtitle: "Hatha Yoga with Pablo Lucero", image: UIImage(named: "3"), availableOffline: true),
        ]
        
        let favSection = VideoSection()
        favSection.title = "FAVORITES"
        favSection.videos = [
            Video(title: "Strong and Alive in Your Power", subtitle: "Kundalini Yoga with Sadhu Singh", image: UIImage(named: "4"), availableOffline: true),
            Video(title: "Long and Strong", subtitle: "Vinyasa Yoga with Jennifer Pansa", image: UIImage(named: "5")),
            Video(title: "Kriya for Calming the Heart", subtitle: "Kundalini Yoga with Sadhu Singh", image: UIImage(named: "6")),
        ]
        
        let historySection = VideoSection()
        historySection.title = "HISTORY"
        historySection.videos = [
            Video(title: "Courageous Backbends", subtitle: "Kundalini Yoga with Sadhu Singh", image: UIImage(named: "7")),
            Video(title: "Long and Strong", subtitle: "Vinyasa Yoga with Jennifer Pansa", image: UIImage(named: "8"), availableOffline: true),
            Video(title: "Kriya for Calming the Heart", subtitle: "Kundalini Yoga with Sadhu Singh", image: UIImage(named: "9"), availableOffline: true),
        ]
        
        return [watchLaterSection, favSection, historySection]
    }
}
