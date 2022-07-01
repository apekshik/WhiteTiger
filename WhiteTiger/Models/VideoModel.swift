//
//  VideoModel.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/21/22.
//

import Foundation
import Firebase
import FirebaseStorage

struct VideoModel: Codable, Identifiable, Equatable {
    var id = UUID()
    var recentsAndHits: Bool?
    var title: String
    var title2: String
    var viewCount: Int
    var storagePath: String?
    var videoUrlPath: URL?
    var localVideoPath: String?
    var ownerName: String?
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

let exampleRecentVideos2: [VideoModel] = [
VideoModel(recentsAndHits: true,
           title: "California Travel Vlog",
           title2: "iPhone 12 Pro Video Shoot",
           viewCount: 1743932000,
           storagePath: "videos/Joji - Slow Dancing in the Dark (Official Video).mp4",
           videoUrlPath: nil,
           localVideoPath: "Michael Bliss - iPhone 12 Pro Video Test - California Travel Vlog (Clipped)",
           ownerName: "Michael Bliss"
          ),
VideoModel(recentsAndHits: true,
           title: "Procreate Speedpaint",
           title2: "Digital Artist - iPad Pro",
           viewCount: 373932000,
           storagePath: "videos/Joji - Slow Dancing in the Dark (Official Video).mp4",
           videoUrlPath: nil,
           localVideoPath: "Poki.Han - PROCREATE SPEEDPAINT ❥ POKI.HAN (1)",
           ownerName: "Poki.Han"
          ),
VideoModel(recentsAndHits: true,
           title: "VFX Artists React to CGI",
           title2: "Episode – RRR Special (Tollywood)",
           viewCount: 13730301,
           storagePath: "videos/Joji - Glimpse of Us (Official Video).mp4",
           videoUrlPath: nil,
           localVideoPath: "VFX Artists React to TOLLYWOOD Bad and Great CGi (clipped)",
           ownerName: "Corridor Digital"
          ),
VideoModel(recentsAndHits: true,
           title: "Slow Dancing in the Dark",
           title2: "Album – Ballads 1",
           viewCount: 373932000,
           storagePath: "videos/Joji - Slow Dancing in the Dark (Official Video).mp4",
           videoUrlPath: nil,
           localVideoPath: "Joji - Slow Dancing in the Dark (Official Video)",
           ownerName: "Joji"
          ),
VideoModel(recentsAndHits: true,
           title: "Never Draw Beans!",
           title2: "Advice for your stupid brain",
           viewCount: 13730301,
           storagePath: "videos/Joji - Glimpse of Us (Official Video).mp4",
           videoUrlPath: nil,
           localVideoPath: "Ethan Becker - Draw Gesture (clipped)",
           ownerName: "Ethan Becker"
          ),
VideoModel(recentsAndHits: true,
           title: "Thor: Love and Thunder",
           title2: "Behind The Scenes",
           viewCount: 373932000,
           storagePath: "videos/Joji - Slow Dancing in the Dark (Official Video).mp4",
           videoUrlPath: nil,
           localVideoPath: "Thor Love and Thunder - Behind The Scenes (1)",
           ownerName: "Taika Waititi"
          ),
]

let exampleUpcomingSoonVideos = [
    VideoModel(recentsAndHits: true,
               title: "Head in the Clouds 2022",
               title2: "Joji - Slow Dancing in the Dark",
               viewCount: 24330301,
               storagePath: "videos/Joji - Glimpse of Us (Official Video).mp4",
               videoUrlPath: nil,
               localVideoPath: "Joji - Slow Dancing in the Dark (Live)",
               ownerName: "Joji"
              ),
    VideoModel(recentsAndHits: true,
               title: "Attack on Titan Suite",
               title2: "Hiroyuki Sawano – Live Project",
               viewCount: 373932000,
               storagePath: "videos/Joji - Slow Dancing in the Dark (Official Video).mp4",
               videoUrlPath: nil,
               localVideoPath: "Hiroyuki Sawano - Project【emU】 “Attack on Titan” suite (clipped)",
               ownerName: "Hiroyuki Sawano"
              ),
    VideoModel(recentsAndHits: true,
               title: "Thor: Love and Thunder",
               title2: "Official Teaser - July 8th",
               viewCount: 24330301,
               storagePath: "videos/Joji - Glimpse of Us (Official Video).mp4",
               videoUrlPath: nil,
               localVideoPath: "Thor Love and Thunder (Official Teaser 1)",
               ownerName: "Taika Waititi"
              ),
    VideoModel(recentsAndHits: true,
               title: "Blinding Lights - Live",
               title2: "Coachella 2022",
               viewCount: 373932000,
               storagePath: "videos/Joji - Slow Dancing in the Dark (Official Video).mp4",
               videoUrlPath: nil,
               localVideoPath: "The Weeknd - Blinding Lights  (Live at Coachella 2022)",
               ownerName: "The Weeknd"
              )
]
