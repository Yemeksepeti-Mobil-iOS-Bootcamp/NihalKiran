
//MARK: Custom Empty View Oluşturunuz...


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var users = [User]()
    var filteredUsers = [User]()
    var isFiltering: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let urlStr = "https://jsonplaceholder.typicode.com/users"
        guard let userURL = URL(string: urlStr) else { return }
        let userList = try? JSONDecoder().decode([User].self, from: Data(contentsOf: userURL))
        
        guard let users = userList else { return }
        self.users = users
        
        tableView.dataSource = self
        
    }


}

// TableView Extensions
extension ViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFiltering {
            filteredUsers.count == 0 ? self.tableView.setEmptyMessage("Ops! Search not found x( ") : self.tableView.restore()
            return filteredUsers.count
        }
        return users.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell")
        
        let user: User
        
        if isFiltering {
            user = filteredUsers[indexPath.row]
        } else {
            user = users[indexPath.row]
        }
        
        cell?.textLabel?.text = user.name
        cell?.detailTextLabel?.text = user.company.name
        
        return cell!
    }
    
}

// SearchBar Extension
extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredUsers = users.filter({ (user: User) -> Bool in
            return user.name.lowercased().contains(searchText.lowercased())
        })
        
        isFiltering = true
        tableView.reloadData()
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isFiltering = false
        searchBar.text = ""
        tableView.reloadData()
    }
}

// Empty Extension
extension UITableView {
    func setEmptyMessage(_ empty: String) {
        
        let emptyLbl = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        emptyLbl.text = empty
        emptyLbl.numberOfLines = 0
        emptyLbl.textColor = .red
        emptyLbl.textAlignment = .center
        emptyLbl.font = UIFont(name: "Roboto-Ultrabold", size: 40)
        self.backgroundView = emptyLbl
        self.separatorStyle = .none
    }
    
    func restore() {
        self.backgroundColor = nil
        self.separatorStyle = .singleLine
    }
}
