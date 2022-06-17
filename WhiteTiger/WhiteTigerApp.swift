//
//  WhiteTigerApp.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/11/22.
//

import SwiftUI
import Firebase

@main
struct WhiteTigerApp: App {
    
    init() {
        
        FirebaseApp.configure()
        
    }
    
    var body: some Scene {
        WindowGroup {
            //ContentView()
            ArtistMainView()
        }
    }
}
