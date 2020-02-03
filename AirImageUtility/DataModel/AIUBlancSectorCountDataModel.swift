//
//  AIUBlancSectorCountDataModel.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/09/09.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation

public struct AIUBlancSectorCountDataModel {
    
    
    /// トータルセレクター数
    public let totalSector: Int
    
    /// 使用済みセレクター数
    public let usedSector: Int
    
    /// 未使用セレクター数
    public let unusedSector: Int
    
    /// セレクターバイトサイズ
    public let sectorByteSize: Int
    
    /// トータル容量
    public let totalSize: Int
    
    /// 未使用領域サイズ
    public let unusedSize: Int
    
    /// 使用済み領域サイズ
    public let usedSize: Int
    
}
