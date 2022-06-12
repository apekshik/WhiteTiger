//
//  ArtistMainView.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/11/22.
//

import SwiftUI
import RiveRuntime

struct ArtistMainView: View {
    var body: some View {
        ZStack {
            background
            
            VStack(alignment: .leading, spacing: 8) {
                Image("jojiP1")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Text("JOJI")
                    .font(.title)
                    .bold()
                Text("Singer, Writer, Producer ")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            .padding()
            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 15))
                
        }
        .padding()
        
        
        
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

struct ArtistMainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ArtistMainView()
                .preferredColorScheme(.dark)
                .previewInterfaceOrientation(.portrait)
        }
    }
}
