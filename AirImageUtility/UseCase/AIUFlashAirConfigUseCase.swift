//
//  AIUFlashAirConfigUseCase.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/09/23.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct AIUFlashAirConfigUseCase {
    
    private let dataStore = AIUConfigDataStore()
    
    func appendAppAutoTime (with value: String) {
        dataStore.appendAppAutoTime(with: value)
    }
    
    func appendAppInfo (with value: String) {
        dataStore.appendAppInfo(with: value)
    }
    
    func appendAppMode (with value: AIUConstants.WirelessModeTypes) {
        dataStore.appendAppMode(with: value)
    }
    
    func appendAppNetworkKey (with value: String) {
        dataStore.appendAppNetworkKey(with: value)
    }
    
    func appendAppSsid (with value: String) {
        dataStore.appendAppSsid(with: value)
    }
    
    func appendBrgNetworkKey (with value: String) {
        dataStore.appendBrgNetworkKey(with: value)
    }
    
    func appendBrgSsis (with value: String) {
        dataStore.appendBrgSsis(with: value)
    }
    
    func appendCiPath (with value: String) {
        dataStore.appendCiPath(with: value)
    }
    
    func appendClearMasterCode () {
        dataStore.appendClearMasterCode()
    }
    
    func appendSetMasterCode (with value: String) {
        dataStore.appendSetMasterCode(with: value)
    }
    
    func appendSetTimeZone (with value: String) {
        dataStore.appendSetTimeZone(with: value)
    }
    
    func appendSetWebDAV (with value: AIUConstants.WebDAVTypes) {
        dataStore.appendSetWebDAV(with: value)
    }
    
    func request() -> Observable<String> {
        return dataStore.request()
    }
    
}
