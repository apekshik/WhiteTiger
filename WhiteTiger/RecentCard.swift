//
//  RecentsAndHitsCard.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/14/22.
//

import SwiftUI
import AVKit

struct RecentCard: View {
    @State private var recentUrl = Bundle.main.url(forResource: "Joji - Glimpse of Us (Official Video)", withExtension: "mp4")
    @State private var player = AVPlayer()
    @State private var playToggle: Bool = true
    
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
            .onAppear {
                // forced unwrapping exclamation operator:
                player = AVPlayer(url: recentUrl!)
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
            Text("GLIMPSE OF US")
                .font(.title.bold())
            VStack(alignment: .leading) {
                Text("Album release – Single")
                    .font(.body)
                Text("13.7 Million Views")
                    .font(.body)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                    .padding(15)
                    .offset(x: 10)
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
            RecentCard()
        }
    }
}
