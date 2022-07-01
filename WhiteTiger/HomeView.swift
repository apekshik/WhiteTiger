//
//  HomeView.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/29/22.
//

import SwiftUI
import RiveRuntime

struct HomeView: View {
    var body: some View {
        ZStack {
            background
            
            content
        }
    }
    
    var content: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                Text("HOME")
                    .font(.title.bold())
                    .opacity(0.8)
//                ScrollView(.horizontal, showsIndicators: false) {
//                    LazyHStack(spacing: 20) {
//                        ForEach(exampleRecentVideos2) { video in
//                            Lcl_VideoView(video: video)
//                        }
//
//                    }
//                    .padding([.leading], 10)
//                }
//                .ignoresSafeArea()
//                .frame(maxWidth: .infinity, maxHeight: 280, alignment: .center)
                                
                
                ZStack {
                    Text("Recent Uploads")
                        .padding()
                        .font(.title2.bold())
                        .textCase(.uppercase)
                        .frame(width: 260, height: 330, alignment: .top)
                        .background(.thinMaterial)
                        .cornerRadius(12)
                        .opacity(0.6)

                    TabView {
                        ForEach(exampleRecentVideos2) { video in
                            GeometryReader { geo in
                                let midX = geo.frame(in: .global).midX
                                let minX = geo.frame(in: .global).minX
                                Lcl_VideoView(video: video)
                                    .offset(x: 32)
                                    .scaleEffect(1 - (abs(195 - midX)/1200))
                                    .blur(radius: abs(minX) / 70)
                                    .rotation3DEffect(.degrees(6), axis: (x: 0, y: 1, z: 0))
                            }
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .frame(height: 280)
                }
                
                ZStack {
                    Text("")
                }
                .frame(maxWidth: .infinity, minHeight: 200, alignment: .leading)
                .background(.thinMaterial)
            
               
                ZStack {
                    
                    Text("Upcoming Shows")
                        .padding()
                        .font(.title2.bold())
                        .textCase(.uppercase)
                        .frame(width: 260, height: 330, alignment: .top)
                        .background(.ultraThinMaterial)
                        .cornerRadius(12)
                        .opacity(0.6)

                    TabView {
                        ForEach(exampleUpcomingSoonVideos) { video in
                            GeometryReader { geo in
                                let midX = geo.frame(in: .global).midX
                                let minX = geo.frame(in: .global).minX
                                Lcl_VideoView(video: video)
                                    .offset(x: 32)
                                    .scaleEffect(1 - (abs(195 - midX)/1200))
                                    .blur(radius: abs(minX) / 70)
                                    .rotation3DEffect(.degrees(6), axis: (x: 0, y: 1, z: 0))
                            }
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .frame(height: 280)
                }
                
                ZStack {
                    Text("")
                }
                .frame(maxWidth: .infinity, minHeight: 300, alignment: .leading)
                .background(.thinMaterial)
            }
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}


