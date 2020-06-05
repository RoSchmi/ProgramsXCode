//
//  ContentView.swift
//  SwiftPeopleListWithDeleteAndModal
//
//  Created by user on 04.06.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

// SwiftPeopleListWithDeleteAndModal

//-SwiftUI: Presenting Modals and Bindings with Callbacks
//-https://www.youtube.com/watch?v=38lllT8-dCo

import SwiftUI

struct Person: Identifiable {
    let id = UUID()
    let firstName: String
    let lastName: String
    let jobTitle: String
}

struct ContentView: View {
    @State var people: [Person] = [
        .init(firstName: "Steve", lastName: "Worker", jobTitle: "Founder of Pear"),
        .init(firstName: "Tim", lastName:  "Waiter", jobTitle: "CEO of Pear")
    ]
    
    @State var isPresentingAddModal = false
    var body: some View {
        NavigationView {
            List(people) {person in
                PersonRow(person: person, didDelete: {p in
                    self.people.removeAll(where: {$0.id == person.id})
                })
                }.navigationBarTitle("People")
            .navigationBarItems(trailing: Button(action: {
                print("Trying to add")
                self.isPresentingAddModal.toggle()
            },
            label: {Text("Add")
            }))
                .sheet(isPresented: $isPresentingAddModal, content: {
                    AddModal(isPresented: self.$isPresentingAddModal)
            })
        }
    }
}
     
struct AddModal: View {
    @Binding var isPresented: Bool
    var body: some View {
        VStack {
            Text("Adding a new Person in this Modal")
            Button(action: {
                self.isPresented = false
            }, label: {
                Text("Cancel")
            })
        }
    }
}

struct PersonRow: View {
    var person: Person
    var didDelete: (Person) -> ()
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text("\(person.firstName) \(person.lastName)")
                .fontWeight(.bold)
            Text(person.jobTitle)
            .fontWeight(.light)
                
            }.layoutPriority(1)
            Spacer()
            Button(action: {
                self.didDelete(self.person)
            }, label: {Text("Delete")})
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
