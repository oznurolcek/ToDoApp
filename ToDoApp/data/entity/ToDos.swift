//
//  ToDos.swift
//  ToDoApp
//
//  Created by Öznur Ölçek on 31.07.2023.
//

import Foundation

class ToDos {
    var id: Int?
    var title: String?
    var description: String?
    var deadline: String?
    
    init() {
    }
    
    init(id: Int, title: String, description: String, deadline: String) {
        self.id = id
        self.title = title
        self.description = description
        self.deadline = deadline
    }
}
