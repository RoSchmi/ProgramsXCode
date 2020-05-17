//
//  ContentViewModel.swift
//  SwiftUICommandsTest
//
//  Created by user on 13.05.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI

class CoursesViewModel: ObservableObject {
    @Published var messages = "Messages inside observable object"
    

    
    @Published var boxes:[Box] = [
    Box(id: "0", title: "Good Stuff", imageUrl: "turtlerock-0"),
    Box(id: "1", title: "Tech Stuff", imageUrl: "turtlerock-1"),
    Box(id: "2", title: "Code Stuff", imageUrl: "turtlerock-2"),
    Box(id: "4", title: "Swif Stuff", imageUrl: "turtlerock-3"),
    Box(id: "5", title: "Good Stuff", imageUrl: "turtlerock-0"),
    Box(id: "6", title: "Tech Stuff", imageUrl: "turtlerock-1"),
    Box(id: "7", title: "Code Stuff", imageUrl: "turtlerock-2"),
    Box(id: "8", title: "Swif Stuff", imageUrl: "turtlerock-3")    ]
    
    @Published var courses: [Course] = [
        .init(name: "Course 1"),
        .init(name: "Course 2"),
        .init(name: "Course 3"),
        ]

// []
func fetchCourses() {
    // fetch json and decode and update some arry property
    guard let url = URL(string: apiUrl) else {return}
    // make sure to check error / resp
    URLSession.shared.dataTask(with: url) { (data, resp, err) in
        DispatchQueue.main.async {
            self.courses = try! JSONDecoder().decode([Course].self, from: data!)
        }
        }.resume()
    }
}


