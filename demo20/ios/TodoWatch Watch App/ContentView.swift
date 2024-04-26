//
//  ContentView.swift
//  TodoWatch Watch App
//
//  Created by 宋晓明 on 2024/4/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: WatchViewModel = WatchViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(
                    Array(viewModel.taskList.enumerated()), id: \.element) { index, task in
                    Button(action: {
                        self.updateTask(index, task.status)
                    }, label: {
                        HStack {
                            Image(systemName: self.getIcon(task.status))
                            Text(task.text).foregroundColor(.white)
                        }
                    })
                    .listRowBackground(task.status ? Color.orange : Color.gray.opacity(0.2))
                }
            }
        }
        .padding()
    }
    
    func updateTask(_ index: Int, _ status: Bool) {
        viewModel.updateTask(index: index, status: !status)
    }
    
    func getIcon(_ status: Bool) -> String {
        if status {
            return "checkmark.circle.fill"
        }
        return "circle"
    }
}

#Preview {
    ContentView()
}
