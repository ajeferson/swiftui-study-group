/// Copyright (c) 2019 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct CoolSlider: UIViewRepresentable {
    final class Coordinator: NSObject {
        var value: Binding<Double>

        init(value: Binding<Double>) {
            self.value = value
        }

        @objc func valueChanged(_ sender: UISlider) {
            value.wrappedValue = Double(sender.value)
        }
    }

    var minValue: Double
    var maxValue: Double
    var color: UIColor
    var opacity: Double

    @Binding var value: Double

    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = Float(minValue)
        slider.maximumValue = Float(maxValue)
        slider.value = Float(value)

        let newColor = color.withAlphaComponent(CGFloat(opacity))
        slider.thumbTintColor = newColor

        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged(_:)),
            for: .valueChanged
        )

        return slider
    }

    func updateUIView(_ uiView: UISlider, context: Context) {
        let newColor = color.withAlphaComponent(CGFloat(opacity))
        uiView.thumbTintColor = newColor
        uiView.value = Float(value)
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(value: $value)
    }
}

struct ContentView: View {
    let targetValue = Int.random(in: 1...100)
    @State var currentValue = 50.0
    @State var showAlert = false

    func computeScore() -> Int {
        let difference = abs(targetValue - Int(currentValue))
        return 100 - difference
    }

    var body: some View {
        VStack {
            Text("Put the Bull's Eye as close as you can to: \(targetValue)")
            HStack {
                Text("0")
                //        Slider(value: $currentValue, in: 1.0...100.0, step: 1.0)
                //          .background(Color.blue)

                //          .opacity(1.0 - Double(computeScore())/100.0)
                CoolSlider(
                    minValue: 1,
                    maxValue: 100,
                    color: .blue,
                    opacity: 1.0 - Double(computeScore())/100,
                    value: $currentValue
                )
                Text("100")
            }.padding(.horizontal)
            Button(action: { self.showAlert = true }) {
                Text("Hit Me!")
            }.alert(isPresented: $showAlert) {
                Alert(title: Text("Your Score"), message: Text(String(computeScore())))
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
