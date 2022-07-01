//
//  TestView2.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/29/22.
//

import SwiftUI
import RiveRuntime

struct TestView2: View {
    var body: some View {
        ZStack {
            background
            
            VStack(alignment: .center, spacing: 10) {
                Text("TO ARTISTS, CREATORS, AND INNOVATORS OF THE WORLD")
                    .font(.title.bold())
                    .multilineTextAlignment(.center)
                Text("Our Goal is simple: we are handing over power to where it rightfully belongs: You. I’m tired of seeing true talent being shunned, outcasted, and sidelined. Since no one’s really doing anything about it, I took matters into my own hands. And so lo and behold: Project WhiteTiger was born. So, stay tuned; exciting times are coming...")
                    .font(.body)
                    .opacity(0.8)
            }
            .padding()
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
