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
class DBHandler : ObservableObject {

    @Published var userData: UserModel?
    // better: @Published var userData = UserModel.example
    let db = Firestore.firestore()

    init() {
       getArtistProfileCardData(artistName: "Joji")
    }

    func getArtistProfileCardData(artistName: String){
        
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
