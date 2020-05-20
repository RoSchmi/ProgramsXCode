//
//  HostModel.swift
//  MQTTAnalyzer
//
//  Created by user on 19.05.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI


class HostsModel: ObservableObject {
    
    @Published  var persons: [Person] = [
    Person (id: "1", name: "First Host", url: "url"),
    Person (id: "2", name: "Second Host", url:"url"),
    Person (id: "3", name: "Third Host", url: "url"),
    Person (id: "4", name: "Fourth Host", url: "url")]
    
    var parameterString: String
    
    init() {parameterString = "Hallo"}

}





