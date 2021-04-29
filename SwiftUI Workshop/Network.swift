//
//  Network.swift
//  SwiftUI Workshop
//
//  Created by Tadeh Alexani on 4/29/21.
//

import Apollo

struct Network {
  static var shared = Network()
  
  private(set) lazy var apollo: ApolloClient = {
    let url = URL(string: "https://rickandmortyapi.com/graphql")!
    return ApolloClient(url: url)
  }()
}
