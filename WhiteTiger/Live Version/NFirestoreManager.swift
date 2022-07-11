//
//  NFirestoreManager.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/21/22.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage

@MainActor
class NFirestoreManager: ObservableObject {
    @Published var userData: UserModel?
    @Published var profileImageUrl: URL?
    let db = Firestore.firestore()
    let storage = Storage.storage()
    
    init() {
        // init() method currently unchanged.
    }
    
    func loadUserData() async {
        let fetched = await fetchUserData(artistName: "Joji")
        userData = fetched
    }
    
    func loadProfileImageUrl() async {
        let fetched = await fetchProfileImageUrl()
        profileImageUrl = fetched
    }

    func fetchUserData(artistName: String) async -> UserModel {
        let userRef = db.collection("users")
        let snapshot = try! await userRef.whereField("artistName", isEqualTo: artistName).getDocuments()
        
        if snapshot.count != 1 {
            print("snapshot.count was not 1!!!!")
        }
        
        return try! snapshot.documents[0].data(as: UserModel.self)
    }
    
    func fetchProfileImageUrl() async -> URL {
        let sRef = storage.reference() // get the storage reference
        let imageRef = sRef.child(userData!.profileUrl!) // get the reference for the image with the given path name.
        
        return try! await imageRef.downloadURL() // return a download url. 
    }
            
    
}
