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
        ScrollView {
            VStack(spacing: 16) {
                VStack(spacing: 3) {
                    Text("Welcome".uppercased())
                        .font(.title3).bold()
                    Text("Home".uppercased())
                        .font(.title).bold()
                    
                    Text("You're provided here with a brief overview of everything an artist needs to know about their business. A bird's eye view if you will.").opacity(0.85)
                        .font(.body)
                }
                
                VStack(spacing: 8) {
                    VStack(spacing: 4) {
                        Text("Slow Dancing in the Dark".uppercased())
                            .font(.title2)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Official Music Video")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .opacity(0.8)
                    }
                    VStack(spacing: 10) {
                        Text("Average View Duration")
                            .font(.subheadline)
                            .opacity(0.8)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("3.76 MINS")
                            .font(.largeTitle)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Divider()
                        
                        Text("Profile Visits")
                            .font(.subheadline)
                            .opacity(0.8)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("429,043")
                            .font(.largeTitle)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Divider()
                        
                        Text("Collaborators Reach")
                            .font(.subheadline)
                            .opacity(0.8)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("37,441")
                            .font(.largeTitle)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("View Likes, Comments, and QAs")
                            .bold()
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, maxHeight: 60)
                            .background(Color(hex: "#fbf7f5"))
                            .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
                            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 3)
                            .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 30)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .stroke(.linearGradient(colors: [.white.opacity(0.8), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
                            )
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
//                    .background(.angularGradient(colors: [Color(hex: "#860ea1"), Color(hex: "#3a27c4").opacity(0.7)], center: .center, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 368)))
//                    .background(.linearGradient(colors: [Color(hex: "#860ea1"), Color(hex: "#3a27c4").opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .background(.linearGradient(colors: [Color(hex: "#0c0a24").opacity(0.8), Color(hex: "#3a27c4").opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .cornerRadius(20)
//                    .shadow(color: Color(hex: "#de126a").opacity(0.5), radius: 10, x: 0, y: 8)
//                    .shadow(color: Color(hex: "#3a27c4").opacity(0.5), radius: 5, x: 0, y: 3)
                    .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 8)
                    .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 3)



                    Text("Premiered 4 hrs ago")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding()
                .frame(maxWidth: .infinity, minHeight: 460, alignment: .top)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 3)
                .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 30)

            }
            .padding(12)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(background)
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
