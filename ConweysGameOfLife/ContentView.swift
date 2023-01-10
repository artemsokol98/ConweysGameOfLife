//
//  ContentView.swift
//  ConweysGameOfLife
//
//  Created by Артем Соколовский on 09.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    let items = 1...50
       let config = [
           GridItem(.adaptive(minimum: 40))
       ]
     
    //var twoDimensionalArray = [[CellState]]()
    
    
    var body: some View {
        
        
       ScrollView {
           LazyVGrid(columns: config, spacing: 20) {
               ForEach(items, id: \.self) { item in
                   Image(systemName: "\(item).square.fill")
                                           .font(.largeTitle)
               }
           }
       }
       .frame(maxHeight: 350)
     
    }
         
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
