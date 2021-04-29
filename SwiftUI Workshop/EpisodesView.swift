//
//  EpisodesView.swift
//  SwiftUI Workshop
//
//  Created by Tadeh Alexani on 4/29/21.
//

import SwiftUI

struct EpisodesView: View {
  
  @ObservedObject var viewModel = EpisodesViewModel()
  
  var body: some View {
    if viewModel.state == .loading {
      Spinner(style: .large)
    } else if viewModel.state == .error {
      Text("Error.")
    } else if viewModel.state == .complete {
      NavigationView {
        List {
          ForEach(viewModel.episodes, id: \.id) { episode in
            NavigationLink(
              destination: EpisodeView(episodeId: episode.id),
              label: {
                HStack {
                  Text(episode.name)
                  Spacer()
                  Text(episode.episode)
                    .foregroundColor(.secondary)
                }
                .padding()
              })
          }
        }
        .navigationBarTitle(Text("R&M Episodes"))
      }
    }
  }
}
