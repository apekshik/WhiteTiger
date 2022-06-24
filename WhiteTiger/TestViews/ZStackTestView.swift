//
//  ZStackTestView.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/24/22.
//

import SwiftUI
import AVKit

struct ZStackTestView: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .scaledToFill()
        }
        .frame(width: 200, height: 300)
        .background(.red)
    }
}



struct ZStackTestView_Previews: PreviewProvider {
    static var previews: some View {
        ZStackTestView()
            .preferredColorScheme(.dark)
    }
}
