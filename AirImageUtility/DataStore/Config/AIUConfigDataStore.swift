//
//  AIUConfigDataStore.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/09/23.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct AIUConfigDataStore {
    
    private let entity = AIUFlashAirConfigRequest()
    
    func appendAppAutoTime (with value: String) {
        entity.appendAppAutoTime(with: value)
    }
    
    func appendAppInfo (with value: String) {
        entity.appendAppInfo(with: value)
    }
    
    func appendAppMode (with value: AIUConstants.WirelessModeTypes) {
        entity.appendAppMode(with: value)
    }
    
    func appendAppNetworkKey (with value: String) {
        entity.appendAppNetworkKey(with: value)
    }
    
    func appendAppSsid (with value: String) {
        entity.appendAppSsid(with: value)
    }
    
    func appendBrgNetworkKey (with value: String) {
        entity.appendBrgNetworkKey(with: value)
    }
    
    func appendBrgSsis (with value: String) {
        entity.appendBrgSsis(with: value)
    }
    
    func appendCiPath (with value: String) {
        entity.appendCiPath(with: value)
    }
    
    func appendClearMasterCode () {
        entity.appendClearMasterCode()
    }
    
    func appendSetMasterCode (with value: String) {
        entity.appendSetMasterCode(with: value)
    }
    
    func appendSetTimeZone (with value: String) {
        entity.appendSetTimeZone(with: value)
    }
    
    func appendSetWebDAV (with value: AIUConstants.WebDAVTypes) {
        entity.appendSetWebDAV(with: value)
    }
    
    func request() -> Observable<String> {
        return entity.request()
    }
    
    
}
