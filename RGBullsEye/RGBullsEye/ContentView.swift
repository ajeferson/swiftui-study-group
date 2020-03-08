//
//  ContentView.swift
//  Chapter2
//
//  Created by Alan Paiva on 3/8/20.
//  Copyright © 2020 Alan Paiva. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private let rTarget = Double.random(in: 0...1)
    private let bTarget = Double.random(in: 0...1)
    private let gTarget = Double.random(in: 0...1)

    @State var rGuess: Double
    @State var gGuess: Double
    @State var bGuess: Double

    @State private var showAlert = false

    var body: some View {
        VStack {
            HStack {
                VStack {
                    Color(red: rTarget, green: gTarget, blue: bTarget)
                    Text("Match this color")
                }
                VStack {
                    Color(red: rGuess, green: gGuess, blue: bGuess)
                    Text("R: \(Int(rGuess * 255.0)) G: \(Int(gGuess * 255.0)) B: \(Int(bGuess * 255.0))")
                }
            }
            Button(action: { self.showAlert = true }) {
                Text(/*@START_MENU_TOKEN@*/"Hit me!"/*@END_MENU_TOKEN@*/)
            }
            .padding(.vertical)
            ColorSlider(value: $rGuess, textColor: .red)
            ColorSlider(value: $gGuess, textColor: .green)
            ColorSlider(value: $bGuess, textColor: .blue)
        }
        .padding(.vertical)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Your score"),
                message: Text(String(computeScore()))
            )
        }
    }

    func computeScore() -> Int {
        let rDiff = rGuess - rTarget
        let gDiff = gGuess - gTarget
        let bDiff = bGuess - bTarget
        let diff = sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff)
        return Int((1 - diff) * 100 + 0.5)
    }
}

struct ColorSlider: View {
//    var value: Binding<Double>
    @Binding var value: Double
    var textColor: Color

    var body: some View {
        HStack {
            Text("0")
                .foregroundColor(textColor)
            Slider(value: $value)
            Text("255")
                .foregroundColor(textColor)
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // Xcode doesn't have a landscape preview
        ContentView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
