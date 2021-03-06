import UIKit

extension UIView {
    
    func addAllSubviews(_ views: UIView...) {
        views.forEach(addSubview)
    }
    
    func addShadow(_ alphaCGFloat: CGFloat) {
        layer.shadowOpacity = 1
        layer.shadowRadius = 10
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: alphaCGFloat).cgColor
        
    }
    
    func addCornerRadius(_ cornerRadius: Int) {
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.layer.masksToBounds = true
    }
    
    func cornerRadius(corners: UIRectCorner, radius: CGFloat) {
        
    }
}

