//
//  ProfileViewController.swift
//  Yogatime
//
//  Created by David 
//  Copyright © 2016 David. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var headerView: ProfileHeaderView!
    @IBOutlet weak var coverView: CoverImageView!
    @IBOutlet weak var coverViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topBarView: UIView!
    
    var titleLabel: UILabel!
    let titleTopOffset = CGFloat(33.0)
    let sectionHeaderReuseIdentifier = "header"
    
    var sections = VideoSection.testSections()
    var rowsAppearStartTime: CFTimeInterval = 0.0
    let rowAppearDelay = 0.05
    let rowAppearDuration = 0.1
    
    // MARK: lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel = headerView.nameLabel.clone() as! UILabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        headerView.nameLabel.hidden = true
        
        headerView.setSelectedTabIndex(0, animated: false)
        headerView.setInfoAlpha(0.0, animated: false)
        coverView.imageView.image = UIImage(named: "Cover_pic")
        
        tableView.registerNib(UINib(nibName: "ProfileVideoSectionHeaderView", bundle: NSBundle.mainBundle()),
            forHeaderFooterViewReuseIdentifier: sectionHeaderReuseIdentifier)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        headerView.setInfoAlpha(0.0, animated: false)
        
        rowsAppearStartTime = CACurrentMediaTime()
        tableView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        headerView.setInfoAlpha(1.0, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutHeader()
        layoutTitleLabel()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    // MARK: layout
    
    func headerTopY() -> CGFloat {
        let top = headerView.backgroundView.convertPoint(CGPoint.zero, toView: view)
        return fmax(top.y, 0.0)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        layoutHeader()
        layoutTitleLabel()
    }
    
    func layoutHeader() {
        let headerTop = headerTopY()
        coverViewHeightConstraint.constant = headerTop
        topBarView.alpha = fmax(0.0, fmin(1.0, (1.0 - headerTop / CGRectGetHeight(topBarView.frame))))
    }
    
    func layoutTitleLabel() {
        var rect = headerView.nameLabel.convertRect(headerView.nameLabel.bounds, toView: view)
        rect.origin.y = fmax(rect.origin.y, titleTopOffset)
        titleLabel.frame = rect
    }
    
    // MARK: Actions
    
    @IBAction func onTabButtonTap(sender: UIButton) {
        headerView.setSelectedTabIndex(headerView.tabButtons.indexOf(sender)!, animated: true)
    }
    
    // MARK: UITableView data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].videos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier("video-cell", forIndexPath: indexPath)
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterViewWithIdentifier(sectionHeaderReuseIdentifier) as! ProfileVideoSectionHeaderView
        let title = (sections[section].title as NSString).uppercaseString
        
        let attributedString = NSAttributedString(string: title, attributes: [NSKernAttributeName : CGFloat(1.0)])
        view.button.setAttributedTitle(attributedString, forState: UIControlState.Normal)
        return view
    }
    
    func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        let footerView = view as! UITableViewHeaderFooterView
        footerView.contentView.backgroundColor = UIColor.clearColor()
        footerView.backgroundView = nil
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 11.0
    }
    
    func rowAppearAnimationDelay(indexPath: NSIndexPath) -> CFTimeInterval {
        var totalRow = indexPath.row
        for section in 0..<indexPath.section {
            totalRow += self.tableView(tableView, numberOfRowsInSection: section)
        }
        
        return 0.5 + CFTimeInterval(totalRow) * rowAppearDelay
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let videoCell = cell as! VideoTableViewCell
        
        let video = sections[indexPath.section].videos[indexPath.row]
        
        videoCell.videoImageView.image = video.image
        videoCell.titleLabel.text = video.title
        videoCell.subtitleLabel.text = video.subtitle
        videoCell.durationLabel.text = video.durationText
        videoCell.levelLabel.text = video.levelText
        videoCell.viewsLabel.text = video.viewsText
        videoCell.offlineView.hidden = !video.availableOffline
        
        videoCell.contentView.layer.removeAllAnimations()
        
        let rowAnimationBeginTime = rowsAppearStartTime + rowAppearAnimationDelay(indexPath)
        if CACurrentMediaTime() < rowAnimationBeginTime + rowAppearDuration {
            videoCell.animateAppearance(rowAppearDuration, beginTime: rowAnimationBeginTime)
        }
    }
}
