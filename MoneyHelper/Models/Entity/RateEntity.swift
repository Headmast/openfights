//
//  OrderEntity.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 17/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import Foundation
import ObjectMapper

public class RateEntity: Mappable {

    // MARK: - Nested
//    "startDate": "17.09.2017 10:36",
//    "operationType": "B",
//    "rateValue": "60.01",
//    "curCharCode": "USD",
//    "curUnitValue": "1",
//    "minLimit": "10",
//    "department": "018"



    private struct Keys {
        public static let startDate = "startDate"
        public static let operationType = "operationType"
        public static let rateValue = "rateValue"
        public static let curCharCode = "curCharCode"
        public static let curUnitValue = "curUnitValue"
        public static let minLimit = "minLimit"
        public static let department = "department"
    }

    // MARK: - Properties

    public var startDate: String?
    public var operationType: String?
    public var rateValue: String?
    public var curCharCode: String?
    public var curUnitValue: String?
    public var minLimit: String?
    public var department: String?

    public required convenience init?(map: Map) {
        self.init()
    }

    public func mapping(map: Map) {
        self.startDate <- map[Keys.startDate]
        self.operationType <- map[Keys.operationType]
        self.rateValue <- map[Keys.rateValue]
        self.curCharCode <- map[Keys.curCharCode]
        self.curUnitValue <- map[Keys.curUnitValue]
        self.minLimit <- map[Keys.minLimit]
        self.department <- map[Keys.department]
    }
}
