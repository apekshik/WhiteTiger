//
//  RecentsAndHitsCard.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/14/22.
//

import SwiftUI
import AVKit
import Firebase
import FirebaseStorage



struct RecentCard: View {
    @State private var player = AVPlayer()
    @State private var playToggle: Bool = true
    @State var video: VideoModel
    
    var body: some View {
        ZStack(alignment: .leading) {
            videoPlayer
            
            textOverlay
        }
        .frame(maxWidth: .infinity, maxHeight: 220, alignment: .leading)
        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 20))
        .cornerRadius(20)
    }
    
    
    var videoPlayer: some View {
        VideoPlayer(player: player)
            .scaledToFill()
            .onChange(of: video.videoUrlPath) { newValue in
                guard let url = newValue else {return}
                player = AVPlayer(url: url)
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
                    .padding(15)
                    .offset(x: 10)
                //Text(vManager.video.videoUrlPath?.absoluteString ?? "NIL")
            }
            .opacity(0.67)
        }
        .frame(maxWidth: .infinity, maxHeight: 200, alignment: .topLeading)
        .padding()
        .offset(y: 10)
        .foregroundColor(.white)

    }
}

struct Recents_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecentCard(video: exampleVideos[1])
        }
    }
}
