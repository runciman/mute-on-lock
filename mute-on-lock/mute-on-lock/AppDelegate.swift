//
//  AppDelegate.swift
//  mute-on-lock
//
//  Created by Scott Runciman on 16/10/2016.
//  Copyright © 2016 Scott Runciman. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var notificationHandler : NotificationHandler?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        beingListeningForNotifications()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

private extension AppDelegate {

    func beingListeningForNotifications() {
        notificationHandler = NotificationHandler()
    }
}

