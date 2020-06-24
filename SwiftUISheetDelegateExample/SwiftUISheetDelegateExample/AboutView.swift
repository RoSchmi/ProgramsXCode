//
//  AboutView.swift
//  SwiftUISheetDelegateExample
//
//  Created by user on 23.06.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    @Binding var isPresented: Bool
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                AboutTitleView().padding([.top, .bottom])
                Text("This project is open source")
                    .foregroundColor(.secondary)
                    .font(.footnote)
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)            .navigationBarTitle(Text("About"), displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: close) {
                    Text("Close")
                }.buttonStyle(ActionStyleT50())
            )
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    func close() {
        self.isPresented = false
    }
}
    
struct AboutTitleView: View {
    var body: some View {
        Group {
            HStack {
                Image("About")
                    .resizable()
                    .frame(width: 50.0, height: 50.0)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .padding(.trailing)
                    .accessibility(identifier: "about.logo")
                 }
            
            VStack(alignment: .leading) {
                    Text("People Editor")
                        .font(.title)
                Text("Code was partially taken from the App MQTTAnalyzer by:").multilineTextAlignment(.leading)
                    Text("Philipp Arndt, https://GitHub.com/philipparndt")
                        .multilineTextAlignment(.leading)
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .multilineTextAlignment(.center)
        .padding([.top, .bottom])
    }
}
    

    




