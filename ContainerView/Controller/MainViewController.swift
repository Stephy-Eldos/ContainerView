

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var mainTitleView: UIView!
    @IBOutlet weak var containerResult: UIView!
    @IBOutlet weak var containerRegister: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    
    var resultViewController : ResultViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {
        mainTitleView.isHidden = true
        containerResult.isHidden = true
        containerRegister.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult" {
            if let vc = segue.destination as? ResultViewController {
                self.resultViewController = vc
            }
        }
    }

    @IBAction func onViewResults(_ sender: UIButton) {
        if let vc = resultViewController {
            vc.fetchPointSummary()
        }
        mainTitleView.isHidden = false
        containerResult.isHidden = false
        containerRegister.isHidden = true
        labelTitle.text = "RESULTS"
    }
    
    @IBAction func onNewEnrollment(_ sender: UIButton) {
        mainTitleView.isHidden = false
        containerResult.isHidden = true
        containerRegister.isHidden = false
        labelTitle.text = "REGISTER"
    }
    
    @IBAction func onBackButton(_ sender: UIButton) {
        setUp()
    }
}

