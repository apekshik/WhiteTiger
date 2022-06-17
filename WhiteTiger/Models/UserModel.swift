//
//  UserModel.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/16/22.
//

import Foundation

struct UserModel: Codable {
    var isArtist: Bool
    var first: String
    var last: String
    var artistName: String?
    var occupation: String
    var profileUrl: String?
    var followers: Int
    
}

var users = [
    UserModel(isArtist: true,
              first: "George",
              last: "Miller",
              artistName: "Joji",
              occupation: "Singer, Writer, Producer",
              profileUrl: "jojiP1",
              followers: 17600000
             )
]
