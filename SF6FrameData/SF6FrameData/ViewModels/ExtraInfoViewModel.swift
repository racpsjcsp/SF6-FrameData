//
//  ExtraInfoViewModel.swift
//  SF6FrameData
//
//  Created by Rafael Plinio on 07/07/23.
//

import Foundation

class ExtraInfoViewModel: ObservableObject {
    let extraInfo = ExtraInfo.data
    
    @Published var motionAndDirectionList: [String] = []
    @Published var attackList: [String] = []
    @Published var cancellableList: [String] = []
    @Published var superCancelList: [String] = []
    @Published var detailList: [String] = []
    @Published var knockdownsList: [String] = []
    
    func getExtraInfoData() {
        for info in extraInfo {
            for motion in info.motionsAndDirections {
                motionAndDirectionList.append(motion)
            }
            
            for attack in info.attacks {
                attackList.append(attack)
            }
            
            for cancel in info.cancellable {
                cancellableList.append(cancel)
            }
            
            for superCancel in info.superCancel {
                superCancelList.append(superCancel)
            }
            
            for detail in info.detail {
                detailList.append(detail)
            }
            
            for frameAdvantage in info.knockdowns {
                knockdownsList.append(frameAdvantage)
            }
        }
    }
    
    
}
