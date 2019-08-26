//
//  FlashAirDataRequestProtocol.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/08/25.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation

protocol AIUFlashAirDataRequestProtocol {
    associatedtype Response
    
    func request (callback: ((Response) -> Void)?)
    
}
