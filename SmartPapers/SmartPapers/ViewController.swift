import UIKit

class ViewController: UIViewController {
    
    private var tableViewBooks = UITableView()
    var dataSource = [BookResponse]()
    let networkManager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Simple Papers"

        setupUI()
        
        networkManager.obtainPosts { [weak self] (result) in
            switch result {
            case .success(let posts):
                self?.dataSource = posts
                DispatchQueue.main.async {
                    self?.tableViewBooks.reloadData()
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        tableViewBooks.register(BookCell.self, forCellReuseIdentifier: BookCell.identifier)
        tableViewBooks.delegate = self
        tableViewBooks.dataSource = self
        tableViewBooks.showsVerticalScrollIndicator = false
        
        view.addSubview(tableViewBooks)
        
        tableViewBooks.translatesAutoresizingMaskIntoConstraints = false
        tableViewBooks.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        tableViewBooks.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
}

extension ViewController: UITableViewDelegate & UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BookCell.identifier, for: indexPath) as! BookCell
        
        cell.configure(bookName: "My Book Name",
                       publishDate: 1995,
                       bookImageName: "book-cover")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "BookScreen", bundle: Bundle.main)
        let vc = storyboard.instantiateInitialViewController() as! BookScreen
        navigationController?.pushViewController(vc, animated: true)
        
        vc.dataSource = dataSource
    }
}

