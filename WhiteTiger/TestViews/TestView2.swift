//
//  TestView2.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/29/22.
//

import SwiftUI
import RiveRuntime

struct TestView2: View {
    @State var isZoomed: Bool = true
    @State var showText: Bool = true
    @Namespace var namespace
    
    var user: UserModel = exampleUsers[1]
    
    
    var body: some View {
        VStack {
            let image = Image(user.localProfileUrl!)
            if !isZoomed {
                    image
                        .resizable().aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "rec", in: namespace)
                        .mask(RoundedRectangle(cornerRadius: 10)
                            .matchedGeometryEffect(id: "rec", in: namespace))
                        .frame(height: 150)
                        .onTapGesture {
                            withAnimation() {
                                isZoomed.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    self.showText.toggle()
                                }
                            }
                        }
            }
            else {
                    image
                        .resizable().aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "rec", in: namespace)
                        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .matchedGeometryEffect(id: "rec", in: namespace))
                        .frame(height: 400)
                        .onTapGesture {
                            withAnimation() {
                                isZoomed.toggle()
                            }
                            showText.toggle()
                        }
            }
        }
        .overlay {
            if showText {
                GeometryReader { geo in
                    VStack(alignment: .leading) {
                        Text(user.artistName!.uppercased())
                            .font(.title)
                            .bold()
                            .transition(.move(edge: .trailing))
                        Text(user.occupation)
                        Text("\(user.followers) Followers")
                    }
                    .transition(.opacity)
                    .background(Rectangle()
                        .fill(.ultraThinMaterial)
                        .blur(radius: 30)
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                    .padding()
                }
            }
        }
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
