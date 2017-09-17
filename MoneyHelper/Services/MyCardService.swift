//
//  AuthService.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 17/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import Foundation

public class MyCardService {

    public typealias GetCardListCompletion = (BaseResult<[CardEntity]>) -> Void
    public typealias GetDepositListCompletion = (BaseResult<[DepositEntity]>) -> Void
    public typealias GetGoalListCompletion = (BaseResult<[GoalEntity]>) -> Void

    /// Get current user myCard

    public static func cardsRequest(completion: @escaping GetCardListCompletion) {
        let request = CardsRequest()
        request.performAsync { result in
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

    public static func depositsRequest(completion: @escaping GetDepositListCompletion) {
        let request = DepositsRequest()
        request.performAsync { result in
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

    public static func goalsRequest(completion: @escaping GetGoalListCompletion) {
        let request = GoalsRequest()
        request.performAsync { result in
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
