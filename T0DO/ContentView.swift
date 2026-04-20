//
//  ContentView.swift
//  T0DO
//
//  Created by Sós Dávid on 2026. 03. 31..
//

import SwiftUI

struct ContentView: View {
    @State public var hasBeenStarted: Bool = false
    @State public var NewTask = ""
    @State public var tasks: [ToDoTask] = []
    
    
    var body: some View {
        ZStack{
            if(!hasBeenStarted){
                VStack {
                    Image(systemName: "globe")
                        .font(.title)
                        .foregroundStyle(Color.orange)
                    Text("Welcome to your to-do list")
                        .font(.title)
                        .padding()
                    
                    Button("Start"){
                        withAnimation(.easeInOut(duration: 0.5)) {
                            hasBeenStarted.toggle()
                        }
                        print("toogled starter: \(hasBeenStarted)")
                    }
                    .buttonStyle(NarancsGombStilus())
                    
                }
                .padding()
                .transition(.move(edge: .leading))
            }
            else {
                VStack{
                    List {
                        TextField("Add a task: ", text: $NewTask)
                            .textFieldStyle(.roundedBorder)
                        if(tasks.count != 0){
                            ForEach($tasks) { $task in
                                HStack{
                                    Text(task.title)
                                        .strikethrough(task.isChecked)
                                        .foregroundColor(task.isChecked ? .gray : .primary)
                                    Spacer()
                                    Image(systemName: task.isChecked ? "checkmark.square" : "square")
                                        .onTapGesture {
                                            task.isChecked.toggle()
                                        }
                                }
                            }
                        }
                    }
                    
                    
                    Spacer()
                    
                    HStack(spacing: 10){
                        Button("Add task"){
                            if !NewTask.isEmpty{
                                let NewTaskObject = ToDoTask(title: NewTask)
                                tasks.append(NewTaskObject)
                                NewTask = ""
                            }
                        }
                        .buttonStyle(NarancsGombStilus())
                        
                        Button("Remove last task"){
                            tasks.removeLast()
                        }
                        .buttonStyle(NarancsGombStilus())
                        .disabled(tasks.isEmpty)
                        .opacity(tasks.isEmpty ? 0.5 : 1.0)
                        
                        
                        Button("Back"){
                            withAnimation(.easeInOut(duration: 0.5)) {
                                hasBeenStarted.toggle()
                            }
                            print("toogled starter: \(hasBeenStarted)")
                        }
                        .buttonStyle(NarancsGombStilus())
                    }
                    .transition(.move(edge: .trailing))
                    .padding(.horizontal)
                    .padding(.bottom)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
