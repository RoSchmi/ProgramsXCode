//
//  ContentView.swift
//  SwiftCallParentFunctionFromGrandchild
//
//  Created by user on 14.06.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

/*
 Call parent's function from child of a child in SwiftUI

 https://stackoverflow.com/questions/60146921/call-parents-function-from-child-of-a-child-in-swiftui
*/

import SwiftUI


struct ParentFunctionKey: EnvironmentKey {
    static let defaultValue: (() -> Void)? = nil
}

extension EnvironmentValues {
    var parentFunction: (() -> Void)? {
        get { self[ParentFunctionKey.self] }
        set { self[ParentFunctionKey.self] = newValue }
    }
}

struct ContentView: View {
    func parentFunction() {
        print("parentFunction called")
    }

    var body: some View {
        VStack {
            ChildView()
        }
        .environment(\.parentFunction, parentFunction) // set in parent
    }
}

struct ChildView: View {
   @Environment(\.parentFunction) var parentFunction // join in child
    var body: some View {
        VStack {
            Text("child view")
            Button(action: {
                self.parentFunction?() // < use in child
                //self.doNothing() // < use in child
                
            }) {
                Image(systemName: "person")
            }
            Divider()
            SubChildView()
        }
    }
    func doNothing() {}
}

struct SubChildView: View {
    @Environment(\.parentFunction) var parentFunction // join in next subchild
    var body: some View {
        VStack {
            Text("Subchild view")
            Button(action: {
                self.parentFunction?() // use in next subchild
            }) {
                Image(systemName: "person.2")
            }
        }
    }
}

