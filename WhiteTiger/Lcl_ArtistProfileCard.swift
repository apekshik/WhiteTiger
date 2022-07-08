//
//  Lcl_ArtistProfileCard.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 7/1/22.
//

import SwiftUI

struct Lcl_ArtistProfileCard: View {
    // Since the artist Profile card doesn't really care which parent fetches
    // it, it doesn't need a binding to the user var and pfpHeight var as well. 
    @Binding var showText: Bool
    var namespace: Namespace.ID
    var pfpHeight: Double
    let user: UserModel
    
    var body: some View {
        VStack {
            Image(user.localProfileUrl!)
                .resizable().aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: user.id, in: namespace)
                .mask(RoundedRectangle(cornerRadius: 10)
                    .matchedGeometryEffect(id: user.id, in: namespace))
            .frame(height: pfpHeight)
        }
        .overlay {
            GeometryReader { geo in
                VStack(alignment: .leading) {
                    Text(user.artistName!.uppercased())
                        .font(.title)
                        .bold()
                        .transition(.move(edge: .trailing))
                    Text(user.occupation)
                    Text("\(user.followers) Followers")
                }
                .frame(maxWidth: .infinity, maxHeight: pfpHeight, alignment: .bottomLeading)
                .opacity(showText ? 1 : 0)
                .padding()
            }
        }
    }
    
}
                

struct Lcl_ArtistProfileCard_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        Lcl_ArtistProfileCard(showText: .constant(true),namespace: namespace, pfpHeight: 500, user: exampleUsers[0])
            .preferredColorScheme(.dark)
    }
}
