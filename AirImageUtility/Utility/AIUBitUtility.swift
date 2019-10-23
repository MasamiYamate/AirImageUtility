//
//  AIUBitUtility.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/08/29.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation

class AIUBitUtility {
    
    static func isFlag (with index: Int, bit: Int) -> Bool {
        let pattern = bitPattern(with: bit)
        guard pattern.indices.contains(index) else {
            return false
        }
        if pattern[index] == 1 {
            return true
        }
        return false
    }

    /// bitPatternを抽出します
    ///
    /// - Parameter value: rawValue
    /// - Returns: bitPattern
    private static func bitPattern(with value: Int) -> [Int] {
        let pattern = String(value, radix: 2)
        let patterns = pattern.compactMap {
            Int($0.description)
        }
        return patterns.reversed()
    }
}
