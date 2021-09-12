//
//  TertiaryViewController.swift
//  PassingData
//
//  Created by 山本響 on 2021/09/11.
//

import UIKit

class PrepareViewController: UIViewController
{
    var text:String = ""

    @IBOutlet weak var textLabel:UILabel?

    override func viewDidLoad()
    {
        super.viewDidLoad()

        textLabel?.text = text
    }
    
    // Passing Data Back with a Closure
    var completionHandler: ((String) -> Void)?
    
    @IBAction func onClosureButtonTap()
    {
        let result = completionHandler?("Passing Data Back with a Closure")

        print("completionHandler returns... \(result)")
    }
}
