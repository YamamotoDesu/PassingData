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

##  Passing Data Back with Properties and Functions (A ← B) 

## Passing Data Back with Delegation 

## Passing Data Back with a Closure  
