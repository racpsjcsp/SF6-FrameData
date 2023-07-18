//
//  NotesView.swift
//  SF6FrameData
//
//  Created by Rafael Plinio on 17/07/23.
//

import SwiftUI

struct NotesView: View {
    var notesList: [String]
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            ForEach(notesList, id: \.self) { note in
                Text(note)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
        }
        .padding()
        .border(colorScheme == .light ? .black : .white, width: 1)
        .cornerRadius(20)
        .padding()
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView(notesList: ["notes", "list"])
    }
}
