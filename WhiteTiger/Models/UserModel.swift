//
//  UserModel.swift
//  WhiteTiger
//
//  Created by Apekshik Panigrahi on 6/16/22.
//

import Foundation

class UserModel: Codable {
    let isArtist: Bool
    let first: String
    let last: String
    let artistName: String?
    let occupation: String
    let profileUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case isArtist
        case first
        case last
        case artistName
        case occupation
        case profileUrl 
    }
}
