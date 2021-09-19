//
//  MainViewController.swift
//  PassingData
//
//  Created by 山本響 on 2021/09/11.
//

import UIKit
import Lottie

class MainViewController: UIViewController {

    @IBOutlet weak var secondaryLabel: UILabel!
    
    @IBOutlet weak var dataAnimationView: AnimationView!
    
    static let notificationName = Notification.Name("myNotificationName")
    
    var text:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataAnimationView.backgroundColor = .clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        
        dataAnimationView.loopMode = .loop
        dataAnimationView.play()
    }
    
    // Passing Data Between View Controllers with Properties (A → B)
    @IBAction func onButtonATap()
    {
        let vc = SecondaryViewController(nibName: "SecondaryViewController", bundle: nil)
        vc.text = "Passing Data Between View Controllers with Properties (A → B)"
        
        vc.mainViewController = self
        vc.delegate = self
    
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func onUserAction(data: String)
    {
        print("Data received: \(data)")
        secondaryLabel.text = data
        secondaryLabel.isHidden = false
    }
    

    //Passing Data Between View Controllers Using Segues (A → B)&
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // use type casting
        if let vc = segue.destination as? PrepareViewController {
            vc.text = "Passing Data Between View Controllers Using Segues (A → B)"
        
            vc.completionHandler = { data in

                print("Data received: \(data)")
                self.secondaryLabel.text = data
                self.secondaryLabel.isHidden = false
            }
        }
        
        // or use the segue.identifier property
        if segue.identifier == "prepareVC" {
            // Do stuff...
        }
        
    }

}

// Passing Data Back with Delegation
extension MainViewController: SampleDelegate {
    
    func setTextLabel(data: String) {
        print("Data received: \(data)")
        secondaryLabel.text = data
        secondaryLabel.isHidden = false
    }
    
}
