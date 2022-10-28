//
//  SliderView.swift
//  SliderGameApp
//
//  Created by Anton Saltykov on 28.10.2022.
//

import SwiftUI

struct SliderView: View {

    @Binding var currentValue: Double
    let computeScore: Int

    var body: some View {
        HStack(spacing: 10) {
            Text("0")
            SliderUIKitField(
                currentValue: $currentValue,
                computeScore: computeScore
            )
            Text("100")
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(currentValue: .constant(0.5), computeScore: 50)
    }
}
