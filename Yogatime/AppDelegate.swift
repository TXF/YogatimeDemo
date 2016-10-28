//
//  AppDelegate.swift
//  Yogatime
//
//  Created by David  
//  Copyright © 2016 David. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let tabBarController = UITabBarController()
        
        let featuredViewController = UIViewController()
        featuredViewController.tabBarItem.title = NSLocalizedString("Featured", comment: "")
        featuredViewController.tabBarItem.image = UIImage(named: "Featured")
        
        let challengesViewController = UIViewController()
        challengesViewController.tabBarItem.title = NSLocalizedString("Challenges", comment: "")
        challengesViewController.tabBarItem.image = UIImage(named: "Challenges")
        
        let searchViewController = UIViewController()
        searchViewController.tabBarItem.title = NSLocalizedString("Search", comment: "")
        searchViewController.tabBarItem.image = UIImage(named: "Search")
        
        let storyBoard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let myProfileViewController = storyBoard.instantiateInitialViewController()!
        myProfileViewController.tabBarItem.title = NSLocalizedString("My profile", comment: "")
        myProfileViewController.tabBarItem.image = UIImage(named: "Profile - active")
        
        tabBarController.viewControllers = [featuredViewController, challengesViewController, searchViewController, myProfileViewController]
        tabBarController.selectedViewController = myProfileViewController
        tabBarController.tabBar.barStyle = UIBarStyle.Black
        tabBarController.tabBar.barTintColor = UIColor.blackColor()
        
        UITabBarItem.appearance().setTitleTextAttributes([
            NSKernAttributeName : 0.1,
            NSFontAttributeName : UIFont.systemFontOfSize(10.0),
            NSForegroundColorAttributeName : UIColor().ytsGreyishColor()
            ],
            forState: UIControlState.Normal)
        UITabBarItem.appearance().setTitleTextAttributes([
            NSForegroundColorAttributeName : UIColor().ytsSandColor()
            ],
            forState: UIControlState.Selected)
        
        window?.tintColor = UIColor().ytsSandColor()
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}


