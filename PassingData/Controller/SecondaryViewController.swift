//
//  SecondaryViewController.swift
//  PassingData
//
//  Created by 山本響 on 2021/09/11.
//

import UIKit

class SecondaryViewController: UIViewController {
    
    var text: String = ""
    
    @IBOutlet weak var textLabel: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel?.text = text
    }
    
    
    // Passing Data Back with Properties and Functions (A ← B) ※ Not Ideal
    var mainViewController:MainViewController?
    
    @IBAction func onButtonTap()
    {
        mainViewController?.onUserAction(data: "Passing Data Back with Properties and Functions (A ← B)")
        navigationController?.popToRootViewController(animated: true)
    }
    
    // Passing Data Back with Delegation
    weak var delegate: SampleDelegate?
    
    @IBAction func onDelegateButtonTap()
    {
        delegate?.setTextLabel(data: "Passing Data Back with Delegation")
    }
}
