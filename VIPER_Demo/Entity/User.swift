//
//  User.swift
//  VIPER_Demo
//
//  Created by Ahmed Amin on 22/08/2022.
//

import Foundation

/*
 Model :-
 - Object Model
 */


enum FetchError: Error {
    case failed
}

struct User: Codable {
    let name: String
}
