//
//  ViewController.swift
//  Test
//
//  Created by Tibor Bodecs on 2019. 12. 15..
//  Copyright © 2019. Tibor Bodecs. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.resultLabel.accessibilityIdentifier = "result-label"
        self.inputField.accessibilityIdentifier = "input-field"
        self.submitButton.accessibilityIdentifier = "submit-button"
    }
    
    @IBAction func submitButtonTouchedAction(_ sender: Any) {
        self.resultLabel.text = self.inputField.text
        self.inputField.text = nil
    }
}

