//
//  AIUUpdateInfoDataStore.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/09/09.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation

struct AIUUpdateInfoDataStore {
    
    func request(callback: (((res: Int?, err: Error?)) -> Void)?) {
        let updateInfo = AIUFlashAirCommandRequest.AIUUpdateInfo()
        updateInfo.request(callback: {(res: Int? , err: Error?) in
            callback?((res: res, err: err))
        })
    }
    
}
