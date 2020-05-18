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

    
struct ContentView: View {
    
    
    @ObservedObject var contentVM = ContentViewModel()
    
    var body: some View {
        
        
        NavigationView {
            List {
                ForEach(contentVM.persons, id: \.self) {selectedPerson in
                    PersonView(person: selectedPerson)}
                .onDelete(perform: delete)
                /*
                    ForEach(persons, id: \.self) {person in
                        PersonView(person: person) }
                    .onDelete(perform: delete)}
                */
            }
            .navigationBarItems(
                leading: Button(action : showAbout) {
                    Text("About")
                },
                trailing: EditButton())
        }
    
    }
    

    func showAbout() {
        var dummy1 = 1
    }
    
    //func delete(at offsets: IndexSet) {
     //   self.showingSheet = true    }
    func delete(at offsets: IndexSet) {
       contentVM.persons.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

