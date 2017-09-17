//
//  ServerResponse.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import Foundation
import Alamofire

public class ServerError: LocalizedError {

    private struct Keys {
        public static let id = "id"
        public static let message = "message"
    }

    private(set) var id: String
    private(set) var message: String?

    public init(id: String, message: String?) {
        self.id = id
        self.message = message
    }

    public convenience init?(with json: NSDictionary) {

        guard let guardedId = json[Keys.id] as? String else {
            return nil
        }
        self.init(id: guardedId, message: json[Keys.message] as? String)
    }

    public var errorDescription: String? {
        return self.message
    }
}

class ServerResponse: NSObject {

    var httpResponse: HTTPURLResponse?
    let statusCode: Int
    var notModified: Bool
    var connectionFailed: Bool
    var result: ResponseResult<Any>

    init(dataResponse: DefaultDataResponse?, dataResult: ResponseResult<Data?>) {
        self.httpResponse = dataResponse?.response
        self.statusCode = self.httpResponse?.statusCode ?? 0
        self.notModified = self.statusCode == 304
        self.connectionFailed = false

        self.result = {
            guard let data = dataResult.value else {
                if let err = dataResult.error {
                    return .failure(err)
                } else {
                    return .failure(BaseServerError.undefind)
                }
            }
            do {
                let object = try JSONSerialization.jsonObject(with: data ?? Data(), options: .allowFragments)
                return .success(object, dataResult.isCached)
            } catch {
                return .failure(BaseServerError.internalServerError)
            }
        }()

        // Ошибка в бизнес-логики приложения
        if let dictionary = result.value as? NSDictionary {
            if let errorDict = dictionary["error"] as? NSDictionary {
                if let error = ServerError(with: errorDict) {
                    self.result = .failure(error)
                } else {
                    self.result = .failure(BaseServerError.undefind)
                }
                return
            }
        }

        if let dict = result.value as? NSDictionary {
            if let body = dict["result"] {
                self.result = .success(body, dataResult.isCached)
            }
        }
    }

    /// For creatin Cached responses
    internal override init() {
        self.statusCode = 200
        self.notModified = true
        self.connectionFailed = false
        self.result = .failure(BaseCacheError.cantFindInCache)
        super.init()
    }
}
