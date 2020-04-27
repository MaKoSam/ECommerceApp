//
//  ControllerBuilder.swift
//  Shop
//
//  Created by Sam Mazniker on 23/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class LaunchControllerBuilder: NSObject {
    func buildDefaultController() -> LaunchViewController{
        let controller = LaunchViewController()
        return controller
    }
}
