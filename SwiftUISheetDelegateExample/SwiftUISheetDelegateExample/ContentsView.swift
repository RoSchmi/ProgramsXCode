//
//  ContentView.swift
//  SwiftUISheetDelegateExample
//
//  Created by user on 22.06.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//


import SwiftUI

enum ContentsSheetType {
    case none
    case about
    case createHost
}


class Person: ObservableObject, Hashable, Identifiable {
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        lhs.id == rhs.id &&
        lhs.firstName == rhs.firstName &&
        lhs.lastName == rhs.lastName &&
        lhs.jobTitle == rhs.jobTitle   }
    
    @Published var id: String
    @Published var firstName: String
    @Published var lastName: String
    @Published var jobTitle: String
    
    
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        // Only id is taken as hash (never the same)
        
    }
    init(id: String, firstName: String, lastName: String, jobTitle: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.jobTitle = jobTitle
    }
}

final class PeopleModel: ObservableObject {
    @Published var people: [Person]
    =  [Person(id: NSUUID().uuidString, firstName: "Hans", lastName: "Kennstenich", jobTitle: "Chief of unkown"),
    Person(id: NSUUID().uuidString, firstName: "Ulrich", lastName: "Nobody",jobTitle: "Director of none"),
    Person(id: NSUUID().uuidString, firstName: "Dietrich", lastName: "Schlüssel",jobTitle: "Master of doors"),      ]
  
}

    struct ContentsView: View {
        
    @EnvironmentObject var model: RootModel
    @ObservedObject var peopleModel =  PeopleModel()
        
    @State var presented = false
    @State var sheetType: ContentsSheetType = .none
        
    @State var isPresentingAddModal = false
        
    @State var selectedPerson: Person?
        
    var body: some View {
         return NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach(peopleModel.people) { contentItem in
                        HostCellView(  person: contentItem, clonePersonHandler: {self.clonePerson(person: $0)})
                    }
                    .onDelete(perform: delete)
                }
            }
        .navigationBarItems(
            leading: Button(action: {self.showAbout()}) {
                Text("About")
            },
            trailing: Button(action: createPerson) {
            Image(systemName: "plus")
            }
            .font(.system(size: 22))
            .buttonStyle(ActionStyleL50())
            .accessibility(identifier: "add.server")
        )
        .navigationBarTitle(Text("People"), displayMode: .inline)
        
        }
        
        .navigationViewStyle(StackNavigationViewStyle())
        .sheet(isPresented: $presented, onDismiss: { self.presented = false}, content: {
            ContentsViewSheetDelegate( model: self.model, peopleModel: self.peopleModel, presented: self.$presented,
                sheetType: self.$sheetType,
                selectedPerson: self.selectedPerson         )}
        )}
           
        func setSelectedPerson(person: Person) {
            selectedPerson = person
            print(person.lastName)
        }
        
        func createPerson() {
            sheetType = .createHost
            selectedPerson = nil
            presented = true
        }
        
        func clonePerson(person: Person) {
            sheetType = .createHost
            selectedPerson = person
            presented = true
        }
        
        func delete(at offsets: IndexSet) {
            peopleModel.people.remove(atOffsets: offsets)
        }
        
        func showAbout() {
            sheetType = .about
            presented = true
        }
        
}


struct ContentsViewSheetDelegate: View {
    let model: RootModel
    let peopleModel: PeopleModel
    
    @Binding var presented: Bool
    
    @Binding var sheetType: ContentsSheetType
    
    var selectedPerson: Person?
    
    var body: some View {
        
        //VStack {
            /*
            Text("Hello from Delegate")
            if self.selectedPerson != nil
            {
                Text("\(self.selectedPerson!.firstName)")
                Text("\(self.selectedPerson!.lastName)")
            }
            */
            Group {
            if self.sheetType == .createHost
            {
                NewHostFormModalView(closeHandler: {self.presented = false },
                root: self.model,
                hosts: self.peopleModel,
                host: createModel())
            }
            else if self.sheetType == .about
            {
                AboutView(isPresented: self.$presented)
            }
            }
       
    
    }
    
    func createModel() -> HostFormModel {
        if let host = selectedPerson {
            return transformHost(source: host)
        }
        else {
            return HostFormModel()
        }
    }
   
}

struct PersonRow: View {
    var person: Person
    var didSelect: (Person) -> ()
   //var didDelete: (Person) -> ()
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
                self.didSelect(self.person)
            }, label: {Text(self.person.lastName)})
            
        }
    }
}

/*
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
                    self.didAddPerson(.init(id: NSUUID().uuidString, firstName: self.firstName, lastName: self.lastName, jobTitle: "Good teacher"))
                }, label: {
                    Text("Add Person")
                })
                Button(action: {
                    self.isPresented = false  // 'isPresented' is Binding
                }, label: {                   // variable bound to                                        // isPresentingAddModal
                    Text("Cancel")
                })
            Spacer()
        }.padding(.all, 16)   // Padding around VStack
        }
    }
*/
    

    
        
