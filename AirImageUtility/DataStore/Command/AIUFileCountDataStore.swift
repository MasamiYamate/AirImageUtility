//
//  AIUFileCountDataStore.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/09/06.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct AIUFileCountDataStore {

    let searchPath: String?

    func request() -> Observable<Int> {
        let searchQuery: String = searchPath ?? "/"
        let fileCount = AIUFlashAirCommandRequest.AIUFileCount(parameter: searchQuery)
        return fileCount.request()
    }

}
