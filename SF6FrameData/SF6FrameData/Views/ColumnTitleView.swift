//
//  ColumnTitleView.swift
//  SF6FrameData
//
//  Created by Rafael Plinio on 05/07/23.
//

import SwiftUI

struct ColumnTitleView: View {
    var columnTitle: String
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Text(columnTitle)
            .frame(minWidth: 50, maxWidth: 100)
            .font(.system(size: 14))
            .bold()
            .padding()
        
        Divider()
            .overlay(colorScheme == .light ? .black : .white)
    }
}

struct ColumnFrameDataView_Previews: PreviewProvider {
    static var previews: some View {
        ColumnTitleView(columnTitle: "Column")
    }
}
