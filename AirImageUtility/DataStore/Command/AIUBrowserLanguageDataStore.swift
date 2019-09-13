//
//  AIUBrowserLanguageDataStore.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/09/09.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct AIUBrowserLanguageDataStore {
    
    func request() -> Observable<String> {
        let language = AIUFlashAirCommandRequest.AIUBrowserLanguage()
        return language.request()
    }
    
}
