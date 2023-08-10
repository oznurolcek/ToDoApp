//
//  SavePageViewModel.swift
//  ToDoApp
//
//  Created by Öznur Ölçek on 10.08.2023.
//

import Foundation

class SavePageViewModel {
    var tdrepo = ToDosDaoRepository()
    
    func add(title: String, description: String, deadline: String) {
        tdrepo.add(title: title, description: description, deadline: deadline)
    }
}
