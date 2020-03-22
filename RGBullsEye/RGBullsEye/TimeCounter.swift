//
//  TimeCounter.swift
//  RGBullsEye
//
//  Created by Alan Paiva on 3/22/20.
//  Copyright © 2020 Alan Paiva. All rights reserved.
//

import Foundation
import Combine

class TimeCounter: ObservableObject {
    var timer: Timer?
    @Published var counter = 0

    init() {
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateCounter),
            userInfo: nil,
            repeats: true
        )
    }

    @objc func updateCounter() {
        counter += 1
    }

    func killTimer() {
        timer?.invalidate()
        timer = nil
    }
}
