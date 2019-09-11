//
//  AIUMacAddressDataStore.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/09/09.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct AIUMacAddressDataStore {
    
    func request() -> Observable<String> {
        let macAddress = AIUFlashAirCommandRequest.AIUMacAddress()
        return macAddress.request()
    }
    
}
