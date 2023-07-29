//
//  TipView.swift
//  SF6FrameData
//
//  Created by Rafael Plinio on 26/07/23.
//

import SwiftUI

struct TipView: View {
    @EnvironmentObject private var store: TipStore
    
    var didTapClose: () -> ()
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(spacing: 1) {
            HStack {
                Spacer()
                Button(action: didTapClose) {
                    Image(systemName: "xmark")
                        .symbolVariant(.circle.fill)
                        .font(.system(.largeTitle, design: .rounded).bold())
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.gray, .gray.opacity(0.2))
                }
                .padding([.top, .trailing], -10)
            }
            
            Text("Enjoying the app? ↓↘︎→ 🤓")
                .font(.system(.title2, design: .rounded).bold())
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
            
            Text("SF6 FrameData is a free App but if you like it and are feeling generous, buy me a snack by tipping. It will surely help me to keep the app up to date.")
                .font(.system(.body, design: .rounded))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .padding(.bottom, 16)
            
            ForEach(store.items, id: \.self) { item in
                TipItemView(item: item)
                    .padding(4)
            }
        }
        .padding(16)
        .background(Color(uiColor: .veryLightGray), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
        .padding(8)
        .overlay(alignment: .top) {
            Image("appIcon")
                .resizable()
                .frame(width: 50, height: 50)
                .padding(1)
                .border(.red)
                .offset(y: -20)
        }
    }
}

struct TipView_Previews: PreviewProvider {
    static var previews: some View {
        TipView {}
            .environmentObject(TipStore())
    }
}
