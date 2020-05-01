//
//  TapButton.swift
//  TapTapUnicorn
//
//  Created by Benjamin Dirgo on 5/1/20.
//  Copyright © 2020 Benjamin Dirgo. All rights reserved.
//

import SwiftUI

struct TapButton: View {
    @EnvironmentObject var state: GameState
    var currentButton: String
    var body: some View {
        Button("\(self.state.currentButton)") {
            self.state.buttonPressed(button: self.currentButton)
        }.font(.system(size:50))
    }
}

struct TapButton_Previews: PreviewProvider {
    static var previews: some View {
        TapButton(currentButton: "")
    }
}
