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
    
    override func viewDidLoad() {
        super.viewDidLoad()

 
        
    }
    
    @IBAction func addButtonAct(_ sender: Any) {
        if let title = titleField.text, let description = descriptionField.text, let deadline = deadlineField.text {
            add(title: title, description: description, deadline: deadline)
        }
    }
    
    func add(title: String, description: String, deadline: String) {
        print("Title: \(title), Description: \(description), Deadline: \(deadline)")
    }
    


}
