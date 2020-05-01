//
//  ContentView.swift
//  TapTapUnicorn
//
//  Created by Benjamin Dirgo on 5/1/20.
//  Copyright © 2020 Benjamin Dirgo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var state: GameState

    var body: some View {
        VStack {
            if state.playing {
                TapButton(currentButton: self.state.currentButton)
                Text("\(state.points)")
                    .font(.system(size:90))
            } else {
                Button("Start Game!") {
                    self.startGame()
                }
                .font(.largeTitle)
            }
        }
    }
    
    func startGame() {
        self.state.startNewGame()
    }
}

struct ContentView_Previews: PreviewProvider {
    static let state = GameState()
    static var previews: some View {
        ContentView()
            .environmentObject(state)
    }
}
