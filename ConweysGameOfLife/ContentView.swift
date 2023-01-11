//
//  ContentView.swift
//  ConweysGameOfLife
//
//  Created by Артем Соколовский on 09.01.2023.
//

import SwiftUI

struct ContentView: View {
    /*
    let items = 1...50
       let config = [
           GridItem(.adaptive(minimum: 40))
       ]
     */
    //var twoDimensionalArray = [[CellState]]()
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        //viewModel.generateNewMap(array: viewModel.arrayOfCells)
        HStack(spacing: 0) {
            ForEach(0..<viewModel.lengthOfSide, id: \.self) { numberOfRow in
                //print(numberOfRow)
                VStack(spacing: 0) {
                    ForEach(0..<viewModel.lengthOfSide, id: \.self) { numberOfColumn in
                        //let _ = print("\((numberOfRow * viewModel.lengthOfSide) + numberOfColumn) \(viewModel.arrayOfCells[(numberOfRow * viewModel.lengthOfSide) + numberOfColumn].state)")
                        OneCellView(width: 10, state: viewModel.arrayOfCells[(numberOfRow * viewModel.lengthOfSide) + numberOfColumn].state)
                             .padding(.zero)
                    }  
                }
            }
        }
        
        
        /*
        ForEach(0...viewModel.lengthOfSide, id: \.self) { _ in
        VStack(spacing: 0) {
            ForEach(viewModel.arrayOfCells, id: \.self) { inside in
                HStack(spacing: 0) {
                        OneCellView(width: 10, state: inside.state)
                            .padding(.zero)
                        
                    }
                }
            }
        }
        
        
       ScrollView {
           LazyVGrid(columns: config, spacing: 20) {
               ForEach(items, id: \.self) { item in
                   Image(systemName: "\(item).square.fill")
                                           .font(.largeTitle)
               }
           }
       }
       .frame(maxHeight: 350)
     */
    }
    
    func startGeneration() {
        
    }
         
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
