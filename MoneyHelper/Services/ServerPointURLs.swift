//
//  SampleURL.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 17/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import Foundation

class ServerPointURLs {

    public static let baseUrl = "https://api.open.ru/MyCards/1.0.0/"

    // MARK: - Auth urls

    public static let cardList = "MyCardsInfo/cardlist"
    public static let Authorization = "connect/token"
    public static let Shops = "shops"
    public static let ComercialNetwork = "shopgroups"

    public static let orders = "orders"
}
