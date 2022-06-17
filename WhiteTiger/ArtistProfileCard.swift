//
//  ArtistProfileCard.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/12/22.
//

import SwiftUI
import FirebaseFirestore

let dbhandler = DBHandler()

struct ArtistProfileCard: View {
    @State var user: UserModel

    dbhandler.getArtistProfileCardData(artistName: "something") { userData in
        self.user = userData
    }
        
    var body: some View {
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
    }
        
}

struct ArtistProfileCard_Previews: PreviewProvider {
    static var previews: some View {
        ArtistProfileCard(user: users[0])
            .preferredColorScheme(.dark)
    }
}
