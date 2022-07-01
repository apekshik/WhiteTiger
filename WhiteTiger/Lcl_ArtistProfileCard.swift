//
//  Lcl_ArtistProfileCard.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 7/1/22.
//

import SwiftUI

struct Lcl_ArtistProfileCard: View {
    @Binding var hideInfo: Bool
    let user: UserModel
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            if hideInfo == false {
                VStack(alignment: .leading) {
                    Text(user.artistName ?? "??")
                        .font(.title)
                        .bold()
                        .textCase(.uppercase)
                    Text(user.occupation)
                    Text("\(user.followers) Followers")
                }
            } else {
                VStack(alignment: .leading) {
                    Text("")
                        .font(.title)
                        .bold()
                        .textCase(.uppercase)
                    Text("")
                    Text("")
                }
            }
                
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
        .padding()
        .background(Image(user.localProfileUrl!)
                .resizable()
                .scaledToFill()
                .clipped()
                .opacity(0.9))
        .ignoresSafeArea()
    }
}
                

struct Lcl_ArtistProfileCard_Previews: PreviewProvider {
    static var previews: some View {
        Lcl_ArtistProfileCard(hideInfo: .constant(false), user: exampleUsers[2])
            .preferredColorScheme(.dark)
    }
}
