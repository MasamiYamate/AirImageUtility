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
        static let month = AIUBitRange(start: 5, end: 9)
        static let day = AIUBitRange(start: 0, end: 5)
        static let hour = AIUBitRange(start: 11, end: 15)
        static let min = AIUBitRange(start: 5, end: 10)
        static let sec = AIUBitRange(start: 0, end: 4)
    }
    
    public enum appMode: Int {
        // Start the wireless LAN function in manual start mode.
        // Sets the Wireless LAN to AP mode.
        case manualStartAPMode = 0
        // Start the wireless LAN function in manual start mode.
        // Sets the Wireless LAN to STA mode.
        case manualStartSTAMode = 2
        // Start the wireless LAN function in manual start mode.
        // Sets the Wireless LAN to "Internet pass-thru" mode.
        // (FW 2.00.02+)
        case manualStartPassThru = 3
        // Start the wireless LAN function in auto start mode.
        // Sets the Wireless LAN to AP mode.
        case autoStartAPMode = 4
        // Start the wireless LAN function in auto start mode.
        // Sets the Wireless LAN to STA mode.
        case autoStartSTAMode = 5
        // Start the wireless LAN function in auto start mode.
        // Sets the Wireless LAN to "Internet pass-thru" mode.
        // (FW 2.00.02+)
        case autoStartPassThru = 6
        // Other Undefined behaviour.
        case unknown
        
        static func translate (with value: String) -> AIUConstants.appMode {
            if
                let type = Int(value),
                let mode = AIUConstants.appMode.init(rawValue: type) {
                return mode
            }else{
                return AIUConstants.appMode.unknown
            }
        }
        
    }
    
}
