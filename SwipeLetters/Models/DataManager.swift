//
//  DataManager.swift
//  SwipeLetters
//
//  Created by Glenn Posadas on 1/21/21.
//

import Foundation

struct DataManager {
    static var alphabeticalData: [String] = [
        "Aa",
        "Bb",
        "Cc",
        "Dd",
        "Ee",
        "Ff",
        "Gg",
        "Hh",
        "Ii",
        "Jj",
        "Kk",
        "Ll",
        "Mm",
        "Nn",
        "Oo",
        "Pp",
        "Qq",
        "Rr",
        "Ss",
        "Tt",
        "Uu",
        "Vv",
        "Ww",
        "Xx",
        "Yy",
        "Zz"
    ]
    
    static var data: [String] {
        get {
            let useRandomizeLetters = AppDefaults.getObjectWithKey(.useRandomizeLetters, type: Bool.self) ?? false
            return useRandomizeLetters ? alphabeticalData.shuffled() : alphabeticalData
        }
    }
}
