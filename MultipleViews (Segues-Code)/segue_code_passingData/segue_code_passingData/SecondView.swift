import UIKit

class SecondView: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    // This will get its value from the sender
    // * The sender will make an object of this class
    // * and will fill this varibale
    var value:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        myLabel.text = value
    }

    

}
