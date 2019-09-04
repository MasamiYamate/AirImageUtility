//
//  Constants.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/08/23.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation

class AIUConstants {
    
    // MARK: 必要な定数群
    /// FlashAirの年数基準年
    static let baseYear: Int = 1980
    
    // MARK: bitPatternのTuple
    struct bitRanges {
        static let year = AIUBitRange(start: 9, end: 15)
        static let month = AIUBitRange(start: 5, end: 8)
        static let day = AIUBitRange(start: 0, end: 4)
        static let hour = AIUBitRange(start: 11, end: 15)
        static let min = AIUBitRange(start: 5, end: 10)
        static let sec = AIUBitRange(start: 0, end: 4)
    }
    
}
