//
//  AddTodoView.swift
//  Todo List
//
//  Created by Nguyen Bui Ly on 10/15/20.
//  Copyright © 2020 Nguyen Bui Ly. All rights reserved.
//

import SwiftUI

struct AddTodoView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: ViewModel
    
    @State var name: String = ""
    @State var target: String = ""
    @State var date: Date = Date()
    @State var priority: Priority = .normal
    
    @State var username: String = ""
    @State var isPrivate: Bool = true
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("TODO")) {
                    TextField("Name", text: self.$name)
                    // .hideKeyboard()
                    TextField("Target", text: self.$target)
                    TextView()
                }
                
                Section {
                    Picker("Priority", selection: self.$priority) {
                        ForEach(Priority.allCases) { priority in
                            Text(priority.title)
                                .foregroundColor(priority.color)
                                .tag(priority)
                        }
                        .navigationBarTitle("Priority")
                    }
                    
                }
                Section {
                    withAnimation(.easeOut(duration: 2)) {
                        DatePicker("Date", selection: self.$date, displayedComponents: .date)
                    }
                }
                
            }
            .navigationBarTitle("Add to do", displayMode: .inline)
            .navigationBarItems(
                leading:
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                    //  self.hideKeyboard()
                }) {
                    Text("Cancel")
                        .foregroundColor(.red)
                }, trailing:
                Button(action: {
                    self.viewModel.addTodo(.init(name: self.name, target: self.target, date: self.date, priority: self.priority))
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save")
                }
                .disabled(self.name.isEmpty || self.target.isEmpty)
            )
        }
    }
    
    func onEditingChanged(_ changed: Bool) {
        print(changed)
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


struct TextView: UIViewRepresentable {
    
    typealias UIViewType = UITextView
    var configuration = { (view: UIViewType) in }
    
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIViewType {
        UIViewType()
    }
    
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<Self>) {
        configuration(uiView)
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct Background<Content: View>: View {
    private var content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        Color.white
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .overlay(content)
    }
}


struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView(viewModel: ViewModel())
    }
}


