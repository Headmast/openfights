//
//  AuthService.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 17/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import Foundation

/// Collections of services for authorazation
public class MyCardService {

    public typealias GetOrderListCompletion = (BaseResult<[CardEntity]>) -> Void
    
    public struct AuthModel {
        public let accessToken: String
        public let refreshToken: String

        public init(accessToken: String, refershToken: String) {
            self.accessToken = accessToken
            self.refreshToken = refershToken
        }
    }

    /// Send user phone and get back key for next authorization step
    ///
    /// - Parameters:
    ///   - phone: User phone
    public static func cardsRequest(completion: @escaping GetOrderListCompletion) {
        let request = CardsRequest()
        request.performAsync{ result in
            switch result {
            case .failure(let error):
                completion(.error(error))
                break
            case .success(let value, let flag):
                completion(.value(value, flag))
                break
            }
        }
    }
}
