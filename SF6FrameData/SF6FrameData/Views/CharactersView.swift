//
//  CharactersView.swift
//  SF6FrameData
//
//  Created by Rafael Plinio on 01/07/23.
//

import SwiftUI

struct CharactersView: View {
    @State private var characters = Character.data
    @State private var showTips = false
    @State private var showThanks = false
    @EnvironmentObject private var store: TipStore
    
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
                
                VStack {
                    Button(action: {
                        showTips.toggle()
                    }) {
                        Text("Tip Me")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .padding(.horizontal, 100)
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(8)
            }
            .navigationDestination(for: Character.self) { character in
                SelectTypeFrameDataView(characterName: character.name)
            }
            .overlay {
                if showTips {
                    Color.black.opacity(0.8)
                        .ignoresSafeArea()
                        .transition(.opacity)
                        .onTapGesture {
                            showTips.toggle()
                        }
                    
                    TipView {
                        showTips.toggle()
                    }
                    .environmentObject(store)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }
            .overlay(alignment: .bottom) {
                if showThanks {
                    ThanksView {
                        showThanks =  false
                    }
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }
            .animation(.spring(), value: showTips)
            .animation(.spring(), value: showThanks)
            .onChange(of: store.action) { action in
                if action == .successful {
                    showTips = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        showThanks = true
                        store.reset()
                    }
                }
            }
            .alert(isPresented: $store.hasError, error: store.error) {}
        }
    }

    var gridItems: [GridItem] {
        let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
        return columns
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()
            .environmentObject(TipStore())
    }
}
