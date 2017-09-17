//
//  OrderEntity.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 17/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import Foundation
import ObjectMapper

public class CardEntity: Mappable {

    // MARK: - Nested

    private struct Keys {
        public static let cardName = "CardName"
        public static let cardId = "CardId"
        public static let cardType = "CardType"
        public static let cardPaymentSystem = "CardPaymentSystem"
    }

    // MARK: - Properties

    public var cardName: String?
    public var cardId: String?
    public var cardType: String?
    public var cardPaymentSystem: String?

    public required convenience init?(map: Map) {
        self.init()
    }

    public func mapping(map: Map) {
        self.cardName <- map[Keys.cardName]
        self.cardId <- map[Keys.cardId]
        self.cardType <- map[Keys.cardType]
        self.cardPaymentSystem <- map[Keys.cardPaymentSystem]
    }
}
