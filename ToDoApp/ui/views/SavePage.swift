//
//  SavePage.swift
//  ToDoApp
//
//  Created by Öznur Ölçek on 31.07.2023.
//

import UIKit

class SavePage: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var deadlineField: UITextField!
    
    var viewModel = SavePageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addButtonAct(_ sender: Any) {
        if let title = titleField.text, let description = descriptionField.text, let deadline = deadlineField.text {
            viewModel.add(title: title, description: description, deadline: deadline)
        }
    }
}
