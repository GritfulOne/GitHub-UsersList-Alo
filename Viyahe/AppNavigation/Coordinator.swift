//
//  Coordinator.swift
//  Viyahe
//
//  Created by Gino Simon Alo on 5/4/21.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }

    func start()
}


