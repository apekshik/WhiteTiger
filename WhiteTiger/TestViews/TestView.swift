//
//  TestView.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/11/22.
//

import SwiftUI
import AVKit

struct TestView: View {
    
    let videos = exampleVideos
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 10) {
                VStack(spacing: 8) {
                    ArtistProfileCard()
                        .mask(RoundedRectangle(cornerRadius: 20))
                        .frame(minHeight: 500)
                    
                    Spacer()
                    
                    Text("ABOUT")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title3.bold())
                    Text("George Kusunoki Miller better known by his stage name Joji and formerly by his online aliases Filthy Frank and Pink Guy, is a Japanese artist, singer, writer, and performer.")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.body)
                        .opacity(0.7)
                }
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(videos) { video in
                            TestCard(video: video)
                        }
                    }
                    .offset(y: -30)
                }
                
                Text("COMING LIVE NEXT ON")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title3.bold())
                
                Text("14 highlights from Head In The Clouds 2021: Joji, NIKI, CL, Rich Brian, eaJ, BIBI, and more.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.body)
                    .opacity(0.7)

                
            }
            .padding(20)
        }
        
    }
}



struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
            .preferredColorScheme(.dark)
    }
}
