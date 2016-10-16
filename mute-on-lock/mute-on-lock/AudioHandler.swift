//
//  AudioHandler.swift
//  mute-on-lock
//
//  Created by Scott Runciman on 16/10/2016.
//  Copyright © 2016 Scott Runciman. All rights reserved.
//

import Cocoa

class AudioHandler {
    
    enum AppleScript : String {
        case Mute = "set volume with output muted"
        case UnMute = "set volume without output muted"
    }

    class func muteSystemAudio() {
        run(appleScript: .Mute)
    }
    
    class func unMuteSystemAudio() {
        run(appleScript: .UnMute)
    }
    
    class func run(appleScript script : AppleScript) {
        let script = NSAppleScript(source : script.rawValue)
        
        guard let _ = script else {
            print("couldn't init script")
            return
        }
        var error : NSDictionary? = nil
        _ = script?.executeAndReturnError(&error)
        
        if let scriptError = error {
            print("Script failed with dict: \(scriptError)")
            return
        }
    }
}
