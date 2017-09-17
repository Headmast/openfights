//
//  OrderEntity.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 17/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import Foundation
import ObjectMapper

public class DepositEntity: Mappable {

    // MARK: - Nested

    private struct Keys {
        public static let depositName = "DepositName"
        public static let depositMinSum = "DepositMinSum"
        public static let depositMinTermRate = "DepositMinTermRate"
        public static let depositMaxTermRate = "DepositMaxTermRate"
        public static let depositCapitalisation = "DepositCapitalisation"
    }

    // MARK: - Properties

    public var depositName: String?
    public var depositMinSum: String?
    public var depositMinTermRate: String?
    public var depositMaxTermRate: String?
    public var depositCapitalisation: String?

    public required convenience init?(map: Map) {
        self.init()
    }

    public func mapping(map: Map) {
        self.depositName <- map[Keys.depositName]
        self.depositMinSum <- map[Keys.depositMinSum]
        self.depositMinTermRate <- map[Keys.depositMinTermRate]
        self.depositMaxTermRate <- map[Keys.depositMaxTermRate]
        self.depositCapitalisation <- map[Keys.depositCapitalisation]
    }
}
