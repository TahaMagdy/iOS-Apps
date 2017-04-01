import UIKit
import AVFoundation






class recordSoundViewController: UIViewController, AVAudioRecorderDelegate {
    
    // Outlets
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    // Do something before loading ViewController in the memory.
    // T; This is called just after this ViewController loads to the memory.
override func
    viewDidLoad() {
        super.viewDidLoad()
               // Do any additional setup after loading the view, typically from a nib.
   
    }
///////////////////////////////////////////////////////
    
    
    // making audio recorder object
    var audioRecorder: AVAudioRecorder!
    
    /////////////////
override func
    viewWillAppear(_ animated: Bool) {
        print("1 viewWillAppear() is called.")
        stopRecordingButton.isEnabled = false
    } // end viewWillApear
override func
    viewDidAppear(_ animated: Bool) {
        print("2 viewDidAppear() is called.")
    } // end viewDidApear
    /////////////////
    
    
    
    
    @IBAction func recordAction(_ sender: Any) {
        // UI
        print("Record")
        recordButton.isEnabled = false
        stopRecordingButton.isEnabled = true
        recordingLabel.text = "Recording..."
        
        // Backend; Recording... ^^
        
        // Getting the directory of the app on the device.
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                          .userDomainMask,
                                                          true)[0] as String
        // recording name
        let recordingName = "recordedVoice.wav"
        // joining the path with recording name
        let pathArray = [dirPath, recordingName]
        // the complete audio file path
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        
        // making an audio session
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord,
                                 with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        // making audio recorder object
        // adding the sound file url to the object
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
        
        
    } // end recordAction
 
    @IBAction func stopRecordingAction(_ sender: Any) {
        
        // UI
        print("Stop Recording")
        recordButton.isEnabled = true
        stopRecordingButton.isEnabled = false
        recordingLabel.text = "Tab To Record"
        
        
        // Backend; Stop recording ...
        audioRecorder.stop()
        let  audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        
        
        
    } // end stopRecordingAction
    
    
    // * We are gonna use this function to call the stopRecording segue.
    // * This is an implementation of a function defined in the adopted delegate.
    // * PRE: The recording is saved (we now the file path also)
    // * This is triggered when the record is finished
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder,
                                         successfully flag: Bool) {
        if flag {
            
            // * performSegue know the destination from storyboard.
            // * here we move the view to the next view
            // * we know where is the next view from the specific seuge (identifier)
            performSegue(withIdentifier: "stopRecordingSegue",
                         sender: audioRecorder.url) // 'sender' contains the URL
            
            print ("Record is finised - file saved - performSegue is fired ^^^")
        } else {
            print("File is not saved!")
        }
    } // end audioRecorderDidFinishRecording 
    
    
    
    
    
    
    
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    // * To prepare the information needed, to provide the next
    //   window with it.
    // * in prepare() we transfer the info next viewCOntroller need
    //   from the current viewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print ("prepare is fired ^^^^^^^")
        
        if segue.identifier == "stopRecordingSegue" {
            
            //  * Makeing an object from the comming viewController class
            //    so that we can provide it with all info it need from
            //    the current viewController class
            let playSoundVC = segue.destination as! PlaySoundViewController
            
            // * Getting the URL saved in 'sender'
            // * sender contains the URL from the segue parameter
            let recordedAudioURL = sender as! URL
            
            
            // * Adding the URL to the object of the next viewController
            playSoundVC.recordedAudioURL = recordedAudioURL
            
        } // end if
    }
    
    
} // end ViewController

