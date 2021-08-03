//
//  Model.swift
//  SwiftUI Workshop
//
//  Created by Tadeh Alexani on 4/29/21.
//

import Foundation

struct Episode: Decodable {
  let id: String
  let name: String
  let episode: String
  let air_date: String?
  let characters: [EpisodeCharacter]?
}

struct EpisodesResponse: Decodable {
  let results: [Episode]
}

struct EpisodeCharacter: Decodable {
  let id: String
  let name: String
  let image: String
}

struct Character: Decodable {
    var id: String
    var name: String
    var status: String
    var species: String
    var image: String
}
