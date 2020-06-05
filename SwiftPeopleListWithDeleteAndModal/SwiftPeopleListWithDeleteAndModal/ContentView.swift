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
    
    @State var isPresentingAlertModal = false
    @State var isPresentingAddModal = false
    // This variable make that the Modal View is presented (true) or not (false)
    // A button in the NavigationBar toggles this variable
    // This variable has a binding to the Modal Sheet
    
    
    var body: some View {
        NavigationView {
            List(people) {person in
                PersonRow(person: person, didDelete: {p in
                    self.people.removeAll(where: {$0.id == person.id})
                })
                }.navigationBarTitle("People")
                
                .navigationBarItems(leading: Button(action: {
                    print("Showing Alert Message")
                    self.isPresentingAlertModal.toggle()
                },
                label: {Text("Show Alert")
                }),
                trailing: Button(action: {
                print("Trying to add")
                self.isPresentingAddModal.toggle()
            },
            label: {Text("Add")
            }))
                
                
            .alert(isPresented: $isPresentingAlertModal) { Alert(title: Text("Are you sure?"), message: Text("There is no undo"), primaryButton: .destructive(Text("Delete")) { print("Deleting")
            }, secondaryButton: .cancel())
            }
            
            
            .sheet(isPresented: $isPresentingAddModal, content: {
                    AddModal(isPresented: self.$isPresentingAddModal, didAddPerson: {person in
                        print(person.lastName)
                        self.people.append(person)
                    })
            })
            
        }
    }
}
     
struct AddModal: View {
    @Binding var isPresented: Bool
    
    @State var firstName = ""
    @State var lastName = ""
    
    var didAddPerson: (Person) -> ()
    
    var body: some View {
        VStack {
            HStack (spacing: 16) {
                Text("First Name")
                TextField("Enter first Name", text: $firstName)
            }
            HStack (spacing: 16) {
                Text("Last Name")
                TextField("Enter last Name", text: $lastName)
            }
            Text("Adding a new Person in this Modal")
            
            Button(action: {
                self.isPresented = false
                print("\(self.firstName)")
                self.didAddPerson(.init(firstName: self.firstName, lastName: self.lastName, jobTitle: "Good teacher"))
            }, label: {
                Text("Add")
            })
            Button(action: {
                self.isPresented = false
            }, label: {
                Text("Cancel")
            })
        Spacer()
    }.padding(.all, 16)   // Padding around VStack
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
