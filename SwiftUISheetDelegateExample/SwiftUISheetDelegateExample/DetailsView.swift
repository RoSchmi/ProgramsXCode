//
//  DetailsView.swift
//  SwiftUISheetDelegateExample
//
//  Created by user on 24.06.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI

struct DetailsView: View {
    var person: Person
    var body: some View {
        Text("You selected: \(person.firstName) \(person.lastName)")
    }
}
/*
struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
*/
