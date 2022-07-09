//
//  TestView2.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/29/22.
//

import SwiftUI
import RiveRuntime

struct TestView2: View {
    @State var videos: [VideoModel]
    @State var isZoomed: Bool = false
    @Namespace var namespace
    
    @State var user: UserModel
    @State var selectedUser: UserModel? = nil
    
    
    var body: some View {
        VStack {
            if !isZoomed {
                TabView {
                    ForEach(videos) { video in
                        GeometryReader { geo in
                            let midX = geo.frame(in: .global).midX
                            let minX = geo.frame(in: .global).minX
                            let lmidX = geo.frame(in: .local).midX
                            let lmidY = geo.frame(in: .local).midY
                            Lcl_VideoView_Home(video: video)
                                .scaleEffect(1 - (abs(195 - midX)/1200))
                                .blur(radius: abs(minX) / 70)
                                .rotation3DEffect(.degrees(6), axis: (x: 0, y: 1, z: 0))
                                .position(x: lmidX + 10, y: lmidY)
                            if let eachUser = UserModel.fetchUserProfile(for: video.ownerName!) {
                                test_userImageView(showText: $isZoomed,
                                                   namespace: namespace,
                                                   user: eachUser,
                                                   selectedUser: $selectedUser)
                                .frame(height: 100)
                                .scaleEffect(1.2 - (abs(195 - midX)/2200))
                                .position(x: lmidX - 110, y: lmidY + 100)
                                .blur(radius: abs(minX) / 50)
                                .shadow(color: Color(hex: "000000").opacity(0.9), radius: 10, x: 0, y: 0)
                            } else {
                                Text("Failed to fetch user for video card rack.")
                            }
                        }
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: 400)
            }
            
            if isZoomed {
                ZStack {
                    background
                    
                    VStack(spacing: 17) {
                        if selectedUser != nil {
                            test_userImageView(showText: $isZoomed, namespace: namespace, user: selectedUser!, selectedUser: $selectedUser)
                                .frame(maxHeight: .infinity)
                            VStack(spacing: 4) {
                                Text("ABOUT")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.title3.bold())
                                Text("George Kusunoki Miller better known by his stage name Joji and formerly by his online aliases Filthy Frank and Pink Guy, is a Japanese artist, singer, writer, and performer.")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.body)
                                    .opacity(0.7)
                            }
                            .padding()
                            Spacer()
                        } else {
                            Text("User not selected on tap of profile!")
                        }
                    }
                }
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

struct TestView2_Previews: PreviewProvider {
    static var previews: some View {
        TestView2(videos: exampleRecentVideos2, user: exampleUsers[5])
            .preferredColorScheme(.dark)
    }
}
