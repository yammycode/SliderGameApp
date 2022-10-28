//
//  ContentView.swift
//  SliderGameApp
//
//  Created by Anton Saltykov on 28.10.2022.
//

import SwiftUI

struct ContentView: View {

    @State private var targetValue = 0
    @State private var currentValue = 0.0

    var body: some View {
        VStack(spacing: 20) {
            Text("Подвинь слайдер как можно ближе к \(targetValue)")

            SliderView(currentValue: $currentValue, computeScore: computeScore())

            ResultButtonView(computeScore: computeScore()) {
                reset()
            }
            Button("Сбросить") {
                reset()
            }
        }
        .padding()
        .onAppear {
            reset()
        }
    }
}

extension ContentView {

    private func reset() {
        targetValue = Int.random(in: (0...100))
        currentValue = Double.random(in: (0...100))
    }

    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
