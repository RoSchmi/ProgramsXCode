//
//  PublishFixedMessagesCellView.swift
//  SwiftCallbackFromDetailPage
//
//  Created by user on 06.06.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI

struct PublishFixedMessageCellView: View {
    
   // Note: here selectedFixedMessage is @ObservedObject
   // on the child (DetailView) it is @State
   // otherwise we might have a circle and the App crashes
   @ObservedObject var selectedFixedMessage: FixedMessage
    
   @ObservedObject var fixedMessagesModel: FixedMessagesModel
    
    var function_on_grandparent: () -> Void
    
    var body: some View {
        
        NavigationLink(destination:
        PublishFixedMessageDetailView(fixedMessage: selectedFixedMessage, fixedMessagesModel: self.fixedMessagesModel, function_on_parent: {self.printMessageFromParent()}, function_on_grandparent: {self.handOverCommandToGrandparent()})) {
        
            VStack(alignment: .leading) {
                HStack {
                    Text("\(selectedFixedMessage.title)")
                    Spacer()
                }
            }
        }
        .navigationBarTitle("Commands")
        
    }
    func printMessageFromParent() {print("This is message from parent")}
    
    func handOverCommandToGrandparent(){ self.function_on_grandparent()}
}



