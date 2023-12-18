//
//  Will_It_KillApp.swift
//  Will It Kill
//
//  Created by Xavier Ramirez on 10/14/23.
//

import SwiftUI
import PresentationKit

@main
struct Will_It_KillApp: App {
    @StateObject var model = Presentation(bgColor: .white, slides: [
        Videos()
        // put more slides here
    ])
    
    
    var body: some Scene {
        WindowGroup {
            PresentationView()
                .environmentObject(model)
        }
        
        .commands {
                    CommandMenu("Control") {
                        Text("Current frame: \(Int(model.keyframe))")
                        
                        Button("Next Keyframe") {
                            model.nextKeyframe()
                        }
                        .keyboardShortcut("N")
                        
                        Button("Previous Keyframe") {
                            model.prevKeyFrame()
                        }
                        .keyboardShortcut("B")
                    }
                }
    }
}
