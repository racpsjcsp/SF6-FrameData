//
//  ExtraInfoView.swift
//  SF6FrameData
//
//  Created by Rafael Plinio on 07/07/23.
//

import SwiftUI

struct ExtraInfoView: View {
    @Binding var isPresented: Bool
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var viewModel = ExtraInfoViewModel()
    
    var body: some View {
        ScrollView(.vertical) {
            ExtraInfoItemView(itemList: viewModel.attackList, title: K.Strings.normalAttackTitle, backgroundColor: .yellow)
            ExtraInfoItemView(itemList: viewModel.motionAndDirectionList, title: K.Strings.motionAndDirectionTitle, backgroundColor: .blue)
            ExtraInfoItemView(itemList: viewModel.cancellableList, title: K.Strings.cancellableTitle, backgroundColor: .green)
            ExtraInfoItemView(itemList: viewModel.superCancelList, title: K.Strings.superCancelTitle, backgroundColor: .orange)
            ExtraInfoItemView(itemList: viewModel.detailList, title: K.Strings.detailsTitle, backgroundColor: .purple)
            ExtraInfoItemView(itemList: viewModel.knockdownsList, title: K.Strings.knockdownTitle, backgroundColor: .red)
        }
        .navigationTitle("Info Guide")
        .onAppear {
            viewModel.getExtraInfoData()
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
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ExtraInfoView(isPresented: .constant(true))
        }
    }
}
