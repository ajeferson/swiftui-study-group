//
//  ColorUISlider.swift
//  RGBullsEye4
//
//  Created by Alan Paiva on 3/30/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct ColorUISlider: UIViewRepresentable {
    final class Coordinator: NSObject {
        var value: Binding<Double>

        init(value: Binding<Double>) {
            self.value = value
        }

        @objc func valueChanged(_ sender: UISlider) {
            value.wrappedValue = Double(sender.value)
        }
    }

    var color: UIColor
    @Binding var value: Double

    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.thumbTintColor = color
        slider.value = Float(value)
        slider.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged(_:)), for: .valueChanged)
        return slider
    }

    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        print("***** Update")
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

struct ColorUISlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorUISlider(color: .red, value: .constant(0.5))
    }
}
