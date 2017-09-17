//
//  NetworkLayerBaseErrors.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import Foundation

/// Базовые ошибки сервера
enum BaseServerError: LocalizedError {

    case internalServerError
    case badJsonFormat
    case networkError
    case undefind
    case cantMapping

    var errorDescription: String? {
        switch self {
        case .internalServerError:
            return "Localized.undefindError"
        case .networkError:
            return "Localized.internetConnectionError"
        default:
            return "Localized.undefindError"
        }
    }
}

enum BaseCacheError: LocalizedError {
    case cantFindInCache
    case cantLoadFromCache

    var errorDescription: String? {
        switch self {
        case .cantFindInCache:
            return "Cant find in cache"
        case .cantLoadFromCache:
            return "cant load from cache"
        }
    }
}
