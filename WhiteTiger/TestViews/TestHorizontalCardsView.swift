//
//  TestHorizontalCardsView.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/24/22.
//

import SwiftUI

struct TestHorizontalCardsView: View {
    let videos = exampleVideos
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(videos) { video in
                    TestCard(video: video)
                }
            }
        }
    }
}

struct TestHorizontalCardsView_Previews: PreviewProvider {
    static var previews: some View {
        TestHorizontalCardsView()
    }
}
