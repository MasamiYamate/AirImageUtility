//
//  AIUCidDataStore.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/09/09.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct AIUCidDataStore {
    
    func request() -> Observable<String> {
        let cid = AIUFlashAirCommandRequest.AIUCid()
        return cid.request()
    }
    
}
