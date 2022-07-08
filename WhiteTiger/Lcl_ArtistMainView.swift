//
//  Lcl_ArtistMainView.swift
//  Project: WhiteTiger
//
//  Created by Apekshik Panigrahi on 7/4/22.
//
// Local Frontend Testing of Artist's main Page. Contains profile picture, about, recent
// videos, live shows, and more... 

import SwiftUI
import RiveRuntime

struct Lcl_ArtistMainView: View {
    // synced 
    @Namespace var animations
    @State var showProfileInfo: Bool = true
    @State var ArtistPagePfpHeight: Double = 500
//    @State var user: UserModel
    @Binding var selectedUser: UserModel?
    // local
    var videos = exampleVideos
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
            
            VStack(spacing: 17) {
                Lcl_ArtistProfileCard(showText: $showProfileInfo,
                                      namespace: animations,
                                      pfpHeight: ArtistPagePfpHeight,
                                      user: selectedUser!
                )
                .onTapGesture {
                    withAnimation {
                        selectedUser = nil
                        showProfileInfo.toggle()
                    }
                }
                VStack(spacing: 4) {
                    Text("ABOUT")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title3.bold())
                    Text("George Kusunoki Miller better known by his stage name Joji and formerly by his online aliases Filthy Frank and Pink Guy, is a Japanese artist, singer, writer, and performer.")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.body)
                        .opacity(0.7)
                }
                
            }
                
            TabView {
                ForEach(videos) { video in
                    if video.recentsAndHits! {
                        Lcl_VideoView(video: video)
                    }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 280)
        
            Text("COMING LIVE NEXT ON")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title3.bold())
            
            Text("14 highlights from Head In The Clouds 2021 – Joji, NIKI, CL, Rich Brian, eaJ, BIBI, and more.")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.body)
                .opacity(0.7)
            
            // Testing difference between tabviews and scroll views
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(videos) { video in
                        if video.recentsAndHits! {
                            Lcl_VideoView(video: video)
                        }
                    }
                }
            }
            

        
        }
        .padding()
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

struct Lcl_ArtistMainView_Previews: PreviewProvider {
    static var previews: some View {
        Lcl_ArtistMainView(selectedUser: .constant(exampleUsers[0]))
            .preferredColorScheme(.dark)
    }
}
