//
//  ArtistMainView.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/11/22.
//

import SwiftUI
import RiveRuntime

struct ArtistMainView: View {
    @StateObject var videoManager = VideoManager()
    var body: some View {
        ZStack {
            background
            
            ScrollView(showsIndicators: false) {
                content
            }
        }
    }
    
    var content: some View {
        VStack(spacing: 8) {
            
            ArtistProfileCard()
                .mask(RoundedRectangle(cornerRadius: 20))
                .frame(minHeight: 500)
            
            VStack(spacing: 4) {
                Text("ABOUT")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title3.bold())
                Text("George Kusunoki Miller better known by his stage name Joji and formerly by his online aliases Filthy Frank and Pink Guy, is a Japanese artist, singer, writer, and performer.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.body)
                    .opacity(0.7)
            }
            .padding(20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(videoManager.videos) { video in
                        RecentCard(video: video)
                    }
                }
                .onChange(of: videoManager.videos) { _ in
                    print("VM loaded Recents Videos")
                }
                
            }
        
        }
        .padding(20)
        .task {
            await videoManager.loadRecentVideos(ofArtist: "Joji")
        }
    }
    
    var background: some View {
        RiveViewModel(fileName: "shapes").view()
            .ignoresSafeArea()
            .blur(radius: 60)
            .background(
                Image("Spline")
                    .blur(radius: 40)
                    .offset(x: 200, y: 100)
            )
            .background(.black)
    }
        
}

struct ArtistMainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ArtistMainView()
                .preferredColorScheme(.dark)
                .previewInterfaceOrientation(.portrait)
        }
    }
}
