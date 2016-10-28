//
//  CoverImageView.swift
//  Yogatime
//
//  Created by David 
//  Copyright © 2016 David. All rights reserved.
//

import UIKit

class CoverImageView: UIView {
    
    var imageView: UIImageView! = UIImageView()
    var minHeight: CGFloat! = 110 {
        didSet {
            setNeedsLayout()
        }
    }
    var maxHeight: CGFloat! = 220 {
        didSet {
            setNeedsLayout()
        }
    }
    
    let minAlpha = CGFloat(0.49)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        addSubview(imageView)
        clipsToBounds = true
    }
    
    override func layoutSubviews() {
        var imageFrame = bounds
        
        let height = CGRectGetHeight(bounds)
        
        let scale = fmax(0.0, fmin(1.0, (height - minHeight) / (maxHeight - minHeight)))
        
        let alpha = scale + minAlpha * (1.0 - scale)
        imageView.alpha = alpha
        
        let width = 0.25 * CGRectGetWidth(imageFrame) * scale
        imageFrame.origin.x -= width
        imageFrame.size.width += 2 * width
        
        imageView.frame = imageFrame
    }
}
