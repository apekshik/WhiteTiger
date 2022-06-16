//
//  ArtistProfileCard.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/12/22.
//

import SwiftUI

struct ArtistProfileCard: View {
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text("JOJI")
                .font(.title)
                .bold()
            Text("Singer, Writer, Producer")
            Text("7.6 Million Followers")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
        .padding()
        .background(Image("jojiP1")
            .resizable()
            .scaledToFill()
            .clipped()
            .opacity(0.8)
        )
        .ignoresSafeArea()
    }
        
}

struct ArtistProfileCard_Previews: PreviewProvider {
    static var previews: some View {
        ArtistProfileCard()
            .preferredColorScheme(.dark)
    }
}
