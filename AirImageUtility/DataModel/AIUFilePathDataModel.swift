//
//  AIUFilePathDataModel.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/08/28.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation

public struct AIUFilePathDataModel {

    /// ファイル種別
    public enum AIUAttributeTypes: Int {
        case archive = 5
        case directory = 4
        case volume = 3
        case system = 2
        case secret = 1
        case readOnry = 0
    }

    
    /// 所属するディレクトリ名
    public let directoryName: String
    
    /// ファイル名
    public let name: String
    
    /// ファイルサイズ
    public let size: Int
    
    /// ファイル種別
    public let attribute: AIUAttributeTypes
    
    /// ファイル生成日
    public let date: Date
    
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
