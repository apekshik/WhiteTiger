//
//  HomeView.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/29/22.
//

import SwiftUI
import RiveRuntime

struct Lcl_HomeView: View {
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

                
//                Lcl_HomeVideoPreviewCard(videos: exampleRecentVideos2, cardTitle: "Recent Uploads", selectedProfile: .constant(nil))
                
                ZStack {
                    Text("")
                }
                .frame(maxWidth: .infinity, minHeight: 200, alignment: .leading)
                .background(.thinMaterial)
            
               
//                Lcl_HomeVideoPreviewCard(videos: exampleUpcomingSoonVideos, cardTitle: "Coming Soon", selectedProfile: .constant(nil))
                
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
        Lcl_HomeView()
            .preferredColorScheme(.dark)
    }
}


