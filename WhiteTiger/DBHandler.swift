//
//  DBHandler.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/16/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

// Database Handler class
class DBHandler: ObservableObject {
    let db = Firestore.firestore()
    // var user: UserModel = UserModel(isArtist: false, first: "", last: "", artistName: "something", occupation: "", profileUrl: "", followers: 0)
    func addNewUser(user: UserModel) {
        do {
            let d = try db.collection("users").addDocument(from: user)
            print("successfully added document with ID: \(d.documentID) to the collection.")
        } catch _ {
            // Handle error later
        }
    }
    
    func getArtistProfileCardData(artistName: String, completionHandler: @escaping (UserModel) -> ()){
        
        let usersRef = db.collection("users")
        usersRef.whereField("artistName", isEqualTo: artistName)
            .getDocuments { (querySnapshot, err) in
                if let err = err {
                            print("Error getting documents: \(err)")
                        } else {
                            for document in querySnapshot!.documents {
                                print("\(document.documentID) => \(document.data())")
                                do {
                                    let userData = try document.data(as: UserModel.self)
                                    completionHandler(userData)
                                    // printing retData.artistName gives me correct output.
                                } catch _ {
                                    print("Error getting document from querySnapshot.")
                                }
                            }
                        }
            }
        }
}
