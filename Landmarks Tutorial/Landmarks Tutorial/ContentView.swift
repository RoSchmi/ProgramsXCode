//
//  ContentView.swift
//  Landmarks Tutorial
//
//  Created by user on 08.05.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack
        {
            MapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
        VStack
        {
           Text("Turtle Rock")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)            
            HStack{
            Text("Joshua Tree National Park")
                .font(.subheadline)
                Spacer()
                Text("California")
                .font(.subheadline)            }
        }.padding()
            Spacer()
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
