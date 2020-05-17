//
//  ContentView.swift
//  SwiftListDeleteExample
//
//  Created by user on 16.05.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI

struct Person : Hashable{
    var name: String
    var sign: String
}

var persons: Person 



struct ContentView: View {
    
    
    @State private var users = [Person( name: "Paul", sign: "..."),Person( name: "Roland", sign: "..."), Person( name: "Clara", sign: "...")
    
    var body: some View {
        NavigationView {
            List {
                
                ForEach(users, id: \.self) {user in
                    Text(user.Person.name)
                    Text(user.sign)                    }
                    .onDelete(perform: delete)
            
            
            }
            .navigationBarItems(trailing: EditButton())
        }
    }


        func delete(at offsets: IndexSet) {
            users.remove(atOffsets: offsets)
        }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
