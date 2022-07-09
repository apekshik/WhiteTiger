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
    
    let recentCardTitle: String = "Recent Uploads"
    
    var body: some View {
        VStack {
            if !isZoomed {
               Lcl_HomeVideoPreviewCard(videos: $videos, isZoomed: $isZoomed, namespace: namespace, selectedUser: $selectedUser, cardTitle: recentCardTitle)
            }
            
            if isZoomed {
                Lcl_ArtistMainView(videos: $videos,
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

struct TestView2_Previews: PreviewProvider {
    static var previews: some View {
        TestView2(videos: exampleRecentVideos2, user: exampleUsers[5])
            .preferredColorScheme(.dark)
    }
}
