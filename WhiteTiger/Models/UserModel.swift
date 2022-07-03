//
//  UserModel.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/16/22.
//

import Foundation

struct UserModel: Codable, Identifiable {
    var id = UUID()
    var isArtist: Bool
    var first: String
    var last: String
    var artistName: String?
    var occupation: String
    var profileUrl: String?
    var localProfileUrl: String?
    var followers: Int
    
    static func fetchUserProfile(for artistName: String) -> UserModel? {
        for user in exampleUsers {
            if user.artistName == artistName {
                return user
            }
        }
        return nil
    }
}


let exampleUsers: [UserModel] = [
    UserModel(isArtist: true,
              first: "Ethan",
              last: "Becker",
              artistName: "Ethan Becker",
              occupation: "Animation Artist",
              localProfileUrl: "Ethan Becker P2",
              followers: 897234900),
    UserModel(isArtist: true,
              first: "Poki",
              last: "Han",
              artistName: "Poki.Han",
              occupation: "Digital Artist",
              localProfileUrl: "Poki.Han P1",
              followers: 897234900),
    UserModel(isArtist: true,
              first: "Taika",
              last: "Waititi",
              artistName: "Taika Waititi",
              occupation: "Director, Screenwriter, Producer",
              localProfileUrl: "Taika Waititi P2",
              followers: 897234900),
    UserModel(isArtist: true,
              first: "Michael",
              last: "Bliss",
              artistName: "Michael Bliss",
              occupation: "Videographer",
              localProfileUrl: "Michael Bliss P1",
              followers: 897234900),
    UserModel(isArtist: true,
              first: "Corridor",
              last: "Digital",
              artistName: "Corridor Digital",
              occupation: "VFX Studio",
              localProfileUrl: "Corridor Digital P2",
              followers: 897234900),
    UserModel(isArtist: true,
              first: "George",
              last: "Miller",
              artistName: "Joji",
              occupation: "Singer, Writer, Producer, example",
              localProfileUrl: "jojiP1",
              followers: 17600000
             )

]
