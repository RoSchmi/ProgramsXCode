//
//  UserRow.swift
//  SwiftNavigationLinkExample
//
//  Created by user on 19.05.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI


struct UserRow: View {
    var user: User

    var body: some View {
        VStack(alignment: .leading) {
            Text(user.firstName)
                .font(.largeTitle)
            Text(user.lastName)
        }
    }
}

