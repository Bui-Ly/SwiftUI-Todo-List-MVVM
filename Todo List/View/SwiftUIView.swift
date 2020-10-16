//
//  SwiftUIView.swift
//  Todo List
//
//  Created by Nguyen Bui Ly on 10/15/20.
//  Copyright © 2020 Nguyen Bui Ly. All rights reserved.
//

import SwiftUI

struct SwiftUIView: View {
    
    @State var username: String = ""
    @State var isPrivate: Bool = true
   
        var body: some View {
            NavigationView {
                Form {
                    Section(header: Text("PROFILE")) {
                        TextField("Username", text: $username)
                        Toggle(isOn: $isPrivate) {
                            Text("Private Account")
                        }
                        Text("sfsd")
                    }
                    
                    Section(header: Text("head"), footer: Text("footer")) {
                        Text("text1")
                        Text("Text2")
                    }
                }
                .navigationBarTitle("Settings")
            }
        }
    
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
