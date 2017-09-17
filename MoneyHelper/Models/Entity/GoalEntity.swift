//
//  OrderEntity.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 17/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import Foundation
import ObjectMapper

public class GoalEntity: Mappable {

    // MARK: - Nested

    private struct Keys {
        public static let goalName = "GoalName"
        public static let goalId = "GoalId"
        public static let goalType = "GoalType"
        public static let goalDate = "GoalDate"
        public static let goalPrice = "GoalPrice"
    }

    // MARK: - Properties

    public var goalName: String?
    public var goalId: String?
    public var goalType: String?
    public var goalDate: String?
    public var goalPrice: String?

    public required convenience init?(map: Map) {
        self.init()
    }

    public func mapping(map: Map) {
        self.goalName <- map[Keys.goalName]
        self.goalId <- map[Keys.goalId]
        self.goalType <- map[Keys.goalType]
        self.goalDate <- map[Keys.goalDate]
        self.goalPrice <- map[Keys.goalPrice]
    }
}
