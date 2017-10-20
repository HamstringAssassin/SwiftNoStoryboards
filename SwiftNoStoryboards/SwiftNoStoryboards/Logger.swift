//
//  Logger.swift
//  SwiftNoStoryboards
//
//  Created by Alan O'Connor on 20/10/2017.
//  Copyright © 2017 Alan O'Connor. All rights reserved.
//

import Foundation
import XCGLogger

class Logger {
    let log: XCGLogger = XCGLogger.defaultInstance()
}

public func Log(string: String, level: XCGLogger.LogLevel = .Debug, functionName: StaticString = #function,  fileName: StaticString = #file, lineNumber: Int = #line){
    Logger().log.logln(string, logLevel: level, functionName: functionName, fileName: fileName, lineNumber: lineNumber)
}
