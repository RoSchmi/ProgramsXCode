//
//  ContentView.swift
//  SwiftActionSheet
//
//  Created by user on 18.05.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showActionSheet = false
    
    var body: some View {
        VStack {
            Button("Show actionsheet") {
                self.showActionSheet = true
            }
            
        }.actionSheet(isPresented: $showActionSheet) {
        ActionSheet(
            title: Text("Actions"),
            message: Text("Available actions"),
            buttons: [
                .cancel {print(self.showActionSheet)},
                .default(Text("Action")),
                .destructive(Text("Delete"))
                ]
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
