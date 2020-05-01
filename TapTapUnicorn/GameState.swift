//
//  GameState.swift
//  TapTapUnicorn
//
//  Created by Benjamin Dirgo on 5/1/20.
//  Copyright © 2020 Benjamin Dirgo. All rights reserved.
//

import SwiftUI

class GameState: ObservableObject {
    @Published var playing = false
    @Published var gameButtons = ["🦄", "💩"]
    @Published var points = 0
    @Published var timer: Timer?
    @Published var currentButton = ""
    
    func getRandomButton() -> String {
        let buttonIndex = Int.random(in: 0 ..< gameButtons.count)
        if gameButtons.count > 0 {
            return gameButtons[buttonIndex]
        } else {
            return ""
        }
    }
    
    func gameOver() {
        self.playing = false
    }
    
    func oneGameRound() {
        self.currentButton = getRandomButton()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
            if self.playing {
                if self.currentButton == self.gameButtons[0] {
                    self.gameOver()
                } else {
                    self.oneGameRound()
                }
            }
        }
    }
    
    func startNewGame() {
        self.points = 0
        self.playing = true
        oneGameRound()
    }
    
    func addOnePoint() {
        self.points += 1
    }
    
    func buttonPressed(button: String) {
        if button == gameButtons[0] {
            self.addOnePoint()
            self.timer?.invalidate()
            self.oneGameRound()
        } else {
            self.timer?.invalidate()
            self.gameOver()
        }
    }
}
