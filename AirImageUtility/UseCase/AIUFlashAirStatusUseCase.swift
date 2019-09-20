//
//  AIUFlashAirStatusUseCase.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/09/20.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct AIUFlashAirStatusUseCase {
    
    private let disposeBag = DisposeBag()
    
    /// アップデートされているか否か
    ///
    /// - Returns: true...アップデート済み , false...アップデートされていない
    func isUpdated () -> Observable<Bool> {
        return Observable<Bool>.create({ observable in
            let updateStatus = AIUUpdateInfoDataStore().request()
            updateStatus.subscribe(onNext: { value in
                switch value {
                case 1:
                    observable.onNext(true)
                default:
                    observable.onNext(false)
                }
                observable.onCompleted()
            }, onError: { err in
               observable.onError(err)
            }, onCompleted: {
                observable.onCompleted()
            }).disposed(by: self.disposeBag)
            return Disposables.create()
        })
    }
    
    /// FlashAirに設定されているSSIDを取得します
    ///
    /// - Returns: flashair_e8e0b756a7fb (任意で設定したものなら設定済みのSSID)
    func ssid () -> Observable<String> {
        return AIUSsidDataStore().request()
    }
    
    /// FlashAirに設定されているネットワークパスワードを取得します
    ///
    /// - Returns: 12345678 (任意で設定したものなら設定済みのパスワード)
    func networkPassword () -> Observable<String> {
        return AIUNetworkPasswordDataStore().request()
    }
    
    /// MacAddressを取得します
    ///
    /// - Returns: a41731f4d880 FlashAirのMacアドレスの文字列
    func macAddress () -> Observable<String> {
        return AIUMacAddressDataStore().request()
    }
    
    /// Browserの言語設定で利用可能な言語を取得します
    ///
    /// - Returns: Accept-Language: ja,en-US;q=0.8,en;q=0.6 Accept-Languageパラメータ
    func acceptLanguage () -> Observable<String> {
        return AIUBrowserLanguageDataStore().request()
    }
    
    /// ファームウェアバージョンを取得します
    ///
    /// - Returns: F19BAW3AW2.00.00 ファームウェアバージョン
    func firmwareVersion () -> Observable<String> {
        return AIUFirmwareVersionInfoDataStore().request()
    }
    
    /// 制御イメージを取得します
    ///
    /// - Returns: Data 制御イメージ
    func controlImageData () -> Observable<Data> {
        return Observable<Data>.create { observable in
            let controlImage = AIUControlImageDataStore().request()
            controlImage.subscribe(onNext: { value in
                let fileData = AIUFileDataStore(filePath: value).request()
                fileData.subscribe(onNext: { data in
                    observable.onNext(data)
                    observable.onCompleted()
                }, onError: { err in
                    observable.onError(err)
                }, onCompleted: {
                    observable.onCompleted()
                }).disposed(by: self.disposeBag)
            }, onError: { err in
                observable.onError(err)
            }, onCompleted: {
                observable.onCompleted()
            }).disposed(by: self.disposeBag)
            return Disposables.create()
        }
    }
    
    /// 制御イメージのパスを取得します
    ///
    /// - Returns: /DCIM/100__TSB/FA000001.JPG
    func controlImagePath () -> Observable<String> {
        return AIUControlImageDataStore().request()
    }
    
    /// 無線LANモードを取得します
    ///
    /// - Returns: APPMode
    func wifiMode () -> Observable<AIUConstants.appMode> {
        return Observable<AIUConstants.appMode>.create { observable in
            let wifiMode = AIUWifiModeDataStore().request()
            wifiMode.subscribe(onNext: { value in
                let mode = AIUConstants.appMode.translate(with: value)
                observable.onNext(mode)
                observable.onCompleted()
            }, onError: { err in
                observable.onError(err)
            }, onCompleted: {
                observable.onCompleted()
            }).disposed(by: self.disposeBag)
            return Disposables.create()
        }
    }
    
    /// 無線LANのタイムアウト時間の取得
    ///
    /// - Returns: ミリ秒
    func wifiTimeOutTime () -> Observable<Int> {
        return Observable<Int>.create { observable in
            let timeOut = AIUWifiTimeoutDataStore().request()
            timeOut.subscribe(onNext: { value in
                guard let value = Int(value) else {
                    // TODO: Error後でかけ
                    return
                }
                observable.onNext(value)
                observable.onCompleted()
            }, onError: { err in
                observable.onError(err)
            }, onCompleted: {
                observable.onCompleted()
            }).disposed(by: self.disposeBag)
            return Disposables.create()
        }
    }
    
}
