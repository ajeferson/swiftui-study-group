//
//  ContentView.swift
//  BullsEye
//
//  Created by Alan Paiva on 3/8/20.
//  Copyright © 2020 Alan Paiva. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var guess = 0.5
    @State private var showAlert = false

    private var target = Double.random(in: 0...1)
    private var score: Int {
        Int((1 - abs(target - guess)) * 100)
    }

    var body: some View {
        VStack {
            Text("Put the Bull's Eye as close as you can to: \(Int(target * 100))")
            HStack {
                Text("0")
                Slider(value: $guess)
                Text("100")
            }
            Spacer()
            Button(action: { self.showAlert.toggle() }) {
                Text("Hit me!")
            }
            Spacer()
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Score"),
                message: Text("\(score)")
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
