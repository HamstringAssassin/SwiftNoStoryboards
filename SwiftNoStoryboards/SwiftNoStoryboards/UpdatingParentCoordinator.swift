//
//  UpdatingParentCoordinator.swift
//  SwiftNoStoryboards
//
//  Created by Alan O'Connor on 23/10/2017.
//  Copyright © 2017 Alan O'Connor. All rights reserved.
//

import Foundation
import UIKit
import ReactiveCocoa
import enum Result.NoError

protocol UpdatingParentCoordinatorDelegate: class {
}

class UpdatingParentCoordinator {
    
    private var _navigationController: UINavigationController?
    private weak var _coordinator: UpdatingParentCoordinatorDelegate?
    
    init(navigationController: UINavigationController?, delegate: UpdatingParentCoordinatorDelegate?) {
        self._navigationController = navigationController
        self._coordinator = delegate
    }
    
    func start() {
        let updatingParentViewController = UpdatingParentViewController(delegate: self)
        _navigationController?.pushViewController(updatingParentViewController, animated: true)
    }
    
    private var _tickProducer: SignalProducer<NSTimeInterval, Result.NoError> {
        return timer(1.0, onScheduler: RACScheduler(priority: RACSchedulerPriorityHigh)).map{ _ in return 1 }
    }
}

extension UpdatingParentCoordinator: UpdatingParentViewControllerDelegate {
    func updatingParentViewControllerEmbedUpdatingFirstViewController(viewController: UpdatingParentViewController) -> UpdatingFirstChildViewController {
        let firstUpdatingViewController = UpdatingFirstChildViewController()
        let viewModel = UpdatingFirstChildViewModel()
        firstUpdatingViewController.viewModel = viewModel
        return firstUpdatingViewController
    }
    
    func updatingParentViewControllerEmbedUpdatingSecondViewController(viewController: UpdatingParentViewController) -> UpdatingSecondChildViewController {
        let secondUpdatingViewController = UpdatingSecondChildViewController()
        return secondUpdatingViewController
    }
}
