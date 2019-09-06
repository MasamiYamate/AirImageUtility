//
//  AIUFileCountDataStore.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/09/06.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation

struct AIUFileCountDataStore {

    let searchPath: String?

    func request(callback: (((res: Int?, err: Error?)) -> Void)?) {
        let searchQuery: String = searchPath ?? "/"
        let fileCount = AIUFlashAirCommandRequest.AIUFileCount(parameter: searchQuery)
        fileCount.request(callback: {(res: Int? , err: Error?) in
            callback?((res: res, err: err))
        })
    }

}
