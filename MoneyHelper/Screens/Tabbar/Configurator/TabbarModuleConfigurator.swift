//
//  TabbarModuleConfigurator.swift
//  MoneyHelper
//
//  Created by Kirill Klebanov on 16/09/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import UIKit

final class TabbarModuleConfigurator {

    // MARK: Internal methods

    func configure() -> TabbarViewController {
        
        let storeVc = BalanceModuleConfigurator().configure()
        let navVC = UINavigationController(rootViewController: storeVc)
        navVC.tabBarItem = UITabBarItem(
            title: "Баланс",
            image: UIImage(named: "icBalance"),
            tag: 1)
        
        let cartVc = GoalsModuleConfigurator().configure()
        let navVC2 = UINavigationController(rootViewController: cartVc)
        navVC2.tabBarItem = UITabBarItem(
            title: "Цели",
            image: UIImage(named: "icGoals"),
            tag: 2)
        
        let oredersVc = RecommendationsModuleConfigurator().configure()
        let navVC3 = UINavigationController(rootViewController: oredersVc)
        navVC3.tabBarItem = UITabBarItem(
            title: "Рекомендации",
            image: UIImage(named: "icRecommendations"),
            tag: 3)
        
        let profileVc = InfromationModuleConfigurator().configure()
        let navVC4 = UINavigationController(rootViewController: profileVc)
        navVC4.tabBarItem = UITabBarItem(
            title: "Информация",
            image: UIImage(named: "icInfromation"),
            tag: 4)

        
        let view = TabbarViewController()
        let presenter = TabbarPresenter()
        let router = TabbarRouter()

        presenter.view = view
        presenter.router = router
        router.view = view
        view.output = presenter

        //view.tabBar.barTintColor = UIColor(named: .TabBarColor)
        view.tabBar.tintColor = UIColor.black
        view.viewControllers = [navVC, navVC2, navVC3, navVC4]
        
        return view
    }

}
