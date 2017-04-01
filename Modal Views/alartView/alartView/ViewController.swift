import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func showAlertView(_ sender: Any) {
        
        // ** Preparing the alert view
                // * Making Alert View
                let alertView = UIAlertController()
                
                // * Any alert view should have title or message or action at least
                alertView.title   = "Alert Title"
                alertView.message = "Alert Message"
                
                // * Making action to add it to the alert
                // * The alert message by default is a button.
                let okAction = UIAlertAction(title: "OK",
                                             // This is how the button will look like
                                             style: UIAlertActionStyle.default)
                    {action in self.dismiss(animated: true, completion: nil) }
                    // The above closure is passing the function dismiss to the UIAlertAction,
                    // that make the moda dismisses itself
                
                alertView.addAction(okAction)
                
        // * Showing Modal View
        self.present(alertView, animated: true, completion: nil)
        
    } // end showAlertView
} // end class

