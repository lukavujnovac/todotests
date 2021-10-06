//
//  ContentView.swift
//  todotest
//
//  Created by Luka Vujnovac on 04.10.2021..
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var modelData: DBViewModel
    @State private var tasks = [Task]()
    
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13")
    }
}

struct TaskCellView: View {
    
    @State var task: Task
    
    var body: some View {
        HStack{
            Text("\(task.taskName)")
            
            Spacer()
            
            Image(systemName: task.done ?  "checkmark.circle.fill" : "circle")
                .foregroundColor(.green)
        }.onTapGesture {
            task.done.toggle()
        }
    }
}
