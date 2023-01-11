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
    
    var lengthOfOneSide = 40
    //var arrayRow = [[Point]]()
    
    func createArrayWithAllAliveCells() {
        
        for xCoordinate in 0..<lengthOfOneSide {
            for yCoordinate in 0..<lengthOfOneSide {
                self.arrayColumn.append(Point(x: xCoordinate, y: yCoordinate, state: CellState.allCases.randomElement()!))
                /*
                var alive = false
                if xCoordinate == 0 && yCoordinate == 2 {
                    alive = true
                }
                if xCoordinate == 1 && yCoordinate == 3 {
                    alive = true
                }
                if xCoordinate == 2 && (yCoordinate == 1 || yCoordinate == 2 || yCoordinate == 3) {
                    alive = true
                }
                var state: CellState
                if alive == true { state = .alive } else { state = .dead}
                
                self.arrayColumn.append(Point(x: xCoordinate, y: yCoordinate, state: state))
                */
            }
        }
        
        for (index, item) in self.arrayColumn.enumerated() {
            print("\(index) \(item.x) \(item.y) \(item.state)")
        }
        //compareWithNeighboorCell(point: arrayColumn[12])

    }
    
    func compareWithNeighboorCell(array: [Point], point: Point) -> Point {
        
        var state: CellState
                
        print(point.x, point.y, point.state)
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
            if ((x<0 && y<0)||(x<0 && y>lengthOfOneSide - 1)||(x>lengthOfOneSide - 1 && y<0)||(x>lengthOfOneSide - 1 && y>lengthOfOneSide - 1)) {
                continue
            }
            
            if x < 0 { x = lengthOfOneSide - 1 } // length of side square - 1
            if x > lengthOfOneSide - 1 { x = 0 }
            if y < 0 { y = lengthOfOneSide - 1 }
            if y > lengthOfOneSide - 1 { y = 0 }

            //print(item)
            //print((x * lengthOfOneSide) + y) // 5 - length of square

            let gotPoint = array[(x * lengthOfOneSide) + y] // numberOfLength
            //print("\(gotPoint.x) \(gotPoint.y) \(gotPoint.state)")
            if gotPoint.state == .alive { numberOfAliveNeightboors += 1 }
        }
        //print(point.x, point.y, point.state, numberOfAliveNeightboors)
        
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
            newArray.append(compareWithNeighboorCell(array: oldArray, point: item))
        }
        print(newArray)
        return newArray
        
    }
}
