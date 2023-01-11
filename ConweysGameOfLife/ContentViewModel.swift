//
//  ContentViewModel.swift
//  ConweysGameOfLife
//
//  Created by Артем Соколовский on 11.01.2023.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    let logic = Logic.shared
    @Published var arrayOfCells: [Point]
    @Published var lengthOfSide: Int
    
    
    init() {
        logic.createArrayWithAllAliveCells()
        arrayOfCells = logic.arrayColumn
        lengthOfSide = logic.lengthOfOneSide
        Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { [self] _ in
            generateNewMap(array: self.arrayOfCells)
        }
    }
    
    func generateNewMap(array: [Point]) {
        var newArray = array
        print(newArray)
        arrayOfCells = logic.generateNewArray(oldArray: newArray)
         
    }
    
    
}
