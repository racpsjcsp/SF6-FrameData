//
//  CharacterFrameDataViewModel.swift
//  SF6FrameData
//
//  Created by Rafael Plinio on 05/07/23.
//

import Foundation

class CharacterFrameDataViewModel: ObservableObject {
    let characters = Character.data
    
    @Published var moveListType: String = ""
    @Published var frameCategories: [String] = []
    
    @Published var normalMoveList: [String] = []
    @Published var normalDamageList: [String] = []
    @Published var normalCancelList: [String] = []
    @Published var normalStartupList: [String] = []
    @Published var normalActiveList: [String] = []
    @Published var normalRecoveryList: [String] = []
    @Published var normalOnHitList: [String] = []
    @Published var normalOnBlockList: [String] = []
    @Published var normalNotes: [String] = []
    
    @Published var specialMoveList: [String] = []
    @Published var specialDamageList: [String] = []
    @Published var specialStartupList: [String] = []
    @Published var specialActiveList: [String] = []
    @Published var specialRecoveryList: [String] = []
    @Published var specialOnHitList: [String] = []
    @Published var specialOnBlockList: [String] = []
    @Published var specialNotes: [String] = []
    
    @Published var throwDriveMoveList: [String] = []
    @Published var throwDriveDamageList: [String] = []
    @Published var throwDriveStartupList: [String] = []
    @Published var throwDriveActiveList: [String] = []
    @Published var throwDriveRecoveryList: [String] = []
    @Published var throwDriveOnHitList: [String] = []
    @Published var throwDriveOnBlockList: [String] = []
    @Published var throwDriveNotes: [String] = []
    
    func getNormalMovesCharacterData(characterName: String) {
        for character in characters {
            if character.name == characterName {
                
                // Normal Moves
                for move in character.normalMoves {
                    normalMoveList.append(move)
                }
                
                for damage in character.normalDamageValues {
                    normalDamageList.append(damage)
                }
                
                for cancel in character.normalCancelValues {
                    normalCancelList.append(cancel)
                }
                
                for startup in character.normalStartupValues {
                    normalStartupList.append(startup)
                }
                
                for active in character.normalActiveValues {
                    normalActiveList.append(active)
                }
                
                for recovery in character.normalRecoveryValues {
                    normalRecoveryList.append(recovery)
                }
                
                for onHit in character.normalOnHitValues {
                    normalOnHitList.append(onHit)
                }
                
                for onBlock in character.normalOnBlockValues {
                    normalOnBlockList.append(onBlock)
                }
                
                for note in character.normalNotes {
                    normalNotes.append(note)
                }
            }
        }
    }
    
    func getSpecialMovesCharacterData(characterName: String) {
        for character in characters {
            if character.name == characterName {
                
                // Special Moves
                for move in character.specialMoves {
                    specialMoveList.append(move)
                }
                
                for damage in character.specialDamageValues {
                    specialDamageList.append(damage)
                }
                
//                for cancel in character.specialCancelValues {
//                    specialCancelList.append(cancel)
//                }
                
                for startup in character.specialStartupValues {
                    specialStartupList.append(startup)
                }
                
                for active in character.specialActiveValues {
                    specialActiveList.append(active)
                }
                
                for recovery in character.specialRecoveryValues {
                    specialRecoveryList.append(recovery)
                }
                
                for onHit in character.specialOnHitValues {
                    specialOnHitList.append(onHit)
                }
                
                for onBlock in character.specialOnBlockValues {
                    specialOnBlockList.append(onBlock)
                }
                
                for note in character.specialNotes {
                    specialNotes.append(note)
                }
            }
        }
    }
    
    func getThrowDriveMovesCharacterData(characterName: String) {
        for character in characters {
            if character.name == characterName {
                
                // Throw and Drive moves
                for move in character.throwDriveMoves {
                    throwDriveMoveList.append(move)
                }
                
                for damage in character.throwDriveDamageValues {
                    throwDriveDamageList.append(damage)
                }
                
//                for cancel in character.specialCancelValues {
//                    specialCancelList.append(cancel)
//                }
                
                for startup in character.throwDriveStartupValues {
                    throwDriveStartupList.append(startup)
                }
                
                for active in character.throwDriveActiveValues {
                    throwDriveActiveList.append(active)
                }
                
                for recovery in character.throwDriveRecoveryValues {
                    throwDriveRecoveryList.append(recovery)
                }
                
                for onHit in character.throwDriveOnHitValues {
                    throwDriveOnHitList.append(onHit)
                }
                
                for onBlock in character.throwDriveOnBlockValues {
                    throwDriveOnBlockList.append(onBlock)
                }
                
                for note in character.throwDriveNotes {
                    throwDriveNotes.append(note)
                }
                    
                if character.name != "Zangief" {
                    throwDriveNotes.removeLast()
                }
            }
        }
    }
}
