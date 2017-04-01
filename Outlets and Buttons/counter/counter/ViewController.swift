import UIKit

// * Goals:
//    1. Making UI components with code.
//    2. Adding them to the view
//    3. connecting buttons with actions
//    4. label as outlet (outlet from the code to GUI)

class ViewController: UIViewController {
    
        var count = 0
    
        // * This is becuase the label in the viewDidLoad is local to its scope.
        //   and Increment() will not see that label.
        // * So we make sharedLabel will be between the Increment and viewDidLoad.
        // *
        var sharedLabel:UILabel!
    

override func viewDidLoad() {
        super.viewDidLoad()
    
// OUTLETS AND ACTIONS
    
        // 1 Making a label
        let label = UILabel()
        label.frame = CGRect.init(x: 150, y: 150, width: 60, height: 60)
        label.text = "0"
        
        self.sharedLabel = label
        self.view.addSubview(label)
    
        
        // 2 Making a button
        let button = UIButton()
        button.frame = CGRect.init(x: 150, y: 250, width: 60, height: 60)
        // You'll not see it becuase it has no color
        button.setTitle("Click", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        self.view.addSubview(button)
    
        // Making action over the button
        button.addTarget(self, action: #selector(ViewController.Increment),
                         for: UIControlEvents.touchUpInside )
        

    } // end viewDidLoad()

    
    func Increment() {
        self.count += 1
        self.sharedLabel.text = "\(count)"
    }
} // end viewControllar

