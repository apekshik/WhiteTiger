//
//  VideoManager.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/22/22.
//

import Foundation
import Firebase
import FirebaseStorage
import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor
class VideoManager: ObservableObject {
    
    @Published var videos: [VideoModel] = []
    @Published var video: VideoModel = exampleVideos[1]
    
    let storage = Storage.storage()
    let db = Firestore.firestore()
    
    init() { }
    
    func storeRecentVideos() async {
        let uid = await getDocumentID(for: "Joji")
        let colRef = db.collection("users/\(uid)/videos")
        for video in exampleVideos {
            try! colRef.addDocument(from: video)
        }
    }
    
    func loadRecentVideos(ofArtist artistName: String) async {
        let fetched = await fetchRecentVideos(ofArtist: artistName)
        videos = fetched
    }
    
    func fetchRecentVideos(ofArtist artistName: String) async -> [VideoModel] {
        var tempVideo: VideoModel
        var tempVideos: [VideoModel] = []
        let uid = await getDocumentID(for: "Joji")
        let videosRef = db.collection("users/\(uid)/videos")
        
        // snapshot of the collection of all documents that are recents and hits videos for our artist.
        let snapshot = try! await videosRef.whereField("recentsAndHits", isEqualTo: true).getDocuments()
        
        for doc in snapshot.documents {
            tempVideo = try! doc.data(as: VideoModel.self)
            tempVideo.videoUrlPath = await fetchVideoUrl(at: tempVideo.storagePath!)
            tempVideos.append(tempVideo)
        }
        
        return tempVideos
    }
    
    func getDocumentID(for artistName: String) async -> String {
        let usersRef = db.collection("users")
        let userDocs = try! await usersRef.whereField("artistName", isEqualTo: artistName).getDocuments()
        
        if userDocs.count != 1 {
            print("snapshot.count was not 1!!!!")
        }
        
        return userDocs.documents[0].documentID
    }
    
    func loadVideo(at path: String) async {
        let fetched = await fetchVideoUrl(at: path)
        video.videoUrlPath = fetched
    }
    
    func fetchVideoUrl(at path: String) async -> URL {
        let sRef = storage.reference()
        let vRef = sRef.child(path)
        
        return try! await vRef.downloadURL()
    }
}
