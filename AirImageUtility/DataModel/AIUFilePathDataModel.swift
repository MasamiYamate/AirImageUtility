//
//  AIUFilePathDataModel.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/08/28.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation

public struct AIUFilePathDataModel {
    
    enum AIUAttributeTypes: Int {
        case archive = 5
        case directory = 4
        case volume = 3
        case system = 2
        case secret = 1
        case readOnry = 0
    }

    let directoryName: String
    
    let name: String
    
    let size: Int
    
    let attribute: AIUAttributeTypes
    
    let date: Date
    
}

extension AIUFilePathDataModel: Equatable {
    
    static public func ==(l: AIUFilePathDataModel, r: AIUFilePathDataModel) -> Bool{
        guard
            l.directoryName == r.directoryName,
            l.name == r.name,
            l.size == r.size,
            l.attribute == r.attribute,
            l.date == r.date else {
            return false
        }
        
        return true
    }
    
}
