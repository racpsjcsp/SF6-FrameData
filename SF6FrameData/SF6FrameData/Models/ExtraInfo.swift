//
//  ExtraInfo.swift
//  SF6FrameData
//
//  Created by Rafael Plinio on 07/07/23.
//

import Foundation

struct ExtraInfo: Hashable, Identifiable {
    var id = UUID()
    var motionsAndDirections: [String]
    var attacks: [String]
    var cancellable: [String]
    var superCancel: [String]
    var detail: [String]
    var knockdowns: [String]
    
    static var data: [ExtraInfo] {
        return [ExtraInfo(motionsAndDirections: ["u: up", "ub: up back", "uf: up forward", "b: back", "f: forward", "d: down", "n: neutral", "db: down back", "df: down forward", "dp: dragon punch", "qcf: quarter circle forward", "qcb: quarter circle back", "hcf: half circle forward", "hcb: half circle back", "360: A 360 is a full circle motion.", "[c]: Charge. It means you have to either hold that direction or button."],
                          attacks: ["LP: light punch", "MP: medium punch", "HP: heavy punch", "LK: light kick", "MK: medium kick", "HK: heavy kick", "PP: Two punches at the same time", "PPP: Three punches at the same time", "KK: Two kicks at the same time", "KKK: Three kicks at the same time"],
                          cancellable: ["Chain: usually means a move can be cancelled into itself or a similar move, like other light attacks.", "Special: this means that a move can be cancelled into a special attack.", "Target Combo: this means the button can be cancelled into another specific button."],
                          superCancel: ["Level 1: can be cancelled from any special cancellable attack.", "Level 2: can be cancelled from special cancellable normals and overdrive special attacks", "Level 3: can be cancelled from special cancellable normals, overdrive specials, and specials"],
                          detail: ["If an attack has two hits, it will be represented by this simbol > to separate each individual hit."],
                          knockdowns: ["KD: Knockdown", "HKD: Hard Knockdown", "WS: Wall Splat"])]
    }
}
























