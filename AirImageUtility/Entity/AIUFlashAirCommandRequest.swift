//
//  AIUFlashAirCommandRequest.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/08/25.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class AIUFlashAirCommandRequest {
    
    /// ファイルリストの取得を行う
    struct AIUFileList: AIUFlashAirDataRequestProtocol {
        
        typealias Parameter = String
        
        typealias Response = String
        
        private let httpRequest = AIUHttpRequest()
        
        var parameter: String
        
        func request() -> Observable<Response> {
            return Observable<Response>.create { observable in
                let baseUrl = AIUFlashAirRequestTypes.CommandCgi.fileList.url()
                let requestUrl = String(format: "%@&DIR=%@",
                                        arguments: [baseUrl, self.parameter])
                
                self.httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
                    if let err = err {
                        observable.onError(err)
                        return
                    }
                    guard
                        let data = data,
                        let response = String(data: data, encoding: .utf8) else {
                            let parseErr = AIUHttpRequest.AIUHttpRequestError.parseError
                            observable.onError(parseErr)
                            return
                    }
                    observable.onNext(response)
                    observable.onCompleted()
                })
                return Disposables.create()
            }
        }
        
    }
    
    /// 指定ディレクトリのファイル数を取得する
    struct AIUFileCount: AIUFlashAirDataRequestProtocol {
        
        typealias Parameter = String
        
        typealias Response = Int
        
        private let httpRequest = AIUHttpRequest()
        
        var parameter: String
        
        func request() -> Observable<Int> {
            return Observable<Int>.create { observable in
                let baseUrl = AIUFlashAirRequestTypes.CommandCgi.fileCount.url()
                let requestUrl = String(format: "%@&DIR=%@", arguments: [baseUrl, self.parameter])
                
                self.httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
                    if let err = err {
                        observable.onError(err)
                        return
                    }
                    
                    guard
                        let data = data,
                        let strCount = String(data: data, encoding: .utf8),
                        let response = Int(strCount) else {
                            let parseErr = AIUHttpRequest.AIUHttpRequestError.parseError
                            observable.onError(parseErr)
                            return
                    }
                    observable.onNext(response)
                    observable.onCompleted()
                })
                return Disposables.create()
            }
        }
    }
    
    /// アップデートされているかどうかを返却します
    struct AIUUpdateInfo: AIUFlashAirDataRequestProtocol {
        
        typealias Response = Int
        
        private let httpRequest = AIUHttpRequest()
        
        func request() -> Observable<Int> {
            return Observable<Int>.create { observable in
                let requestUrl = AIUFlashAirRequestTypes.CommandCgi.updateInfo.url()
                self.httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
                    if let err = err {
                        observable.onError(err)
                        return
                    }
                    
                    guard
                        let data = data,
                        let strCount = String(data: data, encoding: .utf8),
                        let response = Int(strCount) else {
                            let parseErr = AIUHttpRequest.AIUHttpRequestError.parseError
                            observable.onError(parseErr)
                            return
                    }
                    observable.onNext(response)
                    observable.onCompleted()
                })
                return Disposables.create()
            }
        }
    }
    
    /// FlashAirのSSIDを取得する
    struct AIUSsid: AIUFlashAirDataRequestProtocol {

        typealias Response = String
        
        private let httpRequest = AIUHttpRequest()
        
        func request() -> Observable<String> {
            return Observable<String>.create { observable in
                let requestUrl = AIUFlashAirRequestTypes.CommandCgi.ssid.url()
                
                self.httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
                    if let err = err {
                        observable.onError(err)
                        return
                    }
                    
                    guard
                        let data = data,
                        let response = String(data: data, encoding: .utf8) else {
                            let parseErr = AIUHttpRequest.AIUHttpRequestError.parseError
                            observable.onError(parseErr)
                            return
                    }
                    
                    observable.onNext(response)
                    observable.onCompleted()
                })
                return Disposables.create()
            }
        }

    }
    
    /// FlashAirのネットワークパスワードを取得する
    struct AIUNetworkPassword: AIUFlashAirDataRequestProtocol {

        typealias Response = String
        
        private let httpRequest = AIUHttpRequest()
        
        func request() -> Observable<String> {
            return Observable<String>.create { observable in
                let requestUrl = AIUFlashAirRequestTypes.CommandCgi.networkPassword.url()
                
                self.httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
                    if let err = err {
                        observable.onError(err)
                        return
                    }
                    
                    guard
                        let data = data,
                        let response = String(data: data, encoding: .utf8) else {
                            let parseErr = AIUHttpRequest.AIUHttpRequestError.parseError
                            observable.onError(parseErr)
                            return
                    }
                    
                    observable.onNext(response)
                    observable.onCompleted()
                })
                return Disposables.create()
            }
        }

    }
    
    /// FlashAirのMacアドレスを取得する
    struct AIUMacAddress: AIUFlashAirDataRequestProtocol {

        typealias Response = String
        
        private let httpRequest = AIUHttpRequest()
        
        func request() -> Observable<String> {
            return Observable<String>.create { observable in
                let requestUrl = AIUFlashAirRequestTypes.CommandCgi.macAddress.url()
                
                self.httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
                    if let err = err {
                        observable.onError(err)
                        return
                    }
                    
                    guard
                        let data = data,
                        let response = String(data: data, encoding: .utf8) else {
                            let parseErr = AIUHttpRequest.AIUHttpRequestError.parseError
                            observable.onError(parseErr)
                            return
                    }
                    observable.onNext(response)
                    observable.onCompleted()
                })
                return Disposables.create()
            }
        }

    }
    
    /// ブラウザ言語を取得する
    struct AIUBrowserLanguage: AIUFlashAirDataRequestProtocol {

        typealias Response = String
        
        private let httpRequest = AIUHttpRequest()
        
        func request() -> Observable<String> {
            return Observable<String>.create { observable in
                let requestUrl = AIUFlashAirRequestTypes.CommandCgi.browserLanguage.url()
                
                self.httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
                    if let err = err {
                        observable.onError(err)
                        return
                    }
                    
                    guard
                        let data = data,
                        let response = String(data: data, encoding: .utf8) else {
                            let parseErr = AIUHttpRequest.AIUHttpRequestError.parseError
                            observable.onError(parseErr)
                            return
                    }
                    observable.onNext(response)
                    observable.onCompleted()
                })
                return Disposables.create()
            }
        }

    }
    
    /// ファームウェアバージョンを取得する
    struct AIUFirmwareVersionInfo: AIUFlashAirDataRequestProtocol {

        typealias Response = String
        
        private let httpRequest = AIUHttpRequest()
        
        func request() -> Observable<String> {
            return Observable<String>.create { observable in
                let requestUrl = AIUFlashAirRequestTypes.CommandCgi.firmwareVersionInfo.url()
                
                self.httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
                    if let err = err {
                        observable.onError(err)
                        return
                    }
                    
                    guard
                        let data = data,
                        let response = String(data: data, encoding: .utf8) else {
                            let parseErr = AIUHttpRequest.AIUHttpRequestError.parseError
                            observable.onError(parseErr)
                            return
                    }
                    observable.onNext(response)
                    observable.onCompleted()
                })
                return Disposables.create()
            }
        }

    }
    
    /// 制御イメージを取得します
    struct AIUControlImage: AIUFlashAirDataRequestProtocol {
        
        typealias Response = String
        
        private let httpRequest = AIUHttpRequest()
        
        func request() -> Observable<String> {
            return Observable<String>.create { observable in
                let requestUrl = AIUFlashAirRequestTypes.CommandCgi.controlImage.url()
                
                self.httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
                    if let err = err {
                        observable.onError(err)
                        return
                    }
                    
                    guard
                        let data = data,
                        let response = String(data: data, encoding: .utf8) else {
                            let parseErr = AIUHttpRequest.AIUHttpRequestError.parseError
                            observable.onError(parseErr)
                            return
                    }
                    observable.onNext(response)
                    observable.onCompleted()
                })
                return Disposables.create()
            }
        }
        
    }
    
    /// 無線LANモードの取得を行います
    struct AIUWifiMode: AIUFlashAirDataRequestProtocol {
        
        typealias Response = String
        
        private let httpRequest = AIUHttpRequest()
        
        func request() -> Observable<String> {
            return Observable<String>.create { observable in
                let requestUrl = AIUFlashAirRequestTypes.CommandCgi.wifiMode.url()
                
                self.httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
                    if let err = err {
                        observable.onError(err)
                        return
                    }
                    
                    guard
                        let data = data,
                        let response = String(data: data, encoding: .utf8) else {
                            let parseErr = AIUHttpRequest.AIUHttpRequestError.parseError
                            observable.onError(parseErr)
                            return
                    }
                    
                    observable.onNext(response)
                    observable.onCompleted()
                })
                return Disposables.create()
            }
        }

    }
    
    /// 制御イメージを取得します
    struct AIUWifiTimeout: AIUFlashAirDataRequestProtocol {
        
        typealias Response = String
        
        private let httpRequest = AIUHttpRequest()
        
        func request() -> Observable<String> {
            return Observable<String>.create { observable in
                let requestUrl = AIUFlashAirRequestTypes.CommandCgi.wifiTimeOutTime.url()
                
                self.httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
                    if let err = err {
                        observable.onError(err)
                        return
                    }
                    
                    guard
                        let data = data,
                        let response = String(data: data, encoding: .utf8) else {
                            let parseErr = AIUHttpRequest.AIUHttpRequestError.parseError
                            observable.onError(parseErr)
                            return
                    }
                    
                    observable.onNext(response)
                    observable.onCompleted()
                })
                return Disposables.create()
            }
        }
        
    }
    
    /// アプリケーション独自情報の取得を行います
    struct AIUApplicationInfo: AIUFlashAirDataRequestProtocol {
        
        typealias Response = String
        
        private let httpRequest = AIUHttpRequest()
        
        func request() -> Observable<String> {
            return Observable<String>.create { observable in
                let requestUrl = AIUFlashAirRequestTypes.CommandCgi.applicationInfo.url()
                
                self.httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
                    if let err = err {
                        observable.onError(err)
                        return
                    }
                    
                    guard
                        let data = data,
                        let response = String(data: data, encoding: .utf8) else {
                            let parseErr = AIUHttpRequest.AIUHttpRequestError.parseError
                            observable.onError(parseErr)
                            return
                    }
                    
                    observable.onNext(response)
                    observable.onCompleted()
                })
                return Disposables.create()
            }
        }
        
    }
    
    /// Card Identifierの取得を行います
    struct AIUCid: AIUFlashAirDataRequestProtocol {
        
        typealias Response = String
        
        private let httpRequest = AIUHttpRequest()
        
        func request() -> Observable<String> {
            return Observable<String>.create { observable in
                let requestUrl = AIUFlashAirRequestTypes.CommandCgi.cid.url()
                
                self.httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
                    if let err = err {
                        observable.onError(err)
                        return
                    }
                    
                    guard
                        let data = data,
                        let response = String(data: data, encoding: .utf8) else {
                            let parseErr = AIUHttpRequest.AIUHttpRequestError.parseError
                            observable.onError(parseErr)
                            return
                    }
                    
                    observable.onNext(response)
                    observable.onCompleted()
                })
                return Disposables.create()
            }
        }

    }
    
    /// Card Identifierの取得を行います
    struct AIUUpdateInfoByTimeStamp: AIUFlashAirDataRequestProtocol {
        
        typealias Response = String
        
        private let httpRequest = AIUHttpRequest()
        
        func request() -> Observable<String> {
            return Observable<String>.create { observable in
                let requestUrl = AIUFlashAirRequestTypes.CommandCgi.updateInfoByTimeStamp.url()
                
                self.httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
                    if let err = err {
                        observable.onError(err)
                        return
                    }
                    
                    guard
                        let data = data,
                        let response = String(data: data, encoding: .utf8) else {
                            let parseErr = AIUHttpRequest.AIUHttpRequestError.parseError
                            observable.onError(parseErr)
                            return
                    }
                    observable.onNext(response)
                    observable.onCompleted()
                })
                return Disposables.create()
            }
        }
        
    }
    
    /// Card Identifierの取得を行います
    struct AIUBlancSectorCount: AIUFlashAirDataRequestProtocol {
        
        typealias Response = String
        
        private let httpRequest = AIUHttpRequest()
        
        func request() -> Observable<String> {
            return Observable<String>.create { observable in
                let requestUrl = AIUFlashAirRequestTypes.CommandCgi.blancSectorCount.url()
                
                self.httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
                    if let err = err {
                        observable.onError(err)
                        return
                    }
                    
                    guard
                        let data = data,
                        let response = String(data: data, encoding: .utf8) else {
                            let parseErr = AIUHttpRequest.AIUHttpRequestError.parseError
                            observable.onError(parseErr)
                            return
                    }
                    
                    observable.onNext(response)
                })
                return Disposables.create()
            }
        }
 
    }
    
    /// フォトシェアモードを有効にします
    struct AIUEnablePhotoShareMode: AIUFlashAirDataRequestProtocol {
        
        typealias Response = String
        
        private let httpRequest = AIUHttpRequest()
        
        func request() -> Observable<String> {
            return Observable<String>.create { observable in
                let requestUrl = AIUFlashAirRequestTypes.CommandCgi.enablePhotoShareMode.url()
                
                self.httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
                    if let err = err {
                        observable.onError(err)
                        return
                    }
                    
                    guard
                        let data = data,
                        let response = String(data: data, encoding: .utf8) else {
                            let parseErr = AIUHttpRequest.AIUHttpRequestError.parseError
                            observable.onError(parseErr)
                            return
                    }
                    if response == "400 Bad Request" {
                        let badRequest = AIUHttpRequest.AIUHttpRequestError.badRequest
                        observable.onError(badRequest)
                        return
                    }
                    
                    observable.onNext(response)
                    observable.onCompleted()
                })
                return Disposables.create()
            }
        }
    }

    /// フォトシェアモードを無効にします
    struct AIUDisablePhotoShareMode: AIUFlashAirDataRequestProtocol {
        
        typealias Response = String
        
        private let httpRequest = AIUHttpRequest()
        
        func request() -> Observable<String> {
            return Observable<String>.create { observable in
                let requestUrl = AIUFlashAirRequestTypes.CommandCgi.disablePhotoShareMode.url()
                
                self.httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
                    if let err = err {
                        observable.onError(err)
                        return
                    }
                    
                    guard
                        let data = data,
                        let response = String(data: data, encoding: .utf8) else {
                            let parseErr = AIUHttpRequest.AIUHttpRequestError.parseError
                            observable.onError(parseErr)
                            return
                    }
                    if response == "400 Bad Request" {
                        let badRequest = AIUHttpRequest.AIUHttpRequestError.badRequest
                        observable.onError(badRequest)
                        return
                    }
    
                    observable.onNext(response)
                    observable.onCompleted()
                })
                return Disposables.create()
            }
        }
        
    }
    
    /// フォトシェアモードのステータスを取得します
    struct AIUStatusPhotoShareMode: AIUFlashAirDataRequestProtocol {
        
        typealias Response = String
        
        private let httpRequest = AIUHttpRequest()
        
        func request() -> Observable<String> {
            return Observable<String>.create { observable in
                let requestUrl = AIUFlashAirRequestTypes.CommandCgi.statusPhotoShareMode.url()
                
                self.httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
                    if let err = err {
                        observable.onError(err)
                        return
                    }
                    
                    guard
                        let data = data,
                        let response = String(data: data, encoding: .utf8) else {
                            let parseErr = AIUHttpRequest.AIUHttpRequestError.parseError
                            observable.onError(parseErr)
                            return
                    }
                    
                    observable.onNext(response)
                    observable.onCompleted()
                })
                return Disposables.create()
            }
        }
        
    }
    
    /// フォトシェアモード専用のSSIDを取得します
    struct AIUSsidPhotoShareMode: AIUFlashAirDataRequestProtocol {
        
        typealias Response = String
        
        private let httpRequest = AIUHttpRequest()
        
        func request() -> Observable<String> {
            return Observable<String>.create { observable in
                let requestUrl = AIUFlashAirRequestTypes.CommandCgi.ssidPhotoShareMode.url()
                
                self.httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
                    if let err = err {
                        observable.onError(err)
                        return
                    }
                    
                    guard
                        let data = data,
                        let response = String(data: data, encoding: .utf8) else {
                            let parseErr = AIUHttpRequest.AIUHttpRequestError.parseError
                            observable.onError(parseErr)
                            return
                    }
                    
                    observable.onNext(response)
                    observable.onCompleted()
                })
                return Disposables.create()
            }
        }
        
    }
    
}
