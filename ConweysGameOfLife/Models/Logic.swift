//
//  Logic.swift
//  ConweysGameOfLife
//
//  Created by Артем Соколовский on 10.01.2023.
//

import Foundation

class Logic {
    static let shared = Logic()
    
    var lengthOfOneSide = Constants.lengthOfSide
    
    func createArrayWithCells() -> [Point] {
        var arrayOfColumn = [Point]()
        for xCoordinate in 0..<lengthOfOneSide {
            for yCoordinate in 0..<lengthOfOneSide {
                arrayOfColumn.append(Point(x: xCoordinate, y: yCoordinate, state: CellState.allCases.randomElement()!))             
            }
        }
        return arrayOfColumn
    }
    
    func compareWithNeighboorCell(array: [Point], point: Point) -> Point {
        var state: CellState
        var numberOfAliveNeightboors = 0
        
        let downLeftNeighboor = Direction(x: point.x - 1, y: point.y - 1)
        let downNeighboor = Direction(x: point.x, y: point.y - 1)
        let downRightNeighboor = Direction(x: point.x + 1, y: point.y - 1)
        let rightNeighboor = Direction(x: point.x + 1, y: point.y)
        
        let upRightNeighboor = Direction(x: point.x + 1, y: point.y + 1)
        let upNeighboor = Direction(x: point.x, y: point.y + 1)
        let upLeftNeighboor = Direction(x: point.x - 1, y: point.y + 1)
        let leftNeighboor = Direction(x: point.x - 1, y: point.y)
        
        let neighboors: [Direction] = [
            downLeftNeighboor, downNeighboor, downRightNeighboor, rightNeighboor, upRightNeighboor, upNeighboor, upLeftNeighboor, leftNeighboor
        ]
        
        for item in neighboors {
            var x = item.x
            var y = item.y
            
            if ((x<0 && y<0)||(x<0 && y>=lengthOfOneSide)||(x>=lengthOfOneSide && y<0)||(x>=lengthOfOneSide && y>=lengthOfOneSide)) {
                continue
            }
            
            if x < 0 { x = lengthOfOneSide - 1 }
            if x >= lengthOfOneSide { x = 0 }
            if y < 0 { y = lengthOfOneSide - 1 }
            if y >= lengthOfOneSide { y = 0 }

            let gotPoint = array[(x * lengthOfOneSide) + y]
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

    func generateNewArray(oldArray: [Point]) -> [Point] {
        var newArray = [Point]()
        for item in oldArray {
            newArray.append(compareWithNeighboorCell(array: oldArray, point: item))
        }
        return newArray
    }
}
