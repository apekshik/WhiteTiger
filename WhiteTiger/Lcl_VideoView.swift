//
//  VideoView.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/29/22.
//

import SwiftUI
import AVKit

struct Lcl_VideoView: View {
    @State private var player = AVPlayer()
    @State private var playToggle: Bool = false
    @State var video: VideoModel
    var body: some View {
        ZStack {
            GeometryReader { geo in
                let localFrameHeight = geo.frame(in: .local).height
                let localFrameWidth = geo.frame(in: .local).width
                videoPlayer
                    .background(.black)
                    .mask(RoundedRectangle(cornerRadius: 15)
                        .frame(maxHeight: localFrameHeight - 75, alignment: .center))
                    .overlay(alignment: .center, content: {
                        textOverlay
                            .frame(maxWidth: localFrameWidth - 20, maxHeight: localFrameHeight - 90, alignment: .center)
                            })

            }
        }
        //.padding()
        .frame(width: 350, height: 300)
        .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 5)
        .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 3)

    }
    
    var videoPlayer: some View {
        VideoPlayer(player: player)
            .onAppear {
                player = AVPlayer(url: Bundle.main.url(forResource: video.localVideoPath!, withExtension: "mp4")!)
//                player.play()
                playToggle.toggle()
            }
            .onDisappear {
                player.pause()
                playToggle.toggle()
            }
            .onTapGesture {
                if playToggle == false {
                    player.play()
                } else {
                    player.pause()
                }
                playToggle.toggle()
                let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                impactHeavy.impactOccurred()
            }
            .background(.ultraThinMaterial)
            .opacity(0.74)
            
    }
    
    var textOverlay: some View {
        VStack(alignment: .leading) {
            Text(video.title)
                .font(.title2.bold())
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

struct Lcl_VideoView_Previews: PreviewProvider {
    static var previews: some View {
        Lcl_VideoView(video: exampleRecentVideos2[1])
    }
}