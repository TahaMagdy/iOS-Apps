import UIKit

// Passing Data between views
// ** Using Segues and Code

// * Goal: Send the variable message to the SecondView


// HOW;
// 1. Create a Sague from this view to the SecondView (With modal method)
// 2. Give identifier for the Sague -- which we use it to controll the sague in the code.
// 3. Call performSague() in the action wa want to fire the Sague.

// Sending data to the next view
// 4. Override prepare() and make an object of the next view
// 5. Fill the object with data you want to send from this view to it.

class ViewController: UIViewController {
    let message:String = "Hello My Dear"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    // This action will fire the Segue
    @IBAction func click(_ sender: Any) {
        performSegue(withIdentifier: "moveSegue", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Making an object of the next view
        let nextView = segue.destination as! SecondView
        
        // Send the message from this class -> to the SecondView class
        nextView.value = message
    }
    


}

