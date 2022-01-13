//
//  catchJSONData.swift
//  fetchingFriends
//
//  Created by Максим Нуждин on 11.01.2022.
//

import Foundation

struct FinalFriendList: Codable {
    
    let friends: [FriendList]
}

struct FriendList: Codable, Identifiable {
    
    let name: String
    let age: Int
    let company: String
    let id: String
    let isActive: Bool
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
}

struct Friend: Codable, Identifiable {
    
    let id: String
    let name: String
}
