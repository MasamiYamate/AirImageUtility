//
//  AIUFilePathDataModelTranslator.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/08/28.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import UIKit

class AIUFilePathDataModelTranslator {
    
    func translate (with value: String) -> [AIUFilePathDataModel] {
        let lines = value.components(separatedBy: .newlines)
        return lines.reduce([AIUFilePathDataModel]()) {
            var result = $0
            guard let pathData: AIUFilePathDataModel = createPathData(with: $1) else {
                return result
            }
            result.append(pathData)
            return result
        }
    }
    
    private func createPathData (with value: String) -> AIUFilePathDataModel?  {
        let items = value.components(separatedBy: ",")
        
        guard
            let dirName = directoryName(with: items),
            let name = fileName(with: items),
            let size = fileSize(with: items),
            let attr = attribute(with: items),
            let date = date(with: items) else {
                return nil
        }
        
        
        return AIUFilePathDataModel(directoryName: dirName,
                                    name: name,
                                    size: size,
                                    attribute: attr,
                                    date: date)
    }
    
    private func directoryName(with value: [String]) -> String? {
        guard value.indices.contains(0) else {
            return nil
        }
        return value[0]
    }
    
    private func fileName(with value: [String]) -> String? {
        guard value.indices.contains(1) else {
            return nil
        }
        return value[1]
    }
    
    private func fileSize(with value: [String]) -> Int? {
        guard
            value.indices.contains(2),
            let fileSize: Int = Int(value[2]) else {
            return nil
        }
        return fileSize
    }
    
    private func attribute(with value: [String]) -> AIUFilePathDataModel.AIUAttributeTypes? {
        guard
            value.indices.contains(3),
            let bitValue = Int(value[3]) else {
                return nil
        }
        if AIUBitUtility.isFlag(with: AIUFilePathDataModel.AIUAttributeTypes.archive.rawValue,
                                bit: bitValue) {
            return AIUFilePathDataModel.AIUAttributeTypes.archive
        }
        if AIUBitUtility.isFlag(with: AIUFilePathDataModel.AIUAttributeTypes.directory.rawValue,
                                bit: bitValue) {
            return AIUFilePathDataModel.AIUAttributeTypes.directory
        }
        if AIUBitUtility.isFlag(with: AIUFilePathDataModel.AIUAttributeTypes.readOnry.rawValue,
                                bit: bitValue) {
            return AIUFilePathDataModel.AIUAttributeTypes.readOnry
        }
        if AIUBitUtility.isFlag(with: AIUFilePathDataModel.AIUAttributeTypes.volume.rawValue,
                                bit: bitValue) {
            return AIUFilePathDataModel.AIUAttributeTypes.volume
        }
        if AIUBitUtility.isFlag(with: AIUFilePathDataModel.AIUAttributeTypes.system.rawValue,
                                bit: bitValue) {
            return AIUFilePathDataModel.AIUAttributeTypes.system
        }
        if AIUBitUtility.isFlag(with: AIUFilePathDataModel.AIUAttributeTypes.secret.rawValue,
                                bit: bitValue) {
            return AIUFilePathDataModel.AIUAttributeTypes.secret
        }
        return nil
    }
    
    private func date(with value: [String]) -> Date? {
        // MARK: bitPatternの抽出
        guard
            value.indices.contains(4),
            value.indices.contains(5),
            let dateBitValue = Int(value[4]),
            let timeBitValue = Int(value[5]) else {
                return nil
        }
        
        // MARK: 各要素のパターン抽出
        guard
            let yearPattern = AIUBitUtility.specificBitPattern(with: AIUConstants.bitRanges.year, bit: dateBitValue),
            let monthPattern = AIUBitUtility.specificBitPattern(with: AIUConstants.bitRanges.month, bit: dateBitValue),
            let dayPattern = AIUBitUtility.specificBitPattern(with: AIUConstants.bitRanges.day, bit: dateBitValue),
            let hourPattern = AIUBitUtility.specificBitPattern(with: AIUConstants.bitRanges.hour, bit: timeBitValue),
            let minPattern = AIUBitUtility.specificBitPattern(with: AIUConstants.bitRanges.min, bit: timeBitValue),
            let secPattern = AIUBitUtility.specificBitPattern(with: AIUConstants.bitRanges.sec, bit: timeBitValue) else {
                return nil
        }
        
        // MARK: 各要素のValueを算出する
        guard
            let yearRaw = Int(yearPattern, radix: 2),
            let month = Int(monthPattern, radix: 2),
            let day = Int(dayPattern, radix: 2),
            let hour = Int(hourPattern, radix: 2),
            let min = Int(minPattern, radix: 2),
            let secRaw = Int(secPattern, radix: 2) else {
                return nil
        }
        
        // FlashAirの返却値そのままでは通常の年数にならないので補正する
        let year = AIUConstants.baseYear + yearRaw
        let sec = secRaw / 2
        
        let stringDate = String(format: "%d-%d-%d-%d:%d:%d", arguments: [year,month,day,hour,min,sec])
        
        let format = "yyyy-MM-dd-HH:mm:ss"
        let formater = DateFormatter()
        formater.dateFormat = format
        
        return formater.date(from: stringDate)
    }
    
}
