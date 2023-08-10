//
//  DetailPage.swift
//  ToDoApp
//
//  Created by Öznur Ölçek on 31.07.2023.
//

import UIKit

class DetailPage: UIViewController {

    @IBOutlet weak var titleField: UITextField!    
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var deadlineField: UITextField!
    
    var todo: ToDos?
    
    var viewModel = DetailPageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let td = todo {
            titleField.text = td.title
            descriptionField.text = td.description
            deadlineField.text = td.deadline
        }
    }
    
    @IBAction func updateButtonAct(_ sender: Any) {
        if let id = todo?.id, let title = titleField.text, let description = descriptionField.text, let deadline = deadlineField.text {
            viewModel.update(id: id, title: title, description: description, deadline: deadline)
        }
    }

}
