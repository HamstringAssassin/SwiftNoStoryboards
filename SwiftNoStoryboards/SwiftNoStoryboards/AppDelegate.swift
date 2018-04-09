//
//  AppDelegate.swift
//  SwiftNoStoryboards
//
//  Created by Alan O'Connor on 29/04/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

import UIKit

private extension Selector {
    static let _longPress = #selector(AppDelegate._longPress(gesture:))
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var showGrid: Bool = false

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        _addLongPressGesture(view: window!)
        
        let mainViewController = ViewController()
        let navigationController = UINavigationController(rootViewController: mainViewController)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
    
    private func _addLongPressGesture(view: UIView) {
        let gesture = UILongPressGestureRecognizer(target: self, action: ._longPress)
        gesture.minimumPressDuration = 3
        
        view.addGestureRecognizer(gesture)
    }
    
    @objc fileprivate func _longPress(gesture: UILongPressGestureRecognizer) {
        print("a long press has happened")
        if gesture.state == .ended {
            if showGrid {
                self.window?.subviews.last?.removeFromSuperview()
                showGrid = false
            } else {
                let gridView = GridView(forAutoLayout: ())
                self.window?.addSubview(gridView)
                gridView.autoPinEdgesToSuperviewEdges()
                showGrid = true
            }
        }
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

