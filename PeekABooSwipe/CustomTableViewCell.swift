import UIKit

class CustomTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    func applyCellAnimations() {
//
////        self.contentView.translatesAutoresizingMaskIntoConstraints = false
//
//        self.contentView.transform = .identity
//
//        UIView.animate(
//            withDuration: 1,
//            delay: 1,
//            options: [.curveEaseInOut],
//            animations: {
//                self.contentView.transform = CGAffineTransform(translationX: 1000, y: 0)
//                self.backgroundColor = UIColor.green
//        }, completion: { _ in
//            self.contentView.transform = .identity
//        })
//
//
//        print("applyCellAnimations")
//    }
    
    // solution by https://stackoverflow.com/users/674205/hobbes-the-tige
    func applyCellAnimations() {
        
        let originalCenter = contentView.center
        let offsetCenter = originalCenter.applying(.init(translationX: -44, y: 0))
        
        animateToCenter(offsetCenter) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                self.animateToCenter(originalCenter)
            })
        }
    }
    
    private func animateToCenter(_ center: CGPoint, completionHandler: @escaping () -> Void = { }) {
        
        layoutIfNeeded()
        
        UIView.animate(
            withDuration: 1,
            delay: 0,
            options: [.curveEaseInOut],
            animations: {
                self.contentView.center = center
        }, completion: { didComplete in
            if didComplete { completionHandler() }
        })
    }
}
