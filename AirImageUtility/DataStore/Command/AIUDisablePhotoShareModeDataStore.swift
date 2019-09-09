//
//  AIUDisablePhotoShareModeDataStore.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/09/09.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation

struct AIUDisablePhotoShareModeDataStore {
    
    func request(callback: (((res: String?, err: Error?)) -> Void)?) {
        let disablePhotoShareMode = AIUFlashAirCommandRequest.AIUDisablePhotoShareMode()
        disablePhotoShareMode.request(callback: {(res: String? , err: Error?) in
            callback?((res: res, err: err))
        })
    }
    
}
