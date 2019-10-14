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
    
    static func specificBitPattern (with bitRange: AIUBitRange, length: Int, bit: Int) -> String? {
        let pattern = bitPattern(with: bit, length: length)
        let start = bitRange.start
        let end = bitRange.end

        var result: String = ""
        for i in start..<end {
            result += String(format: "%d", arguments: [pattern[i]])
        }
        return String(result.reversed())
    }
    
    /// bitPatternを抽出します
    ///
    /// - Parameter value: rawValue
    /// - Returns: bitPattern
    private static func bitPattern(with value: Int, length: Int? = nil) -> [Int] {
        let pattern = String(value, radix: 2)
        var patterns = pattern.compactMap {
            Int($0.description)
        }
        if
            let length = length,
            let paddingCnt: Int = length - patterns.count,
            0 < paddingCnt {
            for _ in 0..<paddingCnt {
                patterns.append(0)
            }
        }

        return patterns.reversed()
    }
}
