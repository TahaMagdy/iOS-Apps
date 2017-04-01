import UIKit

//  * There are 2 methods of View Presentation {Navigation & Modal}.
//  * Modal Views [Temporary Views]
//  * Navigation: stack views and you can retrace them
//  * Modal: It is a temporary views or alart views
//  * Make a second way to view a Controller {Modally Presented View}
//  * It slides up from bottom of the secreen
//  * I doesn't have to fill the hole screen, it can be qurater of half.

       // * This will desmiss the Modal view (ImagePicker|AlertView|ActivityView)
       //self.dismiss(animated: true, completion: nil)

// Goals:
//  * Making a modal view to open the images picker

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    ////////////////////////////////////////

    @IBAction func imagePicker(_ sender: Any) {

        // making imagePickerController
        let imagePicker = UIImagePickerController()
        // * Showing modal view
        self.present(imagePicker, animated: true, completion: nil)
        
       // * This will desmiss the Modal view
       //self.dismiss(animated: true, completion: nil)
        
    } // end imagePicker()
} // end Class

