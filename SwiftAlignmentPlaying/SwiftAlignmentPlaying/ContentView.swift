//
//  ContentView.swift
//  SwiftAlignmentPlaying
//
//  Created by user on 01.06.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
        var body: some View {
            HStack {
                Circle().fill(Color.green)
                Text("Hello World")
                Text("Hello World2")
                Text("Hello World3")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            Circle().fill(Color.green)
            Text("Hello World")
            Text("Hello World2")
            Text("Hello World3")
            Text("Hello World4")        }
        .border(Color.blue)
    }
}
