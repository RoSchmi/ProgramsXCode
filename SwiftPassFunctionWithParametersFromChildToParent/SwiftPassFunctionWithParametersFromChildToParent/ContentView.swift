//
//  ContentView.swift
//  SwiftPassFunctionWithParametersFromChildToParent
//
//  Created by user on 09.06.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//
import SwiftUI

struct ChildView: View {
    var function: (String, String) -> Void

    @State private var value1 = "Hello World,"
    @State private var value2 = "Hello Moon"
    
    var body: some View {
        Button(action: {
            self.function(self.value1, self.value2)
        }, label: {
            Text("Button")
        })
    }
}

struct ContentView: View {
    var body: some View {
        ChildView { self.printMessagesFromChild(myStringParameter_1: $0, myStringParameter_2: $1)}
    }

    func printMessagesFromChild(myStringParameter_1: String, myStringParameter_2: String) {
        print("I am the parent: \(myStringParameter_1) \(myStringParameter_2)")
    }
}

