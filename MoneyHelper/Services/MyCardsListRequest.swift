//
//  AuthenificationRequest.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 17/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import Foundation
import ObjectMapper

public class CardsRequest: BaseServerRequest<[CardEntity]> {

    public enum Error: LocalizedError {
        case userBlocked
    }

    private struct Keys {
        // For requst
        public static let phone = "phone"

        // For response
        public static let key = "key"
    }

    override func createAsyncServerRequest() -> ServerRequest {
        let params = ServerRequestParameter.simpleParams(["test": "test"])
        let request = ServerRequest(method: .get, relativeUrl: ServerPointURLs.cardList, baseUrl: ServerPointURLs.baseUrl, parameters: params)
        request.cachePolicy = .serverOnly

        return request
    }

    override func handle(serverResponse: ServerResponse, completion: (ResponseResult<[CardEntity]>) -> Void) {
        let result = {() -> ResponseResult<[CardEntity]> in
             switch serverResponse.result {
             case .failure(let error):
                guard let convertedError = error as? ServerError, convertedError.id == "userBlocked"else {
                    return .failure(error)
                }

                return .failure(Error.userBlocked)
             case .success(let value, let flag):
                guard let json = value as? NSDictionary else {
                    return .failure(BaseServerError.cantMapping)
                }

                guard let cards = json["Cards"] as? NSDictionary else {
                    return .failure(BaseServerError.cantMapping)
                }

                guard let card = cards["Card"] as? [[String : Any]] else {
                    return .failure(BaseServerError.cantMapping)
                }

                guard let mapped = Mapper<CardEntity>().mapArray(JSONObject: card) else {
                    return .failure(BaseServerError.cantMapping)
                }
                return .success(mapped, flag)
            }
        }()
        completion(result)
    }
}
