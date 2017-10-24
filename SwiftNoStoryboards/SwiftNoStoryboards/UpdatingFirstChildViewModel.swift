//
//  UpdatingFirstChildViewModel.swift
//  SwiftNoStoryboards
//
//  Created by Alan O'Connor on 23/10/2017.
//  Copyright © 2017 Alan O'Connor. All rights reserved.
//

import Foundation

class UpdatingFirstChildViewModel {
    
    var dataSource = [UpdatingCellViewModel]()
    
    init(numberOfCells: Int) {
        for idx in 0...numberOfCells {
            dataSource.append(UpdatingCellViewModel(title: "CellViewModel \(idx)"))
        }
    }
}
