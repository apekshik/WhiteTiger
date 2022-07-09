//
//  HomeVideoPreviewCardView.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 7/1/22.
//

import SwiftUI
import RiveRuntime

struct Lcl_HomeVideoPreviewCard: View {
    // synced properties
    @Binding var videos: [VideoModel]
    @Binding var isZoomed: Bool
    var namespace: Namespace.ID
    @Binding var selectedUser: UserModel?
    
    // unsynced
    let cardTitle: String
        
    var body: some View {
        ZStack {
            background
            
            ZStack {
                glassBackTitle

                videoTabView
                
                //viewAllButton
            }
            .frame(maxWidth: .infinity, idealHeight: 330, maxHeight: 340)
        }
    }
    
    var glassBackTitle: some View {
        Text(cardTitle)
            .padding()
            .font(.title2.bold())
            .textCase(.uppercase)
            .frame(width: 260, height: 330, alignment: .top)
            .background(.thinMaterial)
            .cornerRadius(12)
            .opacity(0.6)
    }
    
    var videoTabView: some View {
        ZStack {
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
                            Lcl_ArtistProfileCard(showText: $isZoomed,
                                               namespace: namespace,
                                               user: eachUser,
                                               selectedUser: $selectedUser)
                            .frame(height: 120)
                            .scaleEffect(1 - (abs(195 - midX)/2200))
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
    }
    
    var viewAllButton: some View {
        GeometryReader { geo in
            let midX = geo.frame(in: .local).midX
            let midY = geo.frame(in: .local).midY
            Text("View All")
                .font(.title3.bold())
                .textCase(.uppercase)
                .frame(width: 130, height: 50)
//                    .background(.ultraThinMaterial)
                .background(LinearGradient(colors: [Color(hex: "00b386"), Color(hex: "5900b3")], startPoint: .bottomLeading, endPoint: .topTrailing))
                .foregroundColor(.white)
                .cornerRadius(7)
                .shadow(color: Color(hex: "F77D8E").opacity(0.5), radius: 18, y: 5)
                .position(x: midX + 90, y: midY + 102)
                .rotation3DEffect(.degrees(7), axis: (x: 0, y: -1, z: 0))
        }
        .background(.clear)
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

struct Lcl_HomeVideoPreviewCard_Previews: PreviewProvider {
    @Namespace static var np
    static var previews: some View {
        Lcl_HomeVideoPreviewCard(videos: .constant(exampleRecentVideos2),
                                 isZoomed: .constant(false),
                                 namespace: np,
                                 selectedUser: .constant(nil),
                                 cardTitle: "Recent Uploads"
        )
            .preferredColorScheme(.dark)
    }
}
