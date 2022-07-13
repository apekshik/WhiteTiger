//
//  AnalyticsOverviewCard.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 7/12/22.
//

import SwiftUI

struct Lcl_AnalyticsOverviewCard: View {
    var body: some View {
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
            .background(.linearGradient(colors: [Color(hex: "#03010d").opacity(0.8), Color(hex: "#240d6e").opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 8)
            .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 3)
            .overlay {
                GeometryReader { geo in
                    let endX = geo.size.width
                    Text("All Analytics".uppercased())
                        .bold()
                        .frame(maxWidth: 150, minHeight: 30, maxHeight: 40)
                        .background(.linearGradient(colors: [Color(hex: "#1e1e29"), Color(hex: "#a8aabf")], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        .shadow(color: Color(hex: "#2d3de3").opacity(0.3), radius: 5, x: 0, y: 3)
                        .position(x: endX - 85, y: 5)
                        
                }
            }

            Text("Premiered 4 hrs ago")
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 460, idealHeight: 460, maxHeight: 500, alignment: .top)
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .ignoresSafeArea()
        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 3)
        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 30)
        
    }
}

struct AnalyticsOverviewCard_Previews: PreviewProvider {
    static var previews: some View {
        Lcl_AnalyticsOverviewCard()
            .preferredColorScheme(.dark)
    }
}
