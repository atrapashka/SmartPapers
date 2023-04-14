import UIKit

class BookScreen: UIViewController {
    
    var dataSource = [BookResponse]()
    
    private var bookLabel = UILabel()
    private var dateLabel = UILabel()
    private var subtitleLabel = UILabel()
    private var ratingLabel = UILabel()
    private var bookImage = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    private func setupUI() {
        view.addSubview(bookImage)
        bookImage.image = UIImage(named: "book-cover")
        bookImage.backgroundColor = .purple
        bookImage.translatesAutoresizingMaskIntoConstraints = false
        bookImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        bookImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        bookImage.widthAnchor.constraint(equalToConstant: view.frame.width / 2.5).isActive = true
        bookImage.heightAnchor.constraint(equalToConstant: view.frame.height / 4).isActive = true
        
        view.addSubview(ratingLabel)
        ratingLabel.text = "Global rating: 4.43"
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.leadingAnchor.constraint(equalTo: bookImage.trailingAnchor, constant: 20).isActive = true
        ratingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        ratingLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 2.5).isActive = true
        ratingLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        view.addSubview(dateLabel)
        dateLabel.text = "Date of first publication: 01.04.2023"
        dateLabel.font = UIFont.systemFont(ofSize: 10)
        dateLabel.numberOfLines = 2
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 20).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: bookImage.trailingAnchor, constant: 20).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 3).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        view.addSubview(bookLabel)
        bookLabel.text = "My Book Name"
        bookLabel.textAlignment = .left
        bookLabel.font = UIFont.boldSystemFont(ofSize: 20)
        bookLabel.translatesAutoresizingMaskIntoConstraints = false
        bookLabel.topAnchor.constraint(equalTo: bookImage.bottomAnchor, constant: 5).isActive = true
        bookLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        bookLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 1.5).isActive = true
        bookLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(subtitleLabel)
        subtitleLabel.numberOfLines = 10
        subtitleLabel.text = "A few words about this magnificent book! A few words about this magnificent book! A few words about this magnificent book! A few words about this magnificent book! A few words about this magnificent book! A few words about this magnificent book! A few words about this magnificent book! A few words about this magnificent book!"
        subtitleLabel.textAlignment = .left
        subtitleLabel.sizeToFit()
        subtitleLabel.font = UIFont.systemFont(ofSize: 10)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.topAnchor.constraint(equalTo: bookLabel.bottomAnchor, constant: 5).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
    }
}
