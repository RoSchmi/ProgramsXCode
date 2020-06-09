//
//  ContentView.swift
//  SwiftPassFunctionWithParameterToParent
//
//  Created by user on 08.06.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI

class TextsToPrint: ObservableObject {
    @Published var text = "Hallo from observable Object"
}


struct ContentView: View {
    
    @ObservedObject var textsToPrint = TextsToPrint()
    
    @State var statePrintText = "Hallo"
    
    var body: some View {
        ChildView( printFunction_1: { self.printViaFunction_1()},
                   printFunction_2: { self.printViaFunction_2()},
                   printFunction_3: { self.printViaFunction_3(String)},
                  textToPrint: self.textsToPrint,
                  toPrint: $statePrintText )
}
    //ChildView(function: self.setViewBackToNil: {_ in //self.setViewBackToNil(answer: "Roland") })    }
       // ChildView(function: { self.setViewBackToNil(answer: "Roland") })
       // ChildView(function: self.setViewBackToNil(answer: { //self.setViewBackToNil(answer: "")} ))
   
    
    func printViaFunction_1() {
        print(self.statePrintText)
           }
    
    func printViaFunction_2() {
        print(self.textsToPrint.text)
       }
    func printViaFunction_3(theTextParameter: String) {
     print(theTextParameter)
    }
}


struct ChildView: View {
    //var function: (String) -> String
    var printFunction_1: () -> Void
    var printFunction_2: () -> Void
    var printFunction_3: (String) -> String
    
    @ObservedObject var textToPrint = TextsToPrint()
    @Binding var toPrint: String

    var body: some View {
        VStack {
        Button(action: {
            self.toPrint = "This was printed over @Binding property"
            self.printFunction_1()
        }, label: {
            Text("Print over @Binding property")
        })
         Button(action: {
            self.textToPrint.text = "This was Print over @Observable Object"
                   self.printFunction_2()
               }, label: {
                   Text("Print over @Observable Object")
               })
            Button(action: {
                self.printFunction_3("This was Printed with text as Parameter")
               }, label: {
                   Text("Print with text as parameter")
               })
        }
    }
}
 
