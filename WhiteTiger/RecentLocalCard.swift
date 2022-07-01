//
//  RecentLocalCard.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/14/22.
//

import SwiftUI
import AVKit



struct RecentLocalCard: View {
    @State private var player = AVPlayer()
    @State private var playToggle: Bool = true
    @State var video: VideoModel
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                let localFrameHeight = geo.frame(in: .local).height
                let localFrameWidth = geo.frame(in: .local).width
                videoPlayer
                    .mask(RoundedRectangle(cornerRadius: 15)
                        .frame(maxHeight: localFrameHeight - 75, alignment: .center))
                    .overlay(alignment: .center, content: {
                        textOverlay
                            .frame(maxWidth: localFrameWidth - 20, maxHeight: localFrameHeight - 85, alignment: .center)
                            })
                
            }
        }
        //.padding()
        .frame(width: 350, height: 300)
    }
    
    
    var videoPlayer: some View {
        VideoPlayer(player: player)
            .scaledToFill()
            .onAppear {
                player = AVPlayer(url: Bundle.main.url(forResource: video.localVideoPath!, withExtension: "mp4")!)
                player.play()
            }
            .onTapGesture {
                if playToggle == false {
                    player.play()
                    playToggle = true
                } else {
                    player.pause()
                    playToggle = false
                }
                let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                impactHeavy.impactOccurred()
            }
            .background(.ultraThinMaterial)
            .opacity(0.74)  
    }
    
    var textOverlay: some View {
        VStack(alignment: .leading) {
            Text(video.title)
                .font(.title.bold())
                .textCase(.uppercase)
            VStack(alignment: .leading) {
                Text(video.title2)
                    .font(.body)
                Text("\(video.viewCount) Views")
                    .font(.body)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            }
            .opacity(0.67)
        }
        .foregroundColor(.white)
    }
}

struct RecentLocalCard_Previews: PreviewProvider {
    static var previews: some View {
        RecentLocalCard(video: exampleRecentVideos2[0])
        
    }
}
