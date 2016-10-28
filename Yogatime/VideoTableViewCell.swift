//
//  VideoTableViewCell.swift
//  Yogatime
//
//  Created by David 
//  Copyright © 2016 David. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var offlineView: UIImageView!
    
    func animateAppearance(duraion: CFTimeInterval, beginTime: CFTimeInterval) {
        let layer = contentView.layer
        let timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        let duration = 0.5
        let layerBeginTime = layer.convertTime(beginTime, fromLayer: nil)
        
        let positionAnimation = CABasicAnimation(keyPath: "position.x")
        var position = layer.position
        positionAnimation.toValue = position.x
        position.x += 0.5 * CGRectGetWidth(layer.bounds)
        positionAnimation.fromValue = position.x
        positionAnimation.timingFunction = timingFunction
        positionAnimation.duration = duration
        positionAnimation.beginTime = layerBeginTime
        
        layer.addAnimation(positionAnimation, forKey: "position")
        
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 0.0
        opacityAnimation.toValue = 1.0
        opacityAnimation.timingFunction = timingFunction
        opacityAnimation.duration = duration
        opacityAnimation.beginTime = layerBeginTime
        opacityAnimation.fillMode = kCAFillModeBackwards
        
        layer.opacity = 1.0
        layer.addAnimation(opacityAnimation, forKey: "opacity")
    }
}
