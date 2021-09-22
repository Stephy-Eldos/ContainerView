

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var categoryArray = [String]()
    var pointArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    func fetchPointSummary() {
        categoryArray = ["C", "Java", "PHP", "DotNet"]
        pointArray = ["10", "30", "20", "20"]
        tableView.reloadData()
    }
    
}

extension ResultViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath)
        let categoryLabel = cell.viewWithTag(1) as! UILabel
        categoryLabel.text = categoryArray[indexPath.row]
        let pointsLabel = cell.viewWithTag(2) as! UILabel
        pointsLabel.text = pointArray[indexPath.row]
        cell.backgroundColor = indexPath.row%2 == 0 ? UIColor.systemGray6 : UIColor.white
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 81
    }
}
