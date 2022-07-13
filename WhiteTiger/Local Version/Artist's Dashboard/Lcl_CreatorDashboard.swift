//
//  Lcl_CreatorDashboard.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 7/11/22.
//
// This is the first page every creator falls into when they want to manage their
// work, upload new work, look at analytics and sales, collaborate with other
// artists, and interact with their fans. This page provides a brief overview of
// all of these things and a navigation system to dedicated pages for all the activities
// mentioned above.

import SwiftUI
import RiveRuntime

struct Lcl_CreatorDashboard: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 16) {
                VStack(spacing: 3) {
                    Text("Welcome".uppercased())
                        .font(.title3).bold()
                    Text("Creator Dashboard".uppercased())
                        .font(.title).bold()
                    Text("You're provided here with a brief overview of everything an artist needs to know about their business. A bird's eye view if you will.").opacity(0.85)
                        .font(.body)
                }
                
                Text("Analytics Overview Rack".uppercased())
                    .bold()
               
                Lcl_AnalyticsOverviewCard()
                
                Spacer()
                
                Text("Collaborator Hub Overview".uppercased())
                    .bold()
                
                Lcl_CollabHubOverviewCard()
                
                Text("Fan Space Overview".uppercased())
                    .bold()
                
                Lcl_FanSpaceOverviewCard()
            }
                
        }
        .padding(12)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(background)
        .ignoresSafeArea()
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

struct Lcl_CreatorDashboard_Previews: PreviewProvider {
    static var previews: some View {
        Lcl_CreatorDashboard()
            .preferredColorScheme(.dark)
    }
}
