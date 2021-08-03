//
//  Repository.swift
//  SwiftUI Workshop
//
//  Created by Tadeh Alexani on 4/29/21.
//

import Foundation

class Repository {
  
  func getEpisodes(completion: @escaping ([Episode]?) -> ()) {
    Network.shared.apollo.fetch(query: GetEpisodesQuery(), cachePolicy: .fetchIgnoringCacheCompletely) { result in
      
      switch result {
        case .failure(let err):
          print(err.localizedDescription)
          completion(nil)
        case .success(let data):
          let model = data.data?.episodes?.decodeModel(type: EpisodesResponse.self)
          completion(model?.results)
      }
      
    }
  }
  
  func getEpisode(id: String, completion: @escaping (Episode?) -> ()) {
    
    Network.shared.apollo.fetch(query: GetEpisodeQuery(id: id), cachePolicy: .fetchIgnoringCacheCompletely) { result in
      
      switch result {
        case .failure(let err):
          print(err.localizedDescription)
          completion(nil)
        case .success(let data):
          let model = data.data?.episode?.decodeModel(type: Episode.self)
          completion(model)
      }
      
    }
  }
    
  func getCharacter(id: String, completion: @escaping (Character?) -> ()) {
    
    Network.shared.apollo.fetch(query: GetCharacterQuery(id: id), cachePolicy: .fetchIgnoringCacheCompletely) { result in
       switch result {
         case .failure(let err):
           print(err.localizedDescription)
           completion(nil)
         case .success(let data):
           let model = data.data?.character?.decodeModel(type: Character.self)
           completion(model)
       }
    }
  }
    
}
