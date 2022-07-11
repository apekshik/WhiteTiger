//
//  TestVideoView.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/29/22.
//

import SwiftUI
import AVKit

struct TestVideoView: View {
    @State private var player = AVPlayer()
    @State private var playToggle: Bool = true
    @State var video: VideoModel
    var body: some View {
        ZStack {
            GeometryReader { geo in
                let localFrameHeight = geo.frame(in: .local).height
                let localFrameWidth = geo.frame(in: .local).width
                videoPlayer
                
            }
        }
        //.padding()
        .frame(width: 350, height: 300)

    }
    
    var videoPlayer: some View {
        VideoPlayer(player: player)
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
            
    }}

struct TestVideoView_Previews: PreviewProvider {
    static var previews: some View {
        TestVideoView(video: exampleRecentVideos2[1])
    }
}
