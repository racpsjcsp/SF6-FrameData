//
//  FrameDataSheetView.swift
//  SF6FrameData
//
//  Created by Rafael Plinio on 17/07/23.
//

import SwiftUI

struct FrameDataSheetView: View {
    let dataList: [String]
    let columnTitle: String
    let backgroundColor: Color
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            ColumnTitleView(columnTitle: columnTitle)
            
            ForEach(dataList, id: \.self) { data in
                Text(data)
                    .padding([.top, .bottom], -10)
                    .frame(height: 50)
                    .frame(minWidth: 80, maxWidth: 105)
                    .lineLimit(nil)
                    .font(.system(size: 14))
                Divider()
                    .overlay(colorScheme == .light ? .black : .white)
            }
        }
        .frame(minWidth: 80, maxWidth: 105)
        .background(backgroundColor.opacity(colorScheme == .light ? 0.2 : 0.5))
    }
}

struct FrameDataSheetView_Previews: PreviewProvider {
    static var previews: some View {
        FrameDataSheetView(dataList: ["frame, data, list"], columnTitle: "columnTitle", backgroundColor: .clear)
    }
}
