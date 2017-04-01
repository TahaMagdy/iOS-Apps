import UIKit

// Goals:
//  * Launch the activiy view -> It's a modal view

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func showActivity(_ sender: Any) {
        
        // * Making an empty image
        // * We need an object to share it using activit view
        let image = UIImage()
        
        // * Making the activity view
        let activiyController = UIActivityViewController.init(activityItems: [image]
            , applicationActivities: nil)
        
        // * Showing the Modal view
        self.present(activiyController, animated: true, completion: nil)
        
        
        
    } // end showActiviyh()j
} // end class
