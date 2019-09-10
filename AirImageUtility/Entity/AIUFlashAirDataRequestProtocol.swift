//
//  FlashAirDataRequestProtocol.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/08/25.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol AIUFlashAirDataRequestProtocol {
    associatedtype Response
    
    func request () -> Observable<Response>
    
}
