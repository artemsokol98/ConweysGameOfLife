//
//  ContentViewModel.swift
//  ConweysGameOfLife
//
//  Created by Артем Соколовский on 11.01.2023.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    let logic = Logic.shared
    var timer: Timer!
    @Published var buttonName: ButtonName = .start
    @Published var arrayOfCells: [Point]
    @Published var lengthOfSide: Int
    
    init() {
        arrayOfCells = logic.createArrayWithAllAliveCells()
        lengthOfSide = logic.lengthOfOneSide
    }
    
    func getNewRandomCells() {
        arrayOfCells = logic.createArrayWithAllAliveCells()
    }
    
    func startTimer() {
        buttonName = .stop
        self.timer = Timer.scheduledTimer(withTimeInterval: Constants.oneStepTimeInSeconds, repeats: true) { [self] _ in
            arrayOfCells = logic.generateNewArray(oldArray: arrayOfCells)
        }
    }
    
    func stopTimer() {
        buttonName = .start
        timer.invalidate()
    }
}
