//
//  AIUBlancSectorCountDataModelTranslator.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/09/09.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation

class AIUBlancSectorCountDataModelTranslator {
    
    enum ErrorType: Error {
        case notFoundData
        case parseError
    }
    
    func translate (with value: String) throws -> AIUBlancSectorCountDataModel {
        let data = parse(with: value)
        if let err = data.err {
            throw err
        }
        guard
            let unused: Int = data.value.unused,
            let total: Int = data.value.total,
            let sectorSize: Int = data.value.sectorSize else {
                throw ErrorType.notFoundData
        }
        let used = usedSectorSize(with: total, unused: unused)
        let totalSizeValue = totalSize(with: total, sectorSize: sectorSize)
        let usedSizeValue = usedSize(with: used, sectorSize: sectorSize)
        let unusedSizeValue = unusedSize(with: unused, sectorSize: sectorSize)
        
        return AIUBlancSectorCountDataModel(totalSector: total,
                                            usedSector: used,
                                            unusedSector: unused,
                                            sectorByteSize: sectorSize,
                                            totalSize: totalSizeValue,
                                            unusedSize: unusedSizeValue,
                                            usedSize: usedSizeValue)
    }

    private func parse(with value: String) -> (err: Error? , value: (unused: Int?, total: Int?, sectorSize: Int?)) {
        let sectorData = value.components(separatedBy: ",")
        guard
            let sectorUsedSize: String = sectorData.first,
            let sectorSize: String = sectorData.last else {
                return (err: ErrorType.parseError, value: (unused: nil, total: nil, sectorSize: nil))
        }
        let sectorUsedSizes = sectorUsedSize.components(separatedBy: "/")
        guard
            let usedSector = sectorUsedSizes.first,
            let unusedSector = sectorUsedSizes.last else {
            return (err: ErrorType.parseError, value: (unused: nil, total: nil, sectorSize: nil))
        }
        guard
            let sectorSizeValue: Int = Int(sectorSize),
            let usedSectorValue: Int = Int(usedSector),
            let unusedSectorValue: Int = Int(unusedSector) else {
            return (err: ErrorType.parseError, value: (unused: nil, total: nil, sectorSize: nil))
        }
        return (err: ErrorType.parseError,
                value: (unused: unusedSectorValue, total: usedSectorValue, sectorSize: sectorSizeValue))
    }
    
    private func usedSectorSize (with total: Int, unused: Int) -> Int {
        return total - unused
    }
    
    private func totalSize (with total: Int, sectorSize: Int) -> Int {
        return total * sectorSize
    }
    
    private func usedSize (with used: Int, sectorSize: Int) -> Int {
        return used * sectorSize
    }
    
    private func unusedSize (with unused: Int, sectorSize: Int) -> Int {
        return unused * sectorSize
    }
    
}
