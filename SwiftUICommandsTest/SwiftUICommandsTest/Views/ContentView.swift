//

//SwiftUI MVVM Programming with ObservableObject @Published @ObservedObject

// https://www.youtube.com/watch?v=1IlUBHvgY8Q

//  ContentView.swift
//  SwiftUICommandsTest
//
//  Created by user on 12.05.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI

let apiUrl = "https://api.letsbuildthatapp.com/static/courses.json"

struct Course: Identifiable, Decodable {
    let id = UUID()
    let name: String
}
/*
class CoursesViewModel: ObservableObject {
    @Published var messages = "Messages inside observable object"
    
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
*/


   struct Box: Hashable {
    var  id: String
    var title: String
    var imageUrl: String
    
}

struct BoxView: View {
   var box: Box
    var body: some View {
        HStack {
            Image("\(box.imageUrl)")
            .resizable()
            .cornerRadius(12)
                .frame(width: 50, height: 50)
                Text(box.title)
                    .font(.subheadline)
                    .fontWeight(.bold)
            Spacer()
            
        }.background(LinearGradient(gradient: Gradient(colors:  [Color(.darkGray), Color(.lightGray)]), startPoint: .leading, endPoint: .trailing))
            //.buttonStyle(style: ActionStyleL50)
        
        
    }
}



struct ContentView: View {
    /*
    let boxes:[Box] = [
        Box(id: "0", title: "Good Stuff", imageUrl: "turtlerock-0"),
        Box(id: "1", title: "Tech Stuff", imageUrl: "turtlerock-1"),
        Box(id: "2", title: "Code Stuff", imageUrl: "turtlerock-2"),
        Box(id: "4", title: "Swif Stuff", imageUrl: "turtlerock-3"),
        Box(id: "5", title: "Good Stuff", imageUrl: "turtlerock-0"),
        Box(id: "6", title: "Tech Stuff", imageUrl: "turtlerock-1"),
        Box(id: "7", title: "Code Stuff", imageUrl: "turtlerock-2"),
        Box(id: "8", title: "Swif Stuff", imageUrl: "turtlerock-3")    ]
    */
    
    @ObservedObject var coursesVM = CoursesViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading){
            /*
            ScrollView {
                Text(coursesVM.messages)
                
                ForEach (coursesVM.courses) {course in
                    Text(course.name)
                }
              */
                
                List {
                    
                    ForEach(coursesVM.boxes, id: \.self) { box in
                    BoxView(box: box)                }
                }
            
                
            /*
                ScrollView {
                    Section {
                
                    ForEach(coursesVM.boxes, id: \.self) { box in
                        BoxView(box: box)
                 
                }.padding(20)
                        
                    }
                    
               */
            }.navigationBarTitle("Courses")
                .navigationBarItems(trailing: Button(action: { print("Fetching json data")
                    self.coursesVM.fetchCourses()
             
                    
                }, label: { Text("Fetch Courses")
            }))
 
        }
    }
    func delete(at offsets: IndexSet) {coursesVM.boxes.remove(atOffsets: offsets)}}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
