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
    
    var scale: Double {
        isZoomed ? 1 : 0.3
    }
    
    var body: some View {
        ZStack {
            background
            
            ZStack {
                    Lcl_ArtistProfileCard(hideInfo: .constant(false), user: exampleUsers[2])
                        .cornerRadius(20)
                        .shadow(color: .black, radius: 20, x: 0, y: 0)
                        .scaleEffect(scale)
            }
            .padding()
        }
        .onTapGesture {
            withAnimation(.spring()) {
                isZoomed.toggle()
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
        TestView2()
            .preferredColorScheme(.dark)
    }
}
