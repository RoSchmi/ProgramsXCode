//
//  ContentView.swift
//  SwiftPassFunctionRequestToParent
//
//  Created by user on 06.06.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ChildView(function: {self.setViewBackToNil()})
        // The ChildView is called with the function passed as parameter
    }
    // The function is declared in the parent
    func setViewBackToNil() {print("I am the Parent")}
}

struct ChildView: View {
    var function: () -> Void
    // Placeholder for the function to be passed from the parent
    var body: some View {
        Button(action: {self.function()},
               label: {Text("Button")
        })
    }
}
