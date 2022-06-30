import UIKit

extension UITextField {
    func underlined(placeholders: String, text: String) {
        let label = UILabel()
        let line = UIView()
        addAllSubviews(label, line)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.bottomAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        label.widthAnchor.constraint(equalToConstant: 200).isActive = true
        label.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        line.translatesAutoresizingMaskIntoConstraints = false
        line.topAnchor.constraint(equalTo: bottomAnchor, constant: 1).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        line.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        line.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true

        label.text = text
        label.textColor = UIColor(red: 0.569, green: 0.569, blue: 0.569, alpha: 1)
        
        line.backgroundColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1)

        attributedPlaceholder = NSAttributedString(string: placeholders, attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
    }
}
