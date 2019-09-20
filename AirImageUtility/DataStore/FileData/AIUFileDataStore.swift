//
//  AIUFileDataStore.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/09/20.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct AIUFileDataStore {
    
    let filePath: String
    
    func request() -> Observable<Data> {
        let fileData = AIUFlashAirFileDataRequest(filePath: filePath)
        return fileData.request()
    }
    
}
