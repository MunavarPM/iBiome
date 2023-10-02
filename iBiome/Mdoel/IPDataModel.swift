//
//  IP.swift
//  iBiome
//
//  Created by MUNAVAR PM on 30/09/23.
//

import Foundation

let IP = "3.6.41.83"

struct register: Decodable {
    let passWord: Int
    let gmail: String
}

struct resetPassword: Decodable {
    let gmail : String
}



