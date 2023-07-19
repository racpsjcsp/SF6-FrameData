//
//  BugReportButtonView.swift
//  SF6FrameData
//
//  Created by Rafael Plinio on 18/07/23.
//

import SwiftUI

struct BugReportButtonView: View {
    @State var canShowMailView: Bool
    var onActiveBugReportTap: (() -> Void)?
    var onInactiveBugReportTap: (() -> Void)?
    
    var body: some View {
        Button(action: {
            canShowMailView ? onActiveBugReportTap?() : onInactiveBugReportTap?()
        }, label: {
            Image(systemName: canShowMailView ? "ladybug.fill" : "ladybug")
                .foregroundColor(canShowMailView ? .blue : .gray)
        })
        .padding()
    }
}

struct BugReportButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BugReportButtonView(canShowMailView: true)
    }
}

// custom actions for button
extension BugReportButtonView {
    func onActiveBugReportTap(action: @escaping (() -> Void)) -> BugReportButtonView {
        BugReportButtonView(canShowMailView: true, onActiveBugReportTap: action)
    }

    func onInactiveBugReportTap(action: @escaping (() -> Void)) -> BugReportButtonView {
        BugReportButtonView(canShowMailView: false, onInactiveBugReportTap: action)
    }
}
