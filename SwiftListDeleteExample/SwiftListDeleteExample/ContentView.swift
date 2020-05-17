//
//  ContentView.swift
//  SwiftListDeleteExample
//
//  Created by user on 16.05.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI

struct Person : Hashable{
    var id: String
    var name: String
    var sign: String
}

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
    
struct ContentView: View {
    /*
    @State var persons:[Person] = [
    Person(id: "0", name: "Roland", sign: "!!!"),
    Person(id: "1", name: "Monika", sign: "!!!"),
    Person(id: "2", name: "Klaus", sign: "!!!"),
    Person(id: "3", name: "Dagmar", sign: "!!!")]
    */
   
    @ObservedObject var contentVM = ContentViewModel()
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(contentVM.persons, id: \.self) {person in
                    PersonView(person: person) }
                .onDelete(perform: delete)                    /*
                    ForEach(persons, id: \.self) {person in
                        PersonView(person: person) }
                    .onDelete(perform: delete)
                    */
            }
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func delete(at offsets: IndexSet) {
        contentVM.persons.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

