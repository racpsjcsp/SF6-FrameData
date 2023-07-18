//
//  NormalMovesFrameDataView.swift
//  SF6FrameData
//
//  Created by Rafael Plinio on 01/07/23.
//

import SwiftUI
import MessageUI

struct NormalMovesFrameDataView: View {
    @State var characterName: String
    @State var frameDataTypeTitle: String
    @State private var result: Result<MFMailComposeResult, Error>? = nil
    @State private var isShowingMailView = false
    @State private var isShowingInfo = false
    @State private var isShowingMailAlert = false
    @StateObject var viewModel = CharacterFrameDataViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            HStack {
                Text(frameDataTypeTitle)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)

                if MFMailComposeViewController.canSendMail() {
                    BugReportButtonView(canShowMailView: true)
                        .onActiveBugReportTap {
                            isShowingMailView.toggle()
                        }
                } else {
                    BugReportButtonView(canShowMailView: false)
                        .onInactiveBugReportTap {
                            isShowingMailAlert.toggle()
                        }
                }
            }
            .sheet(isPresented: $isShowingInfo) {
                ExtraInfoView(isPresented: $isShowingInfo)
            }
            .sheet(isPresented: $isShowingMailView) {
                MailView(isShowing: self.$isShowingMailView, result: self.$result, newSubject: K.Strings.bugMailSubject, newMessageBody: K.Strings.bugMessageBody)
            }
            .alert(isPresented: $isShowingMailAlert) {
                Alert(title: Text(K.Strings.bugAlertMessageTitle), message: Text(K.Strings.bugAlertMessage))
            }
            
            HStack {
                FrameDataSheetView(dataList: viewModel.normalMoveList, columnTitle: K.Strings.moveTitle, backgroundColor: .clear)
                    .background(.clear)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        FrameDataSheetView(dataList: viewModel.normalStartupList, columnTitle: K.Strings.startupTitle, backgroundColor: .yellow)
                            .padding(.leading, 8)
                        
                        FrameDataSheetView(dataList: viewModel.normalActiveList, columnTitle: K.Strings.activeTitle, backgroundColor: .blue)
                            .padding(.leading, -8)
                        
                        FrameDataSheetView(dataList: viewModel.normalRecoveryList, columnTitle: K.Strings.recoveryTitle, backgroundColor: .green)
                            .padding(.leading, -8)

                        FrameDataSheetView(dataList: viewModel.normalOnHitList, columnTitle: K.Strings.onHitTitle, backgroundColor: .orange)
                            .padding(.leading, -8)

                        FrameDataSheetView(dataList: viewModel.normalOnBlockList, columnTitle: K.Strings.onBlockTitle, backgroundColor: .purple)
                            .padding(.leading, -8)

                        FrameDataSheetView(dataList: viewModel.normalCancelList, columnTitle: K.Strings.cancelTitle, backgroundColor: .gray)
                            .padding(.leading, -8)
                        
                        FrameDataSheetView(dataList: viewModel.normalDamageList, columnTitle: K.Strings.damageTitle, backgroundColor: .red)
                            .padding(.leading, -8)
                        
                    }
                    .onAppear {
                        viewModel.getNormalMovesCharacterData(characterName: characterName)
                    }
                }
                .padding(.leading, -10)
            }
            
            if !viewModel.normalNotes.isEmpty {
                NotesView(notesList: viewModel.normalNotes)
            }
        }
        .navigationTitle(characterName)
        .toolbar {
            Button(action: {
                isShowingInfo.toggle()
            }) {
                Image(systemName: "info.circle")
            }
        }
    }
}


struct CharacterFrameDataView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NormalMovesFrameDataView(characterName: "Player Test", frameDataTypeTitle: "Normal Test")
        }
    }
}
