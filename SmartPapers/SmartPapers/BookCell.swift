import Foundation
import UIKit

class BookCell: UITableViewCell {
    static let identifier = "BookCell"
    
    private var bookLabel = UILabel()
    private var dateLabel = UILabel()
    private var bookImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        bookImage.image = UIImage(named: "0")
        bookImage.contentMode = .scaleAspectFit
        bookImage.backgroundColor = .purple
        contentView.addSubview(bookImage)
        
        bookImage.translatesAutoresizingMaskIntoConstraints = false
        bookImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        bookImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        bookImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        bookImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        bookImage.widthAnchor.constraint(equalToConstant: contentView.frame.width / 3).isActive = true
        
        
        bookLabel.text = "The Book Of Bebra"
        bookLabel.textAlignment = .center
        contentView.addSubview(bookLabel)
        
        bookLabel.translatesAutoresizingMaskIntoConstraints = false
        bookLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        bookLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        bookLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        
        
        dateLabel.text = "1067"
        dateLabel.textAlignment = .center
        contentView.addSubview(dateLabel)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50).isActive = true
        dateLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(bookName: String, publishDate: Int, bookImageName: String) {
        bookLabel.text = "\(bookName)"
        dateLabel.text = "\(publishDate)"
        bookImage.image = UIImage(named: bookImageName)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bookLabel.text = nil
        dateLabel.text = nil
        bookImage.image = nil
    }
}
