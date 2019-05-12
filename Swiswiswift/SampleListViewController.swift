import UIKit

class SampleListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // tableview instance
    private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // initialize tableview
        tableView = UITableView()

        // set delegate
        tableView.delegate = self
        tableView.dataSource = self

        // set tableview size
        tableView.frame = view.frame
        
        // for UITest
        tableView.accessibilityIdentifier = "sampleListTableView"

        // set tableview
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        view.addSubview(tableView)
    }

    // MARK: tableview delegate methods
    // set the number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return samples.count
    }

    // set tableview rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self))! as UITableViewCell
        let sample = samples[indexPath.row]
        cell.textLabel?.text = "\(sample.date)  \(sample.title)"
        cell.accessibilityIdentifier = "cell_\(indexPath.row)"
        return cell
    }

    // called when tableview cell was tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row) cell was selected")
        let sample = samples[indexPath.row]
        let className = sample.className
        let aClass = NSClassFromString(className) as! UIViewController.Type
        let viewController = aClass.init()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
