//
//  AIUMacAddressDataStore.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/09/09.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation

struct AIUMacAddressDataStore {
    
    func request(callback: (((res: String?, err: Error?)) -> Void)?) {
        let macAddress = AIUFlashAirCommandRequest.AIUMacAddress()
        macAddress.request(callback: {(res: String? , err: Error?) in
            callback?((res: res, err: err))
        })
    }
    
}
