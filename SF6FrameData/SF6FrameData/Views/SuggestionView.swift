//
//  SuggestionView.swift
//  SF6FrameData
//
//  Created by Rafael Plinio on 22/07/23.
//

import SwiftUI
import MessageUI

struct SuggestionView: View {
    @Binding var isPresented: Bool
    @State var isShowingMailView: Bool = false
    @State private var result: Result<MFMailComposeResult, Error>? = nil
    var backgroundColor: Color = .clear
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text(K.Strings.suggestionTitle)
                .font(.title)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            
            Text(K.Strings.suggestionInfo)
                .font(.title3)
            Spacer()
        }
        .frame(height: 350)
        .padding(20)
        .border(colorScheme == .light ? .black : .white, width: 1)
        .background(backgroundColor.opacity(colorScheme == .light ? 0.2 : 0.5))
        .cornerRadius(10)
        .padding()
        .navigationTitle("Suggestion Box")
        
        .sheet(isPresented: $isShowingMailView) {
            MailView(isShowing: self.$isShowingMailView, result: self.$result, newSubject: K.Strings.suggestionMailSubject, newMessageBody: K.Strings.suggestionMailBody)
        }
        
        Spacer()
        
        Button(action: {
            isPresented = false
        }) {
            Text("Dismiss")
                .font(.system(size: 20))
                .foregroundColor(.white)
                .padding(.horizontal, 100)
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .background()
    }
}

struct SuggestionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SuggestionView(isPresented: .constant(true))
        }
    }
}
