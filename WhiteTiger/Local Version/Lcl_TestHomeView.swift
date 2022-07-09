//
//  Lcl_TestHomeView.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 7/8/22.
//

import SwiftUI

struct Lcl_TestHomeView: View {
    @State var selectedProfile: UserModel? = nil
    var body: some View {
        VStack {
            if selectedProfile == nil {
//                Lcl_HomeVideoPreviewCard(videos: exampleRecentVideos2, cardTitle: "Recent Uploads", selectedProfile: $selectedProfile)
            } else {
//                Lcl_ArtistMainView(selectedUser: $selectedProfile)
            }
            
        }
    }
}

struct Lcl_TestHomeView_Previews: PreviewProvider {
    static var previews: some View {
        Lcl_TestHomeView()
    }
}
