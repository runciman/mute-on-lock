//
//  NotificationHandler.swift
//  mute-on-lock
//
//  Created by Scott Runciman on 16/10/2016.
//  Copyright © 2016 Scott Runciman. All rights reserved.
//

import Cocoa

class NotificationHandler {

    //MARK: Lifecycle
    init() {
        NSWorkspace.shared().notificationCenter.addObserver(self, selector:#selector(screenDidWake(_:)) , name: .NSWorkspaceScreensDidWake, object: nil)
        
        NSWorkspace.shared().notificationCenter.addObserver(self, selector:#selector(screenDidSleep(_:)) , name: .NSWorkspaceScreensDidSleep, object: nil)
    }
    
    deinit {
        NSWorkspace.shared().notificationCenter.removeObserver(self)
    }
    
    //MARK: Notifications selectors
    @objc func screenDidWake(_ notification : NSNotification?) {
        AudioHandler.unMuteSystemAudio()
    }
    
    @objc func screenDidSleep(_ notification : NSNotification?) {
        AudioHandler.muteSystemAudio()
    }
}
