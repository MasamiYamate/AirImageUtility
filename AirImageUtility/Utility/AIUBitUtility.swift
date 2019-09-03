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
    
    static func specificBitPattern (start: Int, end: Int, bit: Int) -> String? {
        var pattern = bitPattern(with: bit)

        if start < 0 {
            return nil
        }
        if (pattern.count - 1) <= end {
            for _ in 0...(end - pattern.count) {
                pattern.append(0)
            }
        }
        pattern = pattern.reversed()
        var result: String = ""
        for i in start...end {
            result += String(format: "%d", arguments: [pattern[i]])
        }
        return result
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
