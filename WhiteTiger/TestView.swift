//
//  TestView.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/11/22.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        
        VStack {
            Spacer()
            
            Image("jojiP1")
            
            Text("Outside Geo")
                .frame(width: .infinity, height: 50)
                .background(.blue)
        }
        .background(.gray)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
