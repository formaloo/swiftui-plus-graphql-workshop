//
//  ViewModel.swift
//  SwiftUI Workshop
//
//  Created by Tadeh Alexani on 4/29/21.
//

import SwiftUI

class EpisodesViewModel: ObservableObject {
  @Published var state: ViewStatus = .none
  @Published var episodes = [Episode]()
  
  let repo = Repository()
  
  init() {
    setup()
  }
  
  func setup() {
    
    state = .loading
    
    repo.getEpisodes { episodes in
      guard let episodes = episodes else {
        self.state = .error
        return
      }
      
      self.episodes = episodes
      self.state = .complete
      
    }
  }
  
}

class EpisodeViewModel: ObservableObject {
  @Published var state: ViewStatus = .none
  @Published var episode = Episode(id: "1", name: "", episode: "", air_date: "", characters: [])
  
  let repo = Repository()
  
  func setup(episodeId: String) {
    
    state = .loading
    
    repo.getEpisode(id: episodeId) { episode in
      guard let episode = episode else {
        self.state = .error
        return
      }
      
      self.episode = episode
      self.state = .complete
      
    }
  }
  
}

class CharacterViewModel: ObservableObject {
  @Published var state: ViewStatus = .none
  @Published var character = Character(id: "1", name: "", status: "", species: "", image: "")
    
  let repo = Repository()
    
  func setup(id: String) {
    repo.getCharacter(id: id) { character in
      guard let character = character else {
        self.state = .error
        return
      }
            
      self.character = character
      self.state = .complete
        
        
    }
  }

}
