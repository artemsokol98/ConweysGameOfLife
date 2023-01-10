//
//  OneCellView.swift
//  ConweysGameOfLife
//
//  Created by Артем Соколовский on 10.01.2023.
//

import SwiftUI

struct OneCellView: View {
    @State var width: CGFloat
    @State var state: CellState
    var body: some View {
        Rectangle()
            .fill(chooseColor(cellState: state))
            .frame(width: width, height: width, alignment: .center)
            
    }
    
    
    func chooseColor(cellState: CellState) -> Color {
        switch cellState {
        case .dead:
            return .white
        case .alive:
            return .black
        }
    }
}

struct OneCellView_Previews: PreviewProvider {
    static var previews: some View {
        OneCellView(width: 100, state: .alive)
    }
}
