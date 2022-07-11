//
//  ArtistProfileCard.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/12/22.
//

import SwiftUI
import Firebase
import FirebaseFirestore


struct ArtistProfileCard: View {
    @StateObject var fireManager = NFirestoreManager()
    //@StateObject var storage = FirebaseStorageManager()
    
    
    
    var body: some View {
        VStack {
            if let user = fireManager.userData {
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
            .background(AsyncImage(url: fireManager.profileImageUrl) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .opacity(0.8)
            } placeholder: {
                Text("Image still Loading!!")
            })
            .ignoresSafeArea()
            } else {
                Text("Empty View!")
            }
        }
        .task {
            await fireManager.loadUserData()
            await fireManager.loadProfileImageUrl()
        }
    }
        
}

struct ArtistProfileCard_Previews: PreviewProvider {
    static var previews: some View {
        ArtistProfileCard()
            .preferredColorScheme(.dark)
    }
}
