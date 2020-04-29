//
//  HeadlineCategoryControllerBuilder.swift
//  Shop
//
//  Created by Sam Mazniker on 28/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class HeadlineCategoryControllerBuilder {
    func buildController() -> HeadlineCategoryViewController {
        var controller = HeadlineCategoryViewController()
        controller = configureViews(controller: controller)
        controller = configureConstraints(controller: controller)
        return controller
    }
    
    private func configureViews(controller: HeadlineCategoryViewController) -> HeadlineCategoryViewController {
        return controller
    }
    
    private func configureConstraints(controller: HeadlineCategoryViewController) -> HeadlineCategoryViewController {
        return controller
    }
}
