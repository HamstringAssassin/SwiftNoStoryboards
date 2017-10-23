//
//  UpdatingCellViewModel.swift
//  SwiftNoStoryboards
//
//  Created by Alan O'Connor on 23/10/2017.
//  Copyright © 2017 Alan O'Connor. All rights reserved.
//

import Foundation
import ReactiveCocoa
import enum Result.NoError

class UpdatingCellViewModel {
    
    let title: String
    
    init(title: String) {
        self.title = title
    }
    
    private var _tickProducer: SignalProducer<NSTimeInterval, Result.NoError> {
        return timer(1.0, onScheduler: RACScheduler(priority: RACSchedulerPriorityHigh)).map{ _ in return 1 }
    }
}
