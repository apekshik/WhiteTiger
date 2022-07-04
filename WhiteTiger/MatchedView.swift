//
//  MatchedView.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 7/4/22.
//

import SwiftUI

struct MatchedView: View {
    @Binding var showInfo: Bool
    @State var zoom: Bool = true
    let user: UserModel
    var body: some View {
        if zoom {
            profileCard
                .mask(RoundedRectangle(cornerRadius: 20))
                .frame(minHeight: 500)
        } else {
            VStack(alignment: .leading) {
                Spacer()
                if showInfo {
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
    
    var profileCard: some View {
        VStack(alignment: .leading) {
            Spacer()
            if showInfo {
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

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView(showInfo: .constant(true), user: exampleUsers[0])
            .preferredColorScheme(.dark)
    }
}
