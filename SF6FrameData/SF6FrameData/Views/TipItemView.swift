//
//  TipItemView.swift
//  SF6FrameData
//
//  Created by Rafael Plinio on 26/07/23.
//

import SwiftUI
import StoreKit

struct TipItemView: View {
    @EnvironmentObject private var store: TipStore
    
    let item: Product?
    
    var body: some View {
        HStack {
            VStack(alignment: .leading,
                   spacing: 3) {
                Text(item?.displayName ?? "-")
                    .font(.system(.title3, design: .rounded).bold())
                Text(item?.description ?? "-")
                    .font(.system(.callout, design: .rounded).weight(.regular))
            }
            
            Spacer()
            
            Button(item?.displayPrice ?? "-") {
                if let item = item {
                    Task {
                        await store.purchase(item: item)
                    }
                }
            }
            .tint(.blue)
            .buttonStyle(.bordered)
            .font(.callout.bold())
        }
        .padding(16)
        .background(Color(UIColor.systemBackground), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

struct TipItemView_Previews: PreviewProvider {
    static var previews: some View {
        TipItemView(item: nil)
            .environmentObject(TipStore())
    }
}
