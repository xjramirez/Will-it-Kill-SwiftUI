//
//  File.swift
//  Will It Kill
//
//  Created by Xavier Ramirez on 10/14/23.
//
import Foundation
import SwiftUI
import PresentationKit
import AVKit

class Videos: SlideModel {
    let name: String = "Videos"
    let duration: CGFloat = 3
    let transition: PresentationKit.Transition = .fade
    
    func view(t: CGFloat, scale: CGFloat) -> AnyView {
        AnyView(
            VideosView(t: t, scale: scale)
                .environmentObject(self)
        )
    }
}

struct VideosView: SlideView {
    @EnvironmentObject var model: Videos
    
    var t: CGFloat
    var scale: CGFloat
    
    @State var players: [AVPlayer]?
    @State var game: String = "gg"
    
    let sfsize: Int = 17
    let ggsize: Int = 23
    let dbfzsize: Int = 5
    let tekkensize: Int = 5
    let kusosize: Int = 31
    
    
    
    
    
    var body: some View {
        
        Color.gray
        
        let sizesDict = ["streetfighter" : sfsize,
                         "gg" : ggsize,
                         "tekken" : tekkensize,
                         "dbfz" : dbfzsize,
                         "kuso" : kusosize,
                        ]
        
        let gamesArray = Array(sizesDict.keys)
        
        
        HStack (spacing: 250 * scale) {
            VStack (spacing: 150 * scale) {
                Image("sflogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 1000 * scale, height: 1000 * scale)
                    .onTapGesture {
                        game = "streetfighter";
                    }
                Image("gglogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 1000 * scale, height: 1000 * scale)
                    .onTapGesture {
                        game = "gg";
                        // iterate t
                    }
            }
            
            VStack (spacing: 150 * scale) {
                Image("tekkenlogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 1000 * scale, height: 1000 * scale)
                    .onTapGesture {
                        game = "tekken";
                    }
                Image("dbfzlogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 1000 * scale, height: 1000 * scale)
                    .onTapGesture {
                        game = "dbfz";
                    }
            }
            VStack (spacing: 150 * scale) {
                Text("クソゲー")
                    .font(.system(size: 450 * scale))
                    .onTapGesture {
                        game = "kuso";
                    }
                Text("???")
                    .font(.system(size: 450 * scale))
                    .onTapGesture {
                        game = gamesArray.randomElement()!;
                    }
            }
        }
        if (t > 0) {
            ZStack {
                if let players {
                    ForEach(0..<players.count, id: \.self) { i in
                        let player = players[i]
                        AVPlayerControllerRepresented(player: player)
                            .opacity(i <= Int(t - 1) ? 1 : 0)
                    }
                } else {
                    Text("Error loading video.")
                }
            }
            
            .onAppear {
                let vidnum = Int.random(in: 1..<((sizesDict[game]!) + 1))
                players = (1...Int(model.duration-1)).map { index in
                    AVPlayer(url: createLocalUrl(for: "\(game)_\(vidnum)_\(index)", ofType: "mp4")!)
                }
                
                if let players {
                    players[0].seek(to: .zero)
                    players[0].play()
                }
            }
            .onChange(of: t) { newValue in
                if let players {
//         œ           if (t == 2) {
//                        players[1].seek(to: .zero)
//                        players[1].play()
//                    }
                    if (0..<model.duration-1).contains(newValue - 1) {
                        if newValue > t {
                            players[Int(newValue - 1)].seek(to: .zero)
                            players[Int(newValue - 1)].play()
                        }
                    }
                }
            }
        }
    }
}
