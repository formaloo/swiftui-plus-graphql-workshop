//
//  EpisodeView.swift
//  SwiftUI Workshop
//
//  Created by Tadeh Alexani on 4/29/21.
//

import SwiftUI

struct EpisodeView: View {
  
  let episodeId: String
  @ObservedObject var viewModel = EpisodeViewModel()
  
  var body: some View {
    VStack {
      if viewModel.state == .loading {
        Spinner(style: .large)
      } else if viewModel.state == .error {
        Text("Error.")
      } else if viewModel.state == .complete {
        Form {
          Section(header: Text("Details")) {
            HStack(spacing: 8) {
              Text("Air date:")
              Text(viewModel.episode.air_date ?? "Dec 1, 2012")
            }
          }
          Section(header: Text("Characters")) {
            ScrollView(.horizontal) {
              HStack {
                ForEach(viewModel.episode.characters ?? [], id: \.id) { character in
                  VStack {
                    RemoteImage(url: character.image)
                      .scaledToFit()
                      .clipShape(Circle())
                      .frame(width: 120, height: 120)
                      .padding()
                    Text(character.name)
                  }
                }
              }
            }
          }
        }
      }
    }
    .navigationBarTitle(Text(viewModel.episode.name), displayMode: .inline)
    .onAppear {
      viewModel.setup(episodeId: episodeId)
    }
  }
}
