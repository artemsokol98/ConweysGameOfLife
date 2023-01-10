//
//  Logic.swift
//  ConweysGameOfLife
//
//  Created by Артем Соколовский on 10.01.2023.
//

import Foundation

class Logic {
    //var twoDimensionalArray = [[CellState]]()
    static let shared = Logic()
    
    var arrayColumn = [Point]()
    //var arrayRow = [[Point]]()
    
    func createArrayWithAllAliveCells() {
        
        
        for xCoordinate in 0..<5 {
            for yCoordinate in 0..<5 {
                self.arrayColumn.append(Point(x: xCoordinate, y: yCoordinate, state: CellState.allCases.randomElement()!))
            }
        }

        //var arrayColumn = [Int](repeating: , count: 20)
        //var arrayRow = [[Int]](repeating: arrayColumn, count: 1)
        
        for (index, item) in self.arrayColumn.enumerated() {
            print("\(index) \(item.x) \(item.y) \(item.state)")
        }
        
        compareWithNeighboorCell(point: arrayColumn[12])
        
        
    }
    
    func compareWithNeighboorCell(point: Point) -> Point {
        
        var state: CellState
                
        print("\(point.x) \(point.y)")
        var numberOfAliveNeightboors = 0
        
        let downLeftNeighboor = Direction(x: point.x - 1, y: point.y - 1) //Point(x: point.x - 1, y: point.y - 1, state: point.state)
        let downNeighboor = Direction(x: point.x, y: point.y - 1) //Point(x: point.x, y: point.y - 1, state: point.state)
        let downRightNeighboor = Direction(x: point.x + 1, y: point.y - 1) //Point(x: point.x + 1, y: point.y - 1, state: point.state)
        
        let rightNeighboor = Direction(x: point.x + 1, y: point.y) //Point(x: point.x + 1, y: point.y, state: point.state)
        
        let upRightNeighboor = Direction(x: point.x + 1, y: point.y + 1) //Point(x: point.x + 1, y: point.y + 1, state: point.state)
        let upNeighboor = Direction(x: point.x, y: point.y + 1) //Point(x: point.x, y: point.y + 1, state: point.state)
        let upLeftNeighboor = Direction(x: point.x - 1, y: point.y + 1) //Point(x: point.x - 1, y: point.y + 1, state: point.state)
        
        let leftNeighboor = Direction(x: point.x - 1, y: point.y) //Point(x: point.x - 1, y: point.y, state: point.state)
        
        let neighboors: [Direction] = [
            downLeftNeighboor, downNeighboor, downRightNeighboor, rightNeighboor, upRightNeighboor, upNeighboor, upLeftNeighboor, leftNeighboor
        ]
        
        for item in neighboors {
            
            
            
            var x = item.x
            var y = item.y
            
            if x < 0 { x = 4 } // length of side square - 1
            if x > 4 { x = 0 }
            if y < 0 { y = 4 }
            if y > 4 { y = 0 }
            
            if ((x<0 && y<0)||(x<0 && y>4)||(x>4 && y<0)||(x>4 && y>4)) {
                continue
            }
            
            print(item)
            print((item.x * 5) + item.y) // 5 - length of square
            
            
            
            
            let gotPoint = arrayColumn[(item.x * 5) + item.y]
            print("\(gotPoint.x) \(gotPoint.y) \(gotPoint.state)")
            if gotPoint.state == .alive { numberOfAliveNeightboors += 1 }
        }
        
        if numberOfAliveNeightboors < 2 || numberOfAliveNeightboors > 3 {
            state = .dead
        } else if numberOfAliveNeightboors == 2 && point.state == .dead {
            state = .dead
        } else {
            state = .alive
        }
        
        return Point(x: point.x, y: point.y, state: state)
    }
    
    func getStateFromPoint(point: Point) -> CellState {
        point.state
    }
    
    func generateNewArray(oldArray: [Point]) -> [Point] {
        var newArray = [Point]()
        for item in oldArray {
            newArray.append(compareWithNeighboorCell(point: item))
        }
        return newArray
    }
}
