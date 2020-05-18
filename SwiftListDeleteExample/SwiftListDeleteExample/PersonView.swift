//
//  PersonView.swift
//  SwiftListDeleteExample
//
//  Created by user on 18.05.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI

struct PersonView: View {
var person: Person
 var body: some View {
     HStack {
        
        Text(person.name)
         
            Spacer()
        Text(person.sign)
                 .font(.subheadline)
                 .fontWeight(.bold)
        
         
     }.background(LinearGradient(gradient: Gradient(colors:  [Color(.darkGray), Color(.lightGray)]), startPoint: .leading, endPoint: .trailing))
    }
}


