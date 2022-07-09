//
//  legacyViews.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 7/9/22.
//

import Foundation
import SwiftUI

struct legacyViews: View {
    
    @State var videos: [VideoModel] = []
    @State var isZoomed: Bool = false
    @Namespace var namespace
    
    @State var user: UserModel
    @State var selectedUser: UserModel? = nil

    var body: some View {
        EmptyView()
    }
    
    
    var userImage: some View {
        VStack {
            Image(user.localProfileUrl!)
                    .resizable().aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: "rec", in: namespace)
                    .mask(RoundedRectangle(cornerRadius: 10)
                        .matchedGeometryEffect(id: "rec", in: namespace))

        }
        .overlay {
            GeometryReader { geo in
                VStack(alignment: .leading) {
                    Text(user.artistName!.uppercased())
                        .font(.title)
                        .bold()
                        .matchedGeometryEffect(id: "artistName", in: namespace)
                    Text(user.occupation)
                        .matchedGeometryEffect(id: "occupation", in: namespace)
                    Text("\(user.followers) Followers")
                        .matchedGeometryEffect(id: "followerCount", in: namespace)
                }
                .frame(maxWidth: .infinity, maxHeight: 500, alignment: .bottomLeading)
                .opacity(isZoomed ? 1 : 0)
                .padding()
            }
        }
        .onTapGesture {
            withAnimation() {
                isZoomed.toggle()
            }
        }
    }
    
    var nonZoom: some View {
        VStack {
            Image(user.localProfileUrl!)
                    .resizable().aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: "rec", in: namespace)
                    .mask(RoundedRectangle(cornerRadius: 10)
                        .matchedGeometryEffect(id: "rec", in: namespace))

        }
        .overlay {
            GeometryReader { geo in
                VStack(alignment: .leading) {
                    Text(user.artistName!.uppercased())
                        .font(.title)
                        .bold()
                        .matchedGeometryEffect(id: "artistName", in: namespace)
                    Text(user.occupation)
                        .matchedGeometryEffect(id: "occupation", in: namespace)
                    Text("\(user.followers) Followers")
                        .matchedGeometryEffect(id: "followerCount", in: namespace)
                }
                .frame(maxWidth: .infinity, maxHeight: 100, alignment: .bottomLeading)
                .opacity(isZoomed ? 1 : 0)
                .padding()
            }
        }
        .onTapGesture {
            withAnimation() {
                isZoomed.toggle()
            }
        }
        
    }
    
    var fullZoom: some View {
        VStack {
            Image(user.localProfileUrl!)
                    .resizable().aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: "rec", in: namespace)
                    .mask(RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .matchedGeometryEffect(id: "rec", in: namespace))
        }
        .overlay {
            GeometryReader { geo in
                VStack(alignment: .leading) {
                    Text(user.artistName!.uppercased())
                        .font(.title)
                        .bold()
                        .matchedGeometryEffect(id: "artistName", in: namespace)
                    Text(user.occupation)
                        .matchedGeometryEffect(id: "occupation", in: namespace)
                    Text("\(user.followers) Followers")
                        .matchedGeometryEffect(id: "followerCount", in: namespace)
                }
                .frame(maxWidth: .infinity, maxHeight: 500, alignment: .bottomLeading)
                .opacity(isZoomed ? 1 : 0)
                .padding()
            }
        }
        .onTapGesture {
            withAnimation() {
                isZoomed.toggle()
            }
        }
        .offset(y: -100)
    }
    
    var textOverlay: some View {
        GeometryReader { geo in
                VStack(alignment: .leading) {
                    Text(user.artistName ?? "??")
                        .font(.title)
                        .bold()
                        .textCase(.uppercase)
                    Text(user.occupation)
                    Text("\(user.followers) Followers")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
        }
    }
}
