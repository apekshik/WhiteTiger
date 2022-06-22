//
//  VideoModel.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/21/22.
//

import Foundation
import Firebase
import FirebaseStorage

struct VideoModel: Codable, Identifiable {
    var id = UUID()
    var recentsAndHits: Bool?
    var title: String
    var title2: String
    var viewCount: Int
    var storagePath: String?
    var videoUrlPath: URL?
}

let exampleVideos = [
    VideoModel(recentsAndHits: true,
               title: "Glimpse of Us",
               title2: "Album relase - Single",
               viewCount: 13730301,
               storagePath: "videos/Joji - Glimpse of Us (Official Video).mp4",
               videoUrlPath: nil
              ),
    VideoModel(recentsAndHits: true,
               title: "Slow Dancing in the Dark",
               title2: "Album – Ballads 1",
               viewCount: 373932000,
               storagePath: "videos/Joji - Slow Dancing in the Dark (Official Video).mp4",
               videoUrlPath: nil
              ),
    VideoModel(recentsAndHits: true,
               title: "Can't Get Over You",
               title2: "Album – Ballads 1 (ft. Clams Casino)",
               viewCount: 373932000,
               storagePath: "videos/Joji - Can't Get Over You (Official Video).mp4",
               videoUrlPath: nil
              ),
    VideoModel(recentsAndHits: false,
               title: "Head in the Clouds - 2019",
               title2: "Performing Slow Dancing in the Dark",
               viewCount: 123700000,
               storagePath: "videos/Joji - Slow Dancing in the Dark (Live).mp4",
               videoUrlPath: nil
              )
]
