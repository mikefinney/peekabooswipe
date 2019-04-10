import UIKit

class CustomTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func applyCellAnimations() {

//        self.contentView.translatesAutoresizingMaskIntoConstraints = false

        self.contentView.transform = .identity

        UIView.animate(
            withDuration: 1,
            delay: 1,
            options: [.curveEaseInOut],
            animations: {
                self.contentView.transform = CGAffineTransform(translationX: 1000, y: 0)
                self.backgroundColor = UIColor.green
        }, completion: { _ in
            self.contentView.transform = .identity
        })

        
        print("applyCellAnimations")
    }
}
