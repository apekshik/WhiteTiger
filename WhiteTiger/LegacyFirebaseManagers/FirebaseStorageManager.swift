//
//  FirebaseStorageManager.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/18/22.
//

import Foundation
import FirebaseStorage

class FirebaseStorageManager: ObservableObject {
    @Published var imageUrl: URL?
    var storageRef = Storage.storage().reference()
    let dbhandler = FirestoreManager()
    
    init() {
        imageUrl = URL(string: "gs://fir-whitetiger.appspot.com/images/JojiPortrait1.jpeg")
        // can't have getImage() run here because of probable async initializations of my classes. 
        //getImage(withPath: dbhandler.userData!.profileUrl!)
    }
    
    func getImage(withPath imagePath: String) {
        let imageRef = storageRef.child(imagePath)
        
        imageRef.downloadURL { url, err in
            if let err = err {
                print("error fetching download url for image: \(err.localizedDescription)")
            } else {
                self.imageUrl = url
                print("imageUrl: \(self.imageUrl!.absoluteString)")
            }
        }
        
    }
}
