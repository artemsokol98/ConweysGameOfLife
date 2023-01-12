//
//  MainView.swift
//  ConweysGameOfLife
//
//  Created by Артем Соколовский on 09.01.2023.
//

import SwiftUI

struct MainView: View {
   
    @ObservedObject var viewModel = ContentViewModel()
    var body: some View {
        Spacer()
        HStack(alignment: .top, spacing: Constants.lengthBetweenButtons){
            Button(viewModel.buttonName.rawValue) {
                switch viewModel.buttonName {
                case .start:
                    viewModel.startTimer()
                case .stop:
                    viewModel.stopTimer()
                }
            }
            Button("Randomize") {
                viewModel.getNewRandomCells()
            }
        }
        Spacer()
        HStack(spacing: 0) {
            ForEach(0..<viewModel.lengthOfSide, id: \.self) { numberOfRow in
                VStack(spacing: 0) {
                    ForEach(0..<viewModel.lengthOfSide, id: \.self) { numberOfColumn in
                        OneCellView(
                            width: UIScreen.screenWidth / CGFloat(viewModel.lengthOfSide) - 1,
                            state: viewModel.arrayOfCells[(numberOfRow * viewModel.lengthOfSide) + numberOfColumn].state)
                            .padding(.zero)
                    }
                }
            }
        }
        .padding(Constants.widthOfBorderForCells)
        .border(.red, width: Constants.widthOfBorderForCells)
        Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
