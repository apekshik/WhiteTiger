//
//  test_userImageView.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 7/9/22.
//

import SwiftUI

struct test_userImageView: View {
    @Binding var showText: Bool
    var namespace: Namespace.ID
    var user: UserModel
    @Binding var selectedUser: UserModel?
    
    var body: some View {
        VStack {
            Image(user.localProfileUrl!)
                    .resizable().aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: user.id, in: namespace)
                    .mask(RoundedRectangle(cornerRadius: 10)
                        .matchedGeometryEffect(id: user.id, in: namespace))

        }
        .overlay {
            GeometryReader { geo in
                VStack(alignment: .leading) {
                    Text(user.artistName!.uppercased())
                        .font(.title)
                        .bold()
                        .matchedGeometryEffect(id: "artistName", in: namespace)
                    Text(user.occupation)
                        .matchedGeometryEffect(id: "occupation", in: namespace)
                    Text("\(user.followers) Followers")
                        .matchedGeometryEffect(id: "followerCount", in: namespace)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                .opacity(showText ? 1 : 0)
                .padding()
            }
        }
        .onTapGesture {
            selectedUser = user 
            withAnimation(.spring()) {
                showText.toggle() 
            }
        }
    }
}

struct test_userImageView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        test_userImageView(showText: .constant(true), namespace: namespace, user: exampleUsers[0], selectedUser: .constant(nil))
    }
}
