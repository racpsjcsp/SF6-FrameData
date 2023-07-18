//
//  CharactersView.swift
//  SF6FrameData
//
//  Created by Rafael Plinio on 01/07/23.
//

import SwiftUI

struct CharactersView: View {
    @State private var characters = Character.data
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 20) {
                    ForEach(characters, id: \.self) { character in
                        NavigationLink(value: character) {
                            Label(title: { Text("")},
                                  icon: { Image(character.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 110, height: 110)
                                    .imageScale(.large)
                                    .cornerRadius(10)
                                    .padding(.leading, 10)
                            })
                        }
                        .navigationTitle("Characters")
                    }
                }
                .padding()
            }
            .navigationDestination(for: Character.self) { character in
                SelectTypeFrameDataView(characterName: character.name)
            }
        }
    }

    // Define the grid items
    var gridItems: [GridItem] {
        let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
        return columns
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()
    }
}
