//
//  ProfileHeaderView.swift
//  Yogatime
//
//  Created by David 
//  Copyright © 2016 David. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var tabSelectionView: UIView!
    @IBOutlet var tabButtons: [UIButton]!
    @IBOutlet var infoViews: [UIView]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for button in tabButtons {
            for state in [UIControlState.Normal, UIControlState.Selected] {
                let attributedString = NSAttributedString(string: button.titleForState(state)!,
                    attributes: [NSKernAttributeName : 0.2, NSForegroundColorAttributeName : button.titleColorForState(state)!])
                button.setAttributedTitle(attributedString, forState: state)
            }
        }
    }
    
    var selectedTabIndex: Int = 0 {
        didSet {
            updateTabButtons()
            setNeedsLayout()
        }
    }
    
    func updateTabButtons() {
        let selectedButton = tabButtons[selectedTabIndex]
        for button in tabButtons {
            button.selected = button == selectedButton
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarView.layer.cornerRadius = CGRectGetHeight(avatarView.frame) / 2
        layoutTabSelectionView()
    }
    
    func setSelectedTabIndex(index: Int, animated: Bool = false) {
        selectedTabIndex = index
        
        if animated {
            UIView.animateWithDuration(0.2, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                self.layoutTabSelectionView()
                }, completion: nil)
        }
    }
    
    func layoutTabSelectionView() {
        let selectedButton = tabButtons[selectedTabIndex]
        var rect = selectedButton.frame;
        
        let selectionViewHeight = CGRectGetHeight(tabSelectionView.frame)
        rect.origin.y = CGRectGetMaxY(rect) - selectionViewHeight
        rect.size.height = selectionViewHeight
        tabSelectionView.frame = rect
    }
    
    func setInfoAlpha(alpha: CGFloat, animated: Bool) {
        if animated {
            let duration = NSTimeInterval(0.4)
            var delay = NSTimeInterval(0.0)
            
            for view in infoViews {
                UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                    view.alpha = alpha
                    }, completion: nil)
                delay += 0.2 * duration
            }
        } else {
            for view in infoViews {
                view.alpha = alpha
            }
        }
    }
    
}
