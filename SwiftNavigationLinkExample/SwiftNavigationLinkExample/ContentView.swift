//
//  ContentView.swift
//  SwiftNavigationLinkExample
//
//  Created by user on 18.05.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI

struct User: Identifiable {
    var id: Int
    var firstName: String
    var lastName: String
}


struct ContentView: View {
    var body: some View {
        let user1 = User(id: 1, firstName: "Piper", lastName: "Chapman Yay")
        let user2 = User(id: 2, firstName: "Gloria", lastName: "Mendoza")
        let users = [user1, user2]

        return NavigationView {
            List(users) {user in
                NavigationLink(destination: DetailView(selectedUser: user)) {
                    UserRow(user: user)
                }
            }
            .navigationBarTitle("Users")        }
            
        }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
