import UIKit

class TableViewHeight_20190730: UIViewController {
    
    private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView = UITableView()
        tableView.frame = view.bounds
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
}

extension TableViewHeight_20190730: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self))! as UITableViewCell
        cell.textLabel?.text = "\(indexPath.row)"
        cell.textLabel?.textAlignment = .center
        return cell
    }
}

extension TableViewHeight_20190730: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(40 * indexPath.row + 40)
    }
}
