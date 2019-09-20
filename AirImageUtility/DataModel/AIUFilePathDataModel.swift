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
