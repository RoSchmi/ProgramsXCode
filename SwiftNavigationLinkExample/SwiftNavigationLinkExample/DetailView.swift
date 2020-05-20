//
//  DetailView.swift
//  SwiftNavigationLinkExample
//
//  Created by user on 18.05.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    var selectedUser : User
    
        var body: some View {
            Text(selectedUser.lastName)
                .font(.largeTitle)
                .foregroundColor(.red)
        }
}


