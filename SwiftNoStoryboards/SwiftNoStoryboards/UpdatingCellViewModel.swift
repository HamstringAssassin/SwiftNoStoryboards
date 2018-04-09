//
//  UpdatingCellViewModel.swift
//  SwiftNoStoryboards
//
//  Created by Alan O'Connor on 23/10/2017.
//  Copyright © 2017 Alan O'Connor. All rights reserved.
//

import Foundation
import ReactiveSwift
import enum Result.NoError

class UpdatingCellViewModel {
    
    let title: String
    
    init(title: String) {
        self.title = title
    }
    
    private var _tickProducer: SignalProducer<TimeInterval, Result.NoError> {
        return SignalProducer.timer(interval:DispatchTimeInterval.seconds(1), on: QueueScheduler.main).map({ (date) in
            return 1
        })
    }
}
