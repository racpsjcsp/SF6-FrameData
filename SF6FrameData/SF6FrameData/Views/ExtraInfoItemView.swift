//
//  ExtraInfoItemView.swift
//  SF6FrameData
//
//  Created by Rafael Plinio on 18/07/23.
//

import SwiftUI

struct ExtraInfoItemView: View {
    var itemList: [String]
    var title: String
    var backgroundColor: Color
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title2)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            
            ForEach(itemList, id: \.self) { info in
                Text(info)
            }
        }
        .padding(20)
        .border(colorScheme == .light ? .black : .white, width: 1)
        .background(backgroundColor.opacity(colorScheme == .light ? 0.2 : 0.5))
        .cornerRadius(10)
        .padding()
    }
}

struct ExtraInfoItemView_Previews: PreviewProvider {
    static var previews: some View {
        ExtraInfoItemView(itemList: ["Item", "List"], title: "Title", backgroundColor: .clear)
    }
}
