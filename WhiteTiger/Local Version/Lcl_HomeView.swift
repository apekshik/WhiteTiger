//
//  HomeView.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/29/22.
//
// This View essentially should only house the Home view (with recent uploads, coming soon, etc.)
// but we have the switch to the Artist Main view here too for the time being. 

import SwiftUI
import RiveRuntime

struct Lcl_HomeView: View {
    @State var recentsAndHits: [VideoModel]
    @State var comingSoonVideos: [VideoModel]
    @State var isZoomed: Bool = false
    @Namespace var namespace
    @State var user: UserModel
    @State var selectedUser: UserModel? = nil
    
    let recentCardTitle: String = "Recent Uploads"
    let comingSoonTitle: String = "Coming Soon"
    
    var body: some View {
        ScrollView {
                if !isZoomed {
                    VStack {
                        Text("HOME")
                            .font(.title.bold())
                            .opacity(0.8)

                        Lcl_HomeVideoPreviewCard(videos: $recentsAndHits, isZoomed: $isZoomed, namespace: namespace, selectedUser: $selectedUser, cardTitle: recentCardTitle)
                        
                        ZStack {
                            Text("")
                        }
                        .frame(maxWidth: .infinity, minHeight: 200, alignment: .leading)
                        .background(.thinMaterial)
                        
                        Lcl_HomeVideoPreviewCard(videos: $comingSoonVideos, isZoomed: $isZoomed, namespace: namespace, selectedUser: $selectedUser, cardTitle: comingSoonTitle)
                        
                        ZStack {
                            Text("")
                        }
                        .frame(maxWidth: .infinity, minHeight: 300, alignment: .leading)
                        .background(.thinMaterial)
                    }
                }
                
                if isZoomed {
                    Lcl_ArtistMainView(videos: $recentsAndHits,
                                       isZoomed: $isZoomed,
                                       namespace: namespace,
                                       user: $user,
                                       selectedUser: $selectedUser)
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
        Lcl_HomeView(recentsAndHits: exampleRecentVideos2, comingSoonVideos: exampleUpcomingSoonVideos, user: exampleUsers[5])
            .preferredColorScheme(.dark)
    }
}


