//
//  MatchedView.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 7/4/22.
//

import SwiftUI

struct MatchedView: View {
    @Binding var showInfo: Bool
    @State var zoom: Bool = false
    @Namespace var namespace
    @State var user: UserModel = exampleUsers[1]
        
    var body: some View {
        if !zoom {
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
                .resizable().aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: "pro", in: namespace)
                    .clipped()
                    .opacity(0.9)
            )
            .cornerRadius(30)
            .matchedGeometryEffect(id: "frame", in: namespace)
            .frame(height: 500)
            .onTapGesture {
                withAnimation(.spring()) {
                    zoom.toggle()
                }
            }
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
                    .resizable().aspectRatio(contentMode: .fill)
                    .clipped()
                    .opacity(0.9)
            )
            .cornerRadius(30)
            .matchedGeometryEffect(id: "frame", in: namespace)
            .frame(height: 800)
            .onTapGesture {
                withAnimation(.spring()) {
                    zoom.toggle()
                }
            }
        }
    }
    
}

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView(showInfo: .constant(true), user: exampleUsers[0])
            .preferredColorScheme(.dark)
    }
}
