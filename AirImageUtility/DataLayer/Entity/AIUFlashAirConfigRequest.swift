//
//  AIUFlashAirConfigRequest.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/08/27.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation

class AIUFlashAirConfigRequest: AIUFlashAirDataRequestProtocol {
    typealias Response = (res: String?, err: Error?)
    
    enum WirelessModeTypes: String {
        case apModeDisableWriteProtect = "0"
        case staModeDisableWriteProtect = "2"
        case multiConnectModeDisableWriteProtect = "3"
        case apMode = "4"
        case staMode = "5"
        case multiConnectMode = "6"
    }
    
    enum WebDAVTypes: String {
        case disableFlashAirDrive = "0"
        case enableFlashAirDriveByReadOnly = "1"
        case enableFlashAirDrive = "2"
    }
    
    private let httpRequest = AIUHttpRequest()
    
    var parameters = [String]()
    
    func appendAppAutoTime (with value: String) {
        let parameter = AIUFlashAirRequestTypes.ConfigCgi.appAutoTime.parameter(with: value)
        parameters.append(parameter)
    }
    
    func appendAppInfo (with value: String) {
        let parameter = AIUFlashAirRequestTypes.ConfigCgi.appInfo.parameter(with: value)
        parameters.append(parameter)
    }
    
    func appendAppMode (with value: WirelessModeTypes) {
        let parameter = AIUFlashAirRequestTypes.ConfigCgi.appMode.parameter(with: value.rawValue)
        parameters.append(parameter)
    }
    
    func appendAppNetworkKey (with value: String) {
        let parameter = AIUFlashAirRequestTypes.ConfigCgi.appNetworkKey.parameter(with: value)
        parameters.append(parameter)
    }
    
    func appendAppSsid (with value: String) {
        let parameter = AIUFlashAirRequestTypes.ConfigCgi.appSsid.parameter(with: value)
        parameters.append(parameter)
    }
    
    func appendBrgNetworkKey (with value: String) {
        let parameter = AIUFlashAirRequestTypes.ConfigCgi.brgNetworkKey.parameter(with: value)
        parameters.append(parameter)
    }
    
    func appendBrgSsis (with value: String) {
        let parameter = AIUFlashAirRequestTypes.ConfigCgi.brgSsis.parameter(with: value)
        parameters.append(parameter)
    }
    
    func appendCiPath (with value: String) {
        let parameter = AIUFlashAirRequestTypes.ConfigCgi.ciPath.parameter(with: value)
        parameters.append(parameter)
    }
    
    func appendClearMasterCode () {
        let parameter = AIUFlashAirRequestTypes.ConfigCgi.clearMasterCode.parameter(with: "1")
        parameters.append(parameter)
    }
    
    func appendSetMasterCode (with value: String) {
        let parameter = AIUFlashAirRequestTypes.ConfigCgi.setMasterCode.parameter(with: value)
        parameters.append(parameter)
    }
    
    func appendSetTimeZone (with value: String) {
        let parameter = AIUFlashAirRequestTypes.ConfigCgi.setTimeZone.parameter(with: value)
        parameters.append(parameter)
    }
    
    func appendSetWebDAV (with value: WebDAVTypes) {
        let parameter = AIUFlashAirRequestTypes.ConfigCgi.setWebDav.parameter(with: value.rawValue)
        parameters.append(parameter)
    }
    
    
    func request(callback: (((res: String?, err: Error?)) -> Void)?) {
        let url = AIUFlashAirRequestTypes.ConfigCgi.url(parms: parameters)
        httpRequest.asyncGet(with: url, callback: {(data: Data?, res: URLResponse?, err: Error?) in
            if let err = err {
                callback?((res: nil, err: err))
                return
            }
            
            guard
                let data = data,
                let response = String(data: data, encoding: .utf8) else {
                    let parseErr = AIUHttpRequest.AIUHttpRequestError.parseError
                    callback?((res: nil, err: parseErr))
                    return
            }
            
            callback?((res: response, err: nil))
        })
    }
    
}
