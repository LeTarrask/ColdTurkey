//
//  PassStore.swift
//  ColdTurkey
//
//  Created by tarrask on 05/01/2022.
//

import Foundation

struct PassStore: Identifiable, Codable {
    let id: UUID
    let login: String
    let password: String
    let releaseDate: Date
}
