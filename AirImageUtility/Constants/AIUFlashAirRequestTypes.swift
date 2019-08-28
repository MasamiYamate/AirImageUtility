//
//  AIUFlashAirRequestTypes.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/08/23.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation

class AIUFlashAirRequestTypes {
    
    static let baseUrl: String = "http://flashair/"
    static let command: String = "command.cgi?"
    static let config: String = "config.cgi?"
    static let thumbnail: String = "thumbnail.cgi?"
    
    enum CommandCgi: String {
        case fileList = "op=100"
        case fileCount = "op=101"
        case updateInfo = "op=102"
        case ssid = "op=104"
        case networkPassword = "op=105"
        case macAddress = "op=106"
        case browserLanguage = "op=107"
        case firmwareVersionInfo = "op=108"
        case controlImage = "op=109"
        case wifiMode = "op=110"
        case wifiTimeOutTime = "op=111"
        case applicationInfo = "op=117"
        case isUpload = "op=118"
        case cid = "op=120"
        case updateInfoByTimeStamp = "op=121"
        case shareMemoryGetData = "op=130"
        case shareMemoryWriteData = "op=131"
        case blancSectorCount = "op=140"
        case sdInterfaceIO = "op=190"
        case enablePhotoShareMode = "op=200"
        case disablePhotoShareMode = "op=201"
        case statusPhotoShareMode = "op=202"
        case ssidPhotoShareMode = "op=203"
        case webDavInfo = "op=220"
        case timeZone = "op=221"
        
        func url () -> String {
            return String(format: "%@%@%@",
                          arguments: [
                            AIUFlashAirRequestTypes.baseUrl,
                            AIUFlashAirRequestTypes.command,
                            self.rawValue])
        }
    }
    
    enum ConfigCgi: String {
        case appAutoTime = "APPAUTOTIME"
        case appInfo = "APPINFO"
        case appMode = "APPMODE"
        case appNetworkKey = "APPNETWORKKEY"
        case appSsid = "APPSSID"
        case brgNetworkKey = "BRGNETWORKKEY"
        case brgSsis = "BRGSSID"
        case ciPath = "CIPATH"
        case clearMasterCode = "CLEARCODE"
        case setMasterCode = "MASTERCODE"
        case setTimeZone = "TIMEZONE"
        case setWebDav = "WEBDAV"
        
        func parameter (with value: String) -> String {
            return String(format: "%@=%@", arguments: [
                    self.rawValue,
                    value
                ])
        }
        
        static func url (parms: [String]) -> String {
            var requestUrl = String(format: "%@%@", arguments: [
                AIUFlashAirRequestTypes.baseUrl,
                AIUFlashAirRequestTypes.config
                ])
            parms.forEach {
                requestUrl = String(format: "%@&%@", arguments: [
                    requestUrl,
                    $0
                    ])
            }
            return requestUrl
        }
    }
    
    enum ThumbnailCgi {
        case get
        
        func url (imagePath: String) -> String {
            return String(format: "%@%@%@", arguments: [
                AIUFlashAirRequestTypes.baseUrl,
                AIUFlashAirRequestTypes.thumbnail,
                imagePath
                ])
        }
    }
    
}
