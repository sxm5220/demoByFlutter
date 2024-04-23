//
//  ContentView.swift
//  watchtest Watch App
//
//  Created by Jerin Jacob on 05/02/23.
//

import SwiftUI

// UI on Apple Watch written in SwiftUI

struct ContentView: View {
    @ObservedObject private var manager = WatchCommunicationManager()
    var body: some View {
        VStack {
            Text(manager.text ?? "👻").font(.headline)
            Spacer()
            HStack{
                Button(action: sendCat) {
                    Text("🐱")
                        .font(.body)
                }
                Button(action: sendDog) {
                    Text("🐶")
                        .font(.body)
                }
            }
            HStack{
                Button(action: sendMouse) {
                    Text("🐭")
                        .font(.body)
                }
                Button(action: sendSnake) {
                    Text("🐍")
                        .font(.body)
                }
            }
        }
        .padding()
    }
    private func sendCat() {
        manager.updateText("🐱")
    }
    private func sendDog() {
        manager.updateText("🐶")
    }
    private func sendMouse() {
        manager.updateText("🐭")
    }
    private func sendSnake() {
        manager.updateText("🐍")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
