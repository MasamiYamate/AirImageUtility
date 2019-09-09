//
//  AIUCidDataStore.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/09/09.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation

struct AIUCidDataStore {
    
    func request(callback: (((res: String?, err: Error?)) -> Void)?) {
        let cid = AIUFlashAirCommandRequest.AIUCid()
        cid.request(callback: {(res: String? , err: Error?) in
            callback?((res: res, err: err))
        })
    }
    
}
