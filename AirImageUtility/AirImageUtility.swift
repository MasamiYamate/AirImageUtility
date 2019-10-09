//
//  AirImageUtility.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/09/23.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

open class AirImageUtility {
    
    // MARK: ファイル操作関連
    open class file {
        
        private let disposeBag = DisposeBag()
        
        /// ファイルリストを取得します
        /// - Parameter path: 検索したいファイルのパス
        /// - Parameter callback: ファイルリスト
        open func list (with path: String?, callback: ((Result<[AIUFilePathDataModel], Error>) -> Void)?) {
            let fileList = AIUFileUseCase().fileList(with: path)
            fileList.subscribe(onNext: { value in
                callback?(.success(value))
            }, onError: { err in
                callback?(.failure(err))
            }).disposed(by: disposeBag)
        }
        
        /// SDカード内のディレクトリ以外のファイルを取得する
        /// - Parameter path: 検索したいファイルのパス
        /// - Parameter callback: ディレクトリ以外のファイルパス
        open func dataFileList(with path: String?, callback: ((Result<[AIUFilePathDataModel], Error>) -> Void)?) {
            let dataFileList = AIUFileUseCase().dataFileList(with: path)
            dataFileList.subscribe(onNext: { value in
                callback?(.success(value))
            }, onError: { err in
                callback?(.failure(err))
            }).disposed(by: disposeBag)
        }
    }
    
    // MARK: SDカードのステータス関連
    open class status {
        
        private let disposeBag = DisposeBag()
        
        /// FlashAirがアップデートされているか取得します
        /// - Parameter callback: true...アップデート済み , false...アップデートされていない
        open func isUpdated (callback: ((Result<Bool, Error>) -> Void)?) {
            let status = AIUFlashAirStatusUseCase().isUpdated()
            status.subscribe(onNext: { value in
                callback?(.success(value))
            }, onError: { err in
                callback?(.failure(err))
            }).disposed(by: disposeBag)
        }
        
        /// 設定されているSSIDを取得します
        /// - Parameter callback: flashair_e8e0b756a7fb (任意で設定したものなら設定済みのSSID)
        open func getSsid (callback: ((Result<String, Error>) -> Void)?) {
            let status = AIUFlashAirStatusUseCase().ssid()
            status.subscribe(onNext: { value in
                callback?(.success(value))
            }, onError: { err in
                callback?(.failure(err))
            }).disposed(by: disposeBag)
        }
        
        /// FlashAirに設定されているネットワークパスワードを取得します
        /// - Parameter callback: 12345678 (任意で設定したものなら設定済みのパスワード)
        open func getNetworkPassword (callback: ((Result<String, Error>) -> Void)?) {
            let status = AIUFlashAirStatusUseCase().networkPassword()
            status.subscribe(onNext: { value in
                callback?(.success(value))
            }, onError: { err in
                callback?(.failure(err))
            }).disposed(by: disposeBag)
        }
        
        /// MacAddressを取得します
        ///
        /// - Returns: a41731f4d880 FlashAirのMacアドレスの文字列
        open func getMacAddress (callback: ((Result<String, Error>) -> Void)?) {
            let status = AIUFlashAirStatusUseCase().macAddress()
            status.subscribe(onNext: { value in
                callback?(.success(value))
            }, onError: { err in
                callback?(.failure(err))
            }).disposed(by: disposeBag)
        }
        
        /// Browserの言語設定で利用可能な言語を取得します
        /// - Parameter callback: Accept-Language: ja,en-US;q=0.8,en;q=0.6 Accept-Languageパラメータ
        open func getAcceptLanguage (callback: ((Result<String, Error>) -> Void)?) {
            let status = AIUFlashAirStatusUseCase().acceptLanguage()
            status.subscribe(onNext: { value in
                callback?(.success(value))
            }, onError: { err in
                callback?(.failure(err))
            }).disposed(by: disposeBag)
        }
        
        /// ファームウェアバージョンを取得します
        /// - Parameter callback: F19BAW3AW2.00.00 ファームウェアバージョン
        open func getFirmwareVersion (callback: ((Result<String, Error>) -> Void)?) {
            let status = AIUFlashAirStatusUseCase().firmwareVersion()
            status.subscribe(onNext: { value in
                callback?(.success(value))
            }, onError: { err in
                callback?(.failure(err))
            }).disposed(by: disposeBag)
        }
        
        /// 制御イメージを取得します
        /// - Parameter callback: Data 制御イメージのData
        open func getControlImageData (callback: ((Result<Data, Error>) -> Void)?) {
            let imageRequest = AIUFlashAirStatusUseCase().controlImageData()
            imageRequest.subscribe(onNext: { value in
                callback?(.success(value))
            }, onError: { err in
                callback?(.failure(err))
            }).disposed(by: disposeBag)
        }
        
        /// 制御イメージのパスを取得します
        /// - Parameter callback: /DCIM/100__TSB/FA000001.JPG
        open func getControlImagePaht (callback: ((Result<String, Error>) -> Void)?) {
            let imagePath = AIUFlashAirStatusUseCase().controlImagePath()
            imagePath.subscribe(onNext: { value in
                callback?(.success(value))
            }, onError: { err in
                callback?(.failure(err))
            }).disposed(by: disposeBag)
        }
        
        /// 無線LANモードを取得します
        /// - Parameter callback: APPMode
        open func getWifiMode (callback: ((Result<AIUConstants.appMode, Error>) -> Void)?) {
            let status = AIUFlashAirStatusUseCase().wifiMode()
            status.subscribe(onNext: { value in
                callback?(.success(value))
            }, onError: { err in
                callback?(.failure(err))
            }).disposed(by: disposeBag)
        }
        
        /// 無線LANのタイムアウト時間の取得
        /// - Parameter callback: タイムアウト時間(ミリ秒)
        open func getWifiTimeOutTime (callback: ((Result<Int, Error>) -> Void)?) {
            let status = AIUFlashAirStatusUseCase().wifiTimeOutTime()
            status.subscribe(onNext: { value in
                callback?(.success(value))
            }, onError: { err in
                callback?(.failure(err))
            }).disposed(by: disposeBag)
        }
        
        /// アプリケーション独自の情報を取得します
        /// - Parameter callback:
        open func getApplicationInfo (callback: ((Result<String, Error>) -> Void)?) {
            let status = AIUFlashAirStatusUseCase().applicationInfo()
            status.subscribe(onNext: { value in
                callback?(.success(value))
            }, onError: { err in
                callback?(.failure(err))
            }).disposed(by: disposeBag)
        }
        
        /// CIDパラメーターを取得します
        /// - Parameter callback:
        open func getCidParameter (callback: ((Result<String, Error>) -> Void)?) {
            let status = AIUFlashAirStatusUseCase().cidParameter()
            status.subscribe(onNext: { value in
                callback?(.success(value))
            }, onError: { err in
                callback?(.failure(err))
            }).disposed(by: disposeBag)
        }
        
        /// 最後に書き込みが行われたタイムスタンプの取得を行う
        /// - Parameter callback: カード起動からのミリ秒
        open func getLatestWriteTimeStamp (callback: ((Result<Int, Error>) -> Void)?) {
            let status = AIUFlashAirStatusUseCase().latestWriteTimeStamp()
            status.subscribe(onNext: { value in
                callback?(.success(value))
            }, onError: { err in
                callback?(.failure(err))
            }).disposed(by: disposeBag)
        }
        
        /// カードの空き情報を取得します
        /// - Parameter callback: 空き情報データ
        open func getBlancStatus (callback: ((Result<AIUBlancSectorCountDataModel, Error>) -> Void)?) {
            let status = AIUFlashAirStatusUseCase().blancStatus()
            status.subscribe(onNext: { value in
                callback?(.success(value))
            }, onError: { err in
                callback?(.failure(err))
            }).disposed(by: disposeBag)
        }
        
    }
    
    // MARK: フォトシェアモード関連
    open class photoShareMode {
        
        private let disposeBag = DisposeBag()
        
        /// フォトシェアモードを有効にします
        open func enable() {
            _ = AIUFlashAirStatusUseCase().enablePhotoShare()
        }
        
        /// フォトシェアモードを無効にします
        open func disable () {
            _ = AIUFlashAirStatusUseCase().disablePhotoShare()
        }
        
        /// フォトシェアモードのステータスを取得します
        /// - Parameter callback: ステータス文字列
        open func status (callback: ((Result<String, Error>) -> Void)?) {
            let status = AIUFlashAirStatusUseCase().statusPhotoShare()
            status.subscribe(onNext: { value in
                callback?(.success(value))
            }, onError: { err in
                callback?(.failure(err))
            }).disposed(by: disposeBag)
        }
        
        /// フォトシェアモードのSSIDを取得します
        /// - Parameter callback: フォトシェアモードで公開するSSID文字列
        open func ssid (callback: ((Result<String, Error>) -> Void)?) {
            let status = AIUFlashAirStatusUseCase().ssidPhotoShare()
            status.subscribe(onNext: { value in
                callback?(.success(value))
            }, onError: { err in
                callback?(.failure(err))
            }).disposed(by: disposeBag)
        }
    
    }

    // MARK: Config設定操作関連
    open class config {
        
        private let dataStore = AIUConfigDataStore.shared
        
        private let disposeBag = DisposeBag()
        
        func setAppAutoTime (with value: String) {
            dataStore.appendAppAutoTime(with: value)
        }
        
        func setAppInfo (with value: String) {
            dataStore.appendAppInfo(with: value)
        }
        
        func setAppMode (with value: String) {
            dataStore.appendAppInfo(with: value)
        }
        
        func setAppNetworkKey (with value: String) {
            dataStore.appendAppNetworkKey(with: value)
        }
        
        func setAppSsid (with value: String) {
            dataStore.appendAppSsid(with: value)
        }
        
        
        
    }
    
    
    
}
