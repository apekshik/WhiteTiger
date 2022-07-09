//
//  TestView2.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/29/22.
//

import SwiftUI
import RiveRuntime

struct TestView2: View {
    @State var isZoomed: Bool = false
    @Namespace var namespace
    
    var user: UserModel = exampleUsers[0]
    
    
    var body: some View {
        VStack {
            if !isZoomed {
                test_userImageView(showText: $isZoomed, namespace: namespace, user: user)
                    .frame(height: 100)
            }
            
            if isZoomed {
                test_userImageView(showText: $isZoomed, namespace: namespace, user: user)
                    .frame(height: 500)
            }
        }
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
        TestView2()
            .preferredColorScheme(.dark)
    }
}
