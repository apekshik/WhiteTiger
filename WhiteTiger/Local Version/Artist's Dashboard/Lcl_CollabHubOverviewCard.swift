//
//  Lcl_CollabHubOverviewCard.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 7/13/22.
//

import SwiftUI

struct Lcl_CollabHubOverviewCard: View {
    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 4) {
                Text("Group Chats".uppercased())
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            VStack(spacing: 10) {
                Text("You x NIKI x Rich Brian")
                    .font(.subheadline)
                    .opacity(0.8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    Text("NIKI: They signed off the written pi...")
                        .font(.body)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Rich Brian: Yeah, looked at that shi...")
                        .font(.body)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Divider()
                
                Text("88 Rising")
                    .font(.subheadline)
                    .opacity(0.8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    Text("JOJI: Imma smack that tupac off y...")
                        .font(.body)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("High Bros: Nah fam")
                        .font(.body)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("JOJI: Man get yo yee yee ass hairc...")
                        .font(.body)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)

                }

                
                Divider()
                
                Text("88 Rising")
                    .font(.subheadline)
                    .opacity(0.8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    Text("JOJI: Imma smack that tupac off y...")
                        .font(.body)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("High Bros: Nah fam")
                        .font(.body)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("JOJI: Man get yo yee yee ass hairc...")
                        .font(.body)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)

                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(.linearGradient(colors: [Color(hex: "#0c0a24").opacity(0.8), Color(hex: "#096b4c").opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 8)
            .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 3)
            .overlay {
                GeometryReader { geo in
                    let endX = geo.size.width
                    Text("View All".uppercased())
                        .bold()
                        .foregroundColor(.black)
                        .frame(maxWidth: 120, minHeight: 30, maxHeight: 40)
                        .background(Color(hex: "#fbf7f5"))
                        .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 3)
                        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 30)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .stroke(.linearGradient(colors: [.white.opacity(0.8), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
                        )
                        .position(x: endX - 80, y: 5)
                        
                }
            }

            VStack(spacing: 4) {
                Text("Private Messages".uppercased())
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            VStack(spacing: 10) {
                Text("Rich Brian")
                    .font(.subheadline)
                    .opacity(0.8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    Text("They signed off the written papers and...")
                        .font(.body)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Yeah, looked at that shit and fou...")
                        .font(.body)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Divider()
                
                Text("88 Rising")
                    .font(.subheadline)
                    .opacity(0.8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    Text("JOJI: Imma smack that tupac off y...")
                        .font(.body)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("High Bros: Nah fam")
                        .font(.body)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("JOJI: Man get yo yee yee ass hairc...")
                        .font(.body)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)

                }

                
                Divider()
                
                Text("88 Rising")
                    .font(.subheadline)
                    .opacity(0.8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    Text("JOJI: Imma smack that tupac off y...")
                        .font(.body)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("High Bros: Nah fam")
                        .font(.body)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("JOJI: Man get yo yee yee ass hairc...")
                        .font(.body)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)

                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(.linearGradient(colors: [Color(hex: "#0c0a24").opacity(0.8), Color(hex: "#630630").opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 8)
            .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 3)
            .overlay {
                GeometryReader { geo in
                    let endX = geo.size.width
                    Text("View All".uppercased())
                        .bold()
                        .foregroundColor(.black)
                        .frame(maxWidth: 120, minHeight: 30, maxHeight: 40)
                        .background(Color(hex: "#fbf7f5"))
                        .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 3)
                        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 30)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .stroke(.linearGradient(colors: [.white.opacity(0.8), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
                        )
                        .position(x: endX - 80, y: 5)
                        
                }
            }

            
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 400, maxHeight: .infinity, alignment: .top)
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 3)
        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 30)

    }
}

struct Lcl_CollabHubOverviewCard_Previews: PreviewProvider {
    static var previews: some View {
        Lcl_CollabHubOverviewCard()
    }
}
