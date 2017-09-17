//
//  AuthenificationRequest.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 17/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import Foundation
import ObjectMapper

public class GoalsRequest: BaseServerRequest<[GoalEntity]> {

    override func createAsyncServerRequest() -> ServerRequest {
        let params = ServerRequestParameter.simpleParams(["test": "test"])
        let request = ServerRequest(method: .get, relativeUrl: ServerPointURLs.goalsList, baseUrl: ServerPointURLs.baseUrl, parameters: params)
        request.cachePolicy = .serverOnly

        return request
    }

    override func handle(serverResponse: ServerResponse, completion: (ResponseResult<[GoalEntity]>) -> Void) {
        let result = {() -> ResponseResult<[GoalEntity]> in
             switch serverResponse.result {
             case .failure(let error):
                return .failure(error)
             case .success(let value, let flag):
                guard let json = value as? NSDictionary else {
                    return .failure(BaseServerError.cantMapping)
                }

                guard let cards = json["Goals"] as? NSDictionary else {
                    return .failure(BaseServerError.cantMapping)
                }

                guard let card = cards["Card"] as? [[String : Any]] else {
                    return .failure(BaseServerError.cantMapping)
                }

                guard let mapped = Mapper<GoalEntity>().mapArray(JSONObject: card) else {
                    return .failure(BaseServerError.cantMapping)
                }
                return .success(mapped, flag)
            }
        }()
        completion(result)
    }
}
