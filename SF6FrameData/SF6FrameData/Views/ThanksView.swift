//
//  ThanksView.swift
//  SF6FrameData
//
//  Created by Rafael Plinio on 29/07/23.
//

import SwiftUI

struct ThanksView: View {
    var didTapClose: () -> ()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Thank You 💕")
                .font(.system(.title2, design: .rounded).bold())
                .multilineTextAlignment(.center)
                .foregroundColor(colorScheme == .light ? .black : .white)
            
            Text("Your tip is very much appreciated. Will do my best to keep this app neat!")
                .font(.system(.body, design: .rounded))
                .multilineTextAlignment(.center)
                .foregroundColor(colorScheme == .light ? .black : .white)
                .padding(.bottom, 16)
            
            Button(action: didTapClose) {
                Text("Close")
                    .font(.system(.title3, design: .rounded).bold())
                    .tint(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
            }
        }
        .padding(16)
        .background(Color(uiColor: colorScheme == .light ? .veryLightGray : .darkGray),
                    in: RoundedRectangle(cornerRadius: 10, style: .continuous))
        .padding(.horizontal, 8)
    }
}

struct ThanksView_Previews: PreviewProvider {
    static var previews: some View {
        ThanksView {}
    }
}
