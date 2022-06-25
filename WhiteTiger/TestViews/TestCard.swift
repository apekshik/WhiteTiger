//
//  TestCard.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/24/22.
//

import SwiftUI
import AVKit

struct TestCard: View {
    @State private var player = AVPlayer()
    @State private var playToggle: Bool = true
    @State var video: VideoModel
    let testFootageUrl = Bundle.main.url(forResource: "Joji - Slow Dancing in the Dark (Official Video)", withExtension: "mp4")
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                videoPlayer
                    .mask(RoundedRectangle(cornerRadius: 20)
                        .frame(maxHeight: geo.frame(in: .local).height - 70, alignment: .center))
                    .overlay(alignment: .center, content: {
                        textOverlay
                            .padding([.top, .bottom], 45)
                            .padding([.leading, .trailing], 12)
                    })
                
            }
        }
        .padding()
        .frame(width: 350, height: 380)
    }
    
    var videoPlayer: some View {
            VideoPlayer(player: player)
                .scaledToFill()
                .onAppear {
                    player = AVPlayer(url: testFootageUrl!)
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
                .opacity(0.56)
            .background(.ultraThinMaterial)
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

struct TestCard_Previews: PreviewProvider {
    static var previews: some View {
        TestCard(video: exampleVideos[1])
    }
}

