//
//  Lcl_ArtistProfileCard.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 7/1/22.
//

import SwiftUI

struct Lcl_ArtistProfileCard: View {
    @Binding var showInfo: Bool
    let user: UserModel
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            
            VStack(alignment: .leading) {
                Text(user.artistName ?? "??")
                    .font(.title)
                    .bold()
                    .textCase(.uppercase)
                Text(user.occupation)
                Text("\(user.followers) Followers")
            }
            .opacity(showInfo ? 1 : 0)

                
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
        .padding()
        .background(Image(user.localProfileUrl!)
                .resizable()
                .scaledToFill()
                .clipped()
                .opacity(0.9))
        .cornerRadius(30)
        .frame(minHeight: 500)
//        .ignoresSafeArea()
    }
}
                

struct Lcl_ArtistProfileCard_Previews: PreviewProvider {
    static var previews: some View {
        Lcl_ArtistProfileCard(showInfo: .constant(true), user: exampleUsers[4])
            .preferredColorScheme(.dark)
    }
}
