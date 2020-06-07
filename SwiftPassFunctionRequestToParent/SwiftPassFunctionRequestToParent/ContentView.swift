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
      
    }
    func setViewBackToNil() {print("I am the Parent")}
}

struct ChildView: View {
    var function: () -> Void
    var body: some View {
        Button(action: {self.function()},
               label: {Text("Button")
        })
    }
    
}
