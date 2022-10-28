//
//  SliderUIKitField.swift
//  SliderGameApp
//
//  Created by Anton Saltykov on 28.10.2022.
//

import SwiftUI

struct SliderUIKitField: UIViewRepresentable {

    @Binding var currentValue: Double
    let computeScore: Int

    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()

        slider.minimumTrackTintColor = .orange

        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.didSliderChanged),
            for: .valueChanged
        )

        return slider
    }

    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue / 100)
        uiView.thumbTintColor = .blue.withAlphaComponent(Double(computeScore) / 100)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(sliderValue: $currentValue)
    }
}

extension SliderUIKitField {
    class Coordinator: NSObject {
        @Binding var sliderValue: Double

        init(sliderValue: Binding<Double>) {
            self._sliderValue = sliderValue
        }

        @objc func didSliderChanged(_ sender: UISlider) {
            sliderValue = Double(sender.value) * 100
        }
    }
}

struct SliderUIKitField_Previews: PreviewProvider {
    static var previews: some View {
        SliderUIKitField(currentValue: .constant(50), computeScore: 50)
    }
}
