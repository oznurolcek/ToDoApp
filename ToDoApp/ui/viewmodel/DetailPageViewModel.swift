//
//  DetailPageViewModel.swift
//  ToDoApp
//
//  Created by Öznur Ölçek on 10.08.2023.
//

import Foundation

class DetailPageViewModel {
    var tdrepo = ToDosDaoRepository()
    
    func update(id: Int, title: String, description: String, deadline: String) {
        tdrepo.update(id: id, title: title, description: description, deadline: deadline)
    }
    
}
