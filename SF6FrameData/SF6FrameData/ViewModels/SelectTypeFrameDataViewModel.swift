//
//  SelectTypeFrameDataViewModel.swift
//  SF6FrameData
//
//  Created by Rafael Plinio on 06/07/23.
//

import Foundation

class SelectTypeFrameDataViewModel: ObservableObject {
    init() {}
    
}

enum MoveType: String, CaseIterable, Identifiable {
    var id : MoveType {
        self
    }
    
    case normalMoves = "Normal Moves"
    case specialMoves = "Special Moves"
    case throwsAndDrives = "Throws And Drives"
}
