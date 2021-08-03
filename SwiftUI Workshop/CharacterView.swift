//
//  CharacterView.swift
//  SwiftUI Workshop
//
//  Created by BS-272 on 3/8/21.
//

import SwiftUI

struct CharacterView: View {
    
    let characterId: String
    @ObservedObject var viewModel = CharacterViewModel()
    
    var body: some View {
        VStack {
            if viewModel.state == .loading {
                Spinner(style: .large)
            } else if viewModel.state == .error {
                Text("Error")
            } else if viewModel.state == .complete {
                RemoteImage(url:viewModel.character.image)
                    .clipShape(Circle())
                    .frame(width:250, height:250)
                    .overlay(
                        Circle().stroke(Color.orange, lineWidth: 4)
                    )
                    .shadow(radius: 10)
                Divider()
                Text(viewModel.character.name)
                    .font(.title)
                Text(viewModel.character.status)
                    .font(.subheadline)
                Divider()
                Text("\(viewModel.character.species)")
            }
        }
        .padding()
        .navigationBarTitle(Text(viewModel.character.name), displayMode: .inline)
        .onAppear {
            viewModel.setup(id: characterId)
        }
    }
}

