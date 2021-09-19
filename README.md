# **[How To: Pass Data Between View Controllers in Swift](https://learnappmaking.com/pass-data-between-view-controllers-swift-how-to/)**  

## Passing Data Between View Controllers with Properties (A → B) 
<img src="https://github.com/YamamotoDesu/PassingData/blob/main/PassingData/Gif/ByProperties.gif" width="300" height="500"> 

### MainViewController 
```swift
class MainViewController: UIViewController
{
    var text:String = ""

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
        @IBAction func onButtonATap()
    {
        let vc = SecondaryViewController(nibName: "SecondaryViewController", bundle: nil)
        vc.text = "Passing Data Between View Controllers with Properties (A → B)"
        
         navigationController?.pushViewController(vc, animated: true)
        
    }
}
```

### SecondaryViewController  
```swift
class SecondaryViewController: UIViewController
{
    var text:String = ""

    @IBOutlet weak var textLabel:UILabel?

    override func viewDidLoad()
    {
        super.viewDidLoad()

        textLabel?.text = text
    }
}
```

## Passing Data Between View Controllers Using Segues (A → B) 
<img src="https://github.com/YamamotoDesu/PassingData/blob/main/PassingData/Gif/BySegues.gif" width="300" height="500"> 

### MainViewController 
```swift
class MainViewController: UIViewController
{
    var text:String = ""

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
      //Passing Data Between View Controllers Using Segues (A → B)&
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // use type casting
        if let vc = segue.destination as? PrepareViewController {
            vc.text = "Passing Data Between View Controllers Using Segues (A → B)"
        
            vc.completionHandler = { data in
                self.secondaryLabel.text = data
            }
        }
        
        // or use the segue.identifier property
        if segue.identifier == "prepareVC" {
            // Do stuff...
        }
        
    }

}
```

### PrepareViewController  
```swift
class PrepareViewController: UIViewController
{
    var text:String = ""

    @IBOutlet weak var textLabel:UILabel?

    override func viewDidLoad()
    {
        super.viewDidLoad()

        textLabel?.text = text
    }
}
``` 
<img src="https://user-images.githubusercontent.com/47273077/133923332-10534280-78f1-49d8-9985-262ad94fb443.png" width="600" height="300"> 

##  Passing Data Back with Properties and Functions (A ← B) 
<img src="https://github.com/YamamotoDesu/PassingData/blob/main/PassingData/Gif/DataBackWithProperties.gif" width="300" height="500"> 

### SecondaryViewController 
```swift
class MainViewController: UIViewController
{
    // Passing Data Back with Properties and Functions (A ← B) ※ Not Ideal
    var mainViewController:MainViewController?
    
    @IBAction func onButtonTap()
    {
        mainViewController?.onUserAction(data: "Passing Data Back with Properties and Functions (A ← B)")
        navigationController?.popToRootViewController(animated: true)
    }
}
```

### MainViewController   
```swift
class MainViewController: UIViewController
{
    @IBOutlet weak var secondaryLabel: UILabel!

    override func viewDidLoad()
    {
        super.viewDidLoad()

        textLabel?.text = text
    }
    
        @IBAction func onButtonATap()
    {
        let vc = SecondaryViewController(nibName: "SecondaryViewController", bundle: nil)
        vc.text = "Passing Data Between View Controllers with Properties (A → B)"
        
        vc.mainViewController = self
        
    }
}
```

## Passing Data Back with Delegation 
<img src="https://github.com/YamamotoDesu/PassingData/blob/main/PassingData/Gif/DataBackWithDelegation.gif" width="300" height="500"> 

### SampleDelegate     
```swift
protocol SampleDelegate: AnyObject {
    func setTextLabel(data: String)
}
``` 

### MainViewController      
```swift
extension MainViewController: SampleDelegate {
    
    func setTextLabel(data: String) {
        secondaryLabel.text = data
    }
    
}
```

### SecondaryViewController       
```swift
class SecondaryViewController: UIViewController {
    // Passing Data Back with Delegation
    weak var delegate: SampleDelegate?
    
    @IBAction func onDelegateButtonTap()
    {
        delegate?.setTextLabel(data: "Passing Data Back with Delegation")
    }
}
```



## Passing Data Back with a Closure  
