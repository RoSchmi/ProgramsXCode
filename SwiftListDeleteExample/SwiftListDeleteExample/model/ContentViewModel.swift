//
//  ContentViewModel.swift
//  SwiftListDeleteExample
//
//  Created by user on 17.05.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    
    
    @Published var persons:[Person] = [
    Person(id: "0", name: "Roland", sign: "!!!"),
    Person(id: "1", name: "Monika", sign: "!!!"),
    Person(id: "2", name: "Klaus", sign: "!!!"),
    Person(id: "3", name: "Dagmar", sign: "!!!")]
 
}


