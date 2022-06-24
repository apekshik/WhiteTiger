
//
//  DBHandler.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/16/22.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage

// Database Handler class
class FirestoreManager: ObservableObject {

    @Published var userData: UserModel?
    // better: @Published var userData = UserModel.example
    let db = Firestore.firestore()
    let storage = Storage.storage()
    
    init() {
       getArtistProfileCardData(artistName: "Joji")
    }

    func getArtistProfileCardData(artistName: String) {
        
        let usersRef = db.collection("users")
        usersRef.whereField("artistName", isEqualTo: artistName)
            .getDocuments { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err.localizedDescription)")
                        } else {
                            for document in querySnapshot!.documents {
                                print("\(document.documentID) => \(document.data())")
                                do {
                                    let userData = try document.data(as: UserModel.self)
                                    DispatchQueue.main.async {
                                        self.userData = userData
                                    }
                                    
                                } catch {
                                    print("Error getting document from querySnapshot.", error)
                                }
                            }
                        }
            }
        }

}
