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
    
    private var numberOfFirstViewModels = MutableProperty<Int>(0)
    
    init(navigationController: UINavigationController?, delegate: UpdatingParentCoordinatorDelegate?) {
        self._navigationController = navigationController
        self._coordinator = delegate
    }
    
    func start() {
        let updatingParentViewController = UpdatingParentViewController(delegate: self)
        _navigationController?.pushViewController(updatingParentViewController, animated: true)
        
    }
    
    private var _tickProducer: SignalProducer<Int, Result.NoError> {
        return timer(1.0, onScheduler: RACScheduler(priority: RACSchedulerPriorityHigh)).map{ _ in return 1 }
    }
    
    
}

extension UpdatingParentCoordinator: UpdatingParentViewControllerDelegate {
    
    func updatingFirstChildViewModelProducer(value: Int) -> SignalProducer<UpdatingFirstChildViewModel, Result.NoError> {
        let viewModel = UpdatingFirstChildViewModel(numberOfCells: value)
        return SignalProducer<UpdatingFirstChildViewModel, Result.NoError>(value: viewModel)
    }
    
    func updatingParentViewControllerEmbedUpdatingFirstViewController(viewController: UpdatingParentViewController) -> UpdatingFirstChildViewController {
        let firstUpdatingViewController = UpdatingFirstChildViewController()
        
        numberOfFirstViewModels <~ _tickProducer.map { [weak self] in
            return (self?.numberOfFirstViewModels.value)! + $0
        }
        
        let viewModelProducer = numberOfFirstViewModels.producer.flatMap(.Latest) { (value) -> SignalProducer<UpdatingFirstChildViewModel, Result.NoError> in
            return self.updatingFirstChildViewModelProducer(value)
        }
        
//        let viewModel = UpdatingFirstChildViewModel(numberOfCells: 10)
        
//        _tickProducer.sampleWith(SignalProducer<UpdatingFirstChildViewModel Result.NoError> )
        
//        firstUpdatingViewController.viewModel = viewModel
        firstUpdatingViewController.bindViewModel(viewModelProducer)
        
        return firstUpdatingViewController
    }
    
    func updatingParentViewControllerEmbedUpdatingSecondViewController(viewController: UpdatingParentViewController) -> UpdatingSecondChildViewController {
        let secondUpdatingViewController = UpdatingSecondChildViewController()
        return secondUpdatingViewController
    }
}
