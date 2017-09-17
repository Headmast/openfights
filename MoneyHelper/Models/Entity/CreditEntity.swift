//
//  OrderEntity.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 17/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import Foundation
import ObjectMapper

public class CreditEntity: Mappable {

    // MARK: - Nested

//    "CreditName": "Наличными",
//    "CreditMinSum": "50000",
//    "CreditMaxSum": "500000",
//    "CreditMinTerm": "3",
//    "CreditMaxTerm": "36",

    private struct Keys {
        public static let creditName = "CreditName"
        public static let creditMinSum = "CreditMinSum"
        public static let creditMaxSum = "CreditMaxSum"
        public static let creditMinTerm = "CreditMinTerm"
        public static let creditMaxTerm = "CreditMaxTerm"
    }

    // MARK: - Properties

    public var creditName: String?
    public var creditMinSum: String?
    public var creditMaxSum: String?
    public var creditMinTerm: String?
    public var creditMaxTerm: String?

    public required convenience init?(map: Map) {
        self.init()
    }

    public func mapping(map: Map) {
        self.creditName <- map[Keys.creditName]
        self.creditMinSum <- map[Keys.creditMinSum]
        self.creditMaxSum <- map[Keys.creditMaxSum]
        self.creditMinTerm <- map[Keys.creditMinTerm]
        self.creditMaxTerm <- map[Keys.creditMaxTerm]
    }
}
