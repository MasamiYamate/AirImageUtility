//
//  AIUFlashAirCommandRequest.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/08/25.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation

class AIUFlashAirCommandRequest {
    
    /// ファイルリストの取得を行う
    struct AIUFileList: AIUFlashAirDataRequestProtocol {
        
        typealias Parameter = String
        
        typealias Response = (res: String?, err: Error?)
        
        private let httpRequest = AIUHttpRequest()
        
        var parameter: String
        
        func request(callback: (((res: String?, err: Error?)) -> Void)?) {
            let baseUrl = AIUFlashAirRequestTypes.CommandCgi.fileList.url()
            let requestUrl = String(format: "%@&DIR=%@", arguments: [baseUrl, parameter])
            
            httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
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
    
    /// 指定ディレクトリのファイル数を取得する
    struct AIUFileCount: AIUFlashAirDataRequestProtocol {
        
        typealias Parameter = String
        
        typealias Response = (res: Int?, err: Error?)
        
        private let httpRequest = AIUHttpRequest()
        
        var parameter: String
        
        func request(callback: (((res: Int?, err: Error?)) -> Void)?) {
            let baseUrl = AIUFlashAirRequestTypes.CommandCgi.fileCount.url()
            let requestUrl = String(format: "%@&DIR=%@", arguments: [baseUrl, parameter])
            
            httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
                if let err = err {
                    callback?((res: nil, err: err))
                    return
                }
                
                guard
                    let data = data,
                    let strCount = String(data: data, encoding: .utf8),
                    let response = Int(strCount) else {
                        let parseErr = AIUHttpRequest.AIUHttpRequestError.parseError
                        callback?((res: nil, err: parseErr))
                        return
                }
                callback?((res: response, err: nil))
            })
        }
        
    }
    
    /// アップデートされているかどうかを返却します
    struct AIUUpdateInfo: AIUFlashAirDataRequestProtocol {
        
        typealias Response = (res: Int?, err: Error?)
        
        private let httpRequest = AIUHttpRequest()
        
        func request(callback: (((res: Int?, err: Error?)) -> Void)?) {
            let requestUrl = AIUFlashAirRequestTypes.CommandCgi.updateInfo.url()
            
            httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
                if let err = err {
                    callback?((res: nil, err: err))
                    return
                }
                
                guard
                    let data = data,
                    let strCount = String(data: data, encoding: .utf8),
                    let response = Int(strCount) else {
                        let parseErr = AIUHttpRequest.AIUHttpRequestError.parseError
                        callback?((res: nil, err: parseErr))
                        return
                }
                
                callback?((res: response, err: nil))
            })
        }
        
    }
    
    /// FlashAirのSSIDを取得する
    struct AIUSsid: AIUFlashAirDataRequestProtocol {

        typealias Response = (res: String?, err: Error?)
        
        private let httpRequest = AIUHttpRequest()
        
        func request(callback: (((res: String?, err: Error?)) -> Void)?) {
            let requestUrl = AIUFlashAirRequestTypes.CommandCgi.ssid.url()
            
            httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
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
    
    /// FlashAirのネットワークパスワードを取得する
    struct AIUNetworkPassword: AIUFlashAirDataRequestProtocol {

        typealias Response = (res: String?, err: Error?)
        
        private let httpRequest = AIUHttpRequest()
        
        func request(callback: (((res: String?, err: Error?)) -> Void)?) {
            let requestUrl = AIUFlashAirRequestTypes.CommandCgi.networkPassword.url()
            
            httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
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
    
    /// FlashAirのMacアドレスを取得する
    struct AIUMacAddress: AIUFlashAirDataRequestProtocol {

        typealias Response = (res: String?, err: Error?)
        
        private let httpRequest = AIUHttpRequest()
        
        func request(callback: (((res: String?, err: Error?)) -> Void)?) {
            let requestUrl = AIUFlashAirRequestTypes.CommandCgi.macAddress.url()
            
            httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
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
    
    /// ブラウザ言語を取得する
    struct AIUBrowserLanguage: AIUFlashAirDataRequestProtocol {

        typealias Response = (res: String?, err: Error?)
        
        private let httpRequest = AIUHttpRequest()
        
        func request(callback: (((res: String?, err: Error?)) -> Void)?) {
            let requestUrl = AIUFlashAirRequestTypes.CommandCgi.browserLanguage.url()
            
            httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
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
    
    /// ファームウェアバージョンを取得する
    struct AIUFirmwareVersionInfo: AIUFlashAirDataRequestProtocol {

        typealias Response = (res: String?, err: Error?)
        
        private let httpRequest = AIUHttpRequest()
        
        func request(callback: (((res: String?, err: Error?)) -> Void)?) {
            let requestUrl = AIUFlashAirRequestTypes.CommandCgi.firmwareVersionInfo.url()
            
            httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
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
    
    /// 制御イメージを取得します
    struct AIUControlImage: AIUFlashAirDataRequestProtocol {
        
        typealias Response = (res: String?, err: Error?)
        
        private let httpRequest = AIUHttpRequest()
        
        func request(callback: (((res: String?, err: Error?)) -> Void)?) {
            let requestUrl = AIUFlashAirRequestTypes.CommandCgi.controlImage.url()
            
            httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
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
    
    /// 無線LANモードの取得を行います
    struct AIUWifiMode: AIUFlashAirDataRequestProtocol {
        
        typealias Response = (res: String?, err: Error?)
        
        private let httpRequest = AIUHttpRequest()
        
        func request(callback: (((res: String?, err: Error?)) -> Void)?) {
            let requestUrl = AIUFlashAirRequestTypes.CommandCgi.wifiMode.url()
            
            httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
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
    
    /// 制御イメージを取得します
    struct AIUWifiTimeout: AIUFlashAirDataRequestProtocol {
        
        typealias Response = (res: String?, err: Error?)
        
        private let httpRequest = AIUHttpRequest()
        
        func request(callback: (((res: String?, err: Error?)) -> Void)?) {
            let requestUrl = AIUFlashAirRequestTypes.CommandCgi.wifiTimeOutTime.url()
            
            httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
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
    
    /// アプリケーション独自情報の取得を行います
    struct AIUApplicationInfo: AIUFlashAirDataRequestProtocol {
        
        typealias Response = (res: String?, err: Error?)
        
        private let httpRequest = AIUHttpRequest()
        
        func request(callback: (((res: String?, err: Error?)) -> Void)?) {
            let requestUrl = AIUFlashAirRequestTypes.CommandCgi.applicationInfo.url()
            
            httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
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
    
    /// Card Identifierの取得を行います
    struct AIUCid: AIUFlashAirDataRequestProtocol {
        
        typealias Response = (res: String?, err: Error?)
        
        private let httpRequest = AIUHttpRequest()
        
        func request(callback: (((res: String?, err: Error?)) -> Void)?) {
            let requestUrl = AIUFlashAirRequestTypes.CommandCgi.cid.url()
            
            httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
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
    
    /// Card Identifierの取得を行います
    struct AIUUpdateInfoByTimeStamp: AIUFlashAirDataRequestProtocol {
        
        typealias Response = (res: String?, err: Error?)
        
        private let httpRequest = AIUHttpRequest()
        
        func request(callback: (((res: String?, err: Error?)) -> Void)?) {
            let requestUrl = AIUFlashAirRequestTypes.CommandCgi.updateInfoByTimeStamp.url()
            
            httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
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
    
    /// Card Identifierの取得を行います
    struct AIUBlancSectorCount: AIUFlashAirDataRequestProtocol {
        
        typealias Response = (res: String?, err: Error?)
        
        private let httpRequest = AIUHttpRequest()
        
        func request(callback: (((res: String?, err: Error?)) -> Void)?) {
            let requestUrl = AIUFlashAirRequestTypes.CommandCgi.blancSectorCount.url()
            
            httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
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
    
    /// フォトシェアモードを有効にします
    struct AIUEnablePhotoShareMode: AIUFlashAirDataRequestProtocol {
        
        typealias Response = (res: String?, err: Error?)
        
        private let httpRequest = AIUHttpRequest()
        
        func request(callback: (((res: String?, err: Error?)) -> Void)?) {
            let requestUrl = AIUFlashAirRequestTypes.CommandCgi.enablePhotoShareMode.url()
            
            httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
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
                if response == "400 Bad Request" {
                    let badRequest = AIUHttpRequest.AIUHttpRequestError.badRequest
                    callback?((res: nil, err: badRequest))
                    return
                }
                
                callback?((res: response, err: nil))
            })
        }
        
    }

    /// フォトシェアモードを無効にします
    struct AIUDisablePhotoShareMode: AIUFlashAirDataRequestProtocol {
        
        typealias Response = (res: String?, err: Error?)
        
        private let httpRequest = AIUHttpRequest()
        
        func request(callback: (((res: String?, err: Error?)) -> Void)?) {
            let requestUrl = AIUFlashAirRequestTypes.CommandCgi.disablePhotoShareMode.url()
            
            httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
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
                if response == "400 Bad Request" {
                    let badRequest = AIUHttpRequest.AIUHttpRequestError.badRequest
                    callback?((res: nil, err: badRequest))
                    return
                }
                
                callback?((res: response, err: nil))
            })
        }
        
    }
    
    /// フォトシェアモードのステータスを取得します
    struct AIUStatusPhotoShareMode: AIUFlashAirDataRequestProtocol {
        
        typealias Response = (res: String?, err: Error?)
        
        private let httpRequest = AIUHttpRequest()
        
        func request(callback: (((res: String?, err: Error?)) -> Void)?) {
            let requestUrl = AIUFlashAirRequestTypes.CommandCgi.statusPhotoShareMode.url()
            
            httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
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
    
    /// フォトシェアモード専用のSSIDを取得します
    struct AIUSsidPhotoShareMode: AIUFlashAirDataRequestProtocol {
        
        typealias Response = (res: String?, err: Error?)
        
        private let httpRequest = AIUHttpRequest()
        
        func request(callback: (((res: String?, err: Error?)) -> Void)?) {
            let requestUrl = AIUFlashAirRequestTypes.CommandCgi.ssidPhotoShareMode.url()
            
            httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
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
    
}
