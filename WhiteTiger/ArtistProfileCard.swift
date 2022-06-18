//
//  ArtistProfileCard.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/12/22.
//

import SwiftUI
import Firebase
import FirebaseFirestore

let dbhandler = DBHandler()

struct ArtistProfileCard: View {
    @StateObject var dbhandler = DBHandler()
        
    var body: some View {
        VStack {
            if let user = dbhandler.userData {
                VStack(alignment: .leading) {
                Spacer()
                Text(user.artistName ?? "??")
                    .font(.title)
                    .bold()
                    .textCase(.uppercase)
                Text(user.occupation)
                Text("\(user.followers) Followers")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            .padding()
            .background(Image(user.profileUrl ?? "")
                .resizable()
                .scaledToFill()
                .clipped()
                .opacity(0.8)
            )
            .ignoresSafeArea()
            } else {
                Text("Empty View!")
            }
        }
    }
        
}

struct ArtistProfileCard_Previews: PreviewProvider {
    static var previews: some View {
        ArtistProfileCard()
            .preferredColorScheme(.dark)
    }
}
