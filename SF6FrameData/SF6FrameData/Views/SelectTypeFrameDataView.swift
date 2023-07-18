//
//  SelectTypeFrameDataView.swift
//  SF6FrameData
//
//  Created by Rafael Plinio on 06/07/23.
//

import SwiftUI

struct SelectTypeFrameDataView: View {
    @State var characterName: String
    
    var body: some View {
        List {
            NavigationLink("Normal Moves", destination: getDestination(moveType: MoveType.normalMoves.rawValue))
                .frame(height: 50)
                .font(.system(size: 24))
            
            NavigationLink("Special Moves", destination: getDestination(moveType: MoveType.specialMoves.rawValue))
                .frame(height: 50)
                .font(.system(size: 24))
            
            NavigationLink("Throws And Drives", destination: getDestination(moveType: MoveType.throwsAndDrives.rawValue))
                .frame(height: 50)
                .font(.system(size: 24))
        }
        .navigationTitle("Categories")
    }
    
    func getDestination(moveType: String) -> AnyView {
        let value = MoveType(rawValue: moveType)
        
        switch value {
        case .normalMoves:
            return AnyView(NormalMovesFrameDataView(characterName: characterName,
                                                    frameDataTypeTitle: MoveType.normalMoves.rawValue))
        case.specialMoves:
            return AnyView(SpecialMovesFrameDataView(characterName: characterName,
                                                    frameDataTypeTitle: MoveType.specialMoves.rawValue))
        case .throwsAndDrives:
            return AnyView(ThrowDriveMovesFrameDataView(characterName: characterName,
                                                    frameDataTypeTitle: MoveType.throwsAndDrives.rawValue))
        case .none:
            return AnyView(Text(""))
        }
    }
}

struct SelectTypeFrameDataView_Previews: PreviewProvider {
    static var previews: some View {
        SelectTypeFrameDataView(characterName: "Character")
    }
}
