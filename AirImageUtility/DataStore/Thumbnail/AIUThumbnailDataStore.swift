//
//  AIUThumbnailDataStore.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/09/19.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct AIUThumbnailDataStore {
    
    let filePath: String
    
    func request() -> Observable<Data> {
        let thumbnail = AIUFlashAirThumbnailRequest(parameter: filePath)
        return thumbnail.request()
    }
    
    
}
