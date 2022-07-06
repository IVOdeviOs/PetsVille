import UIKit

extension UITextField{

    func underlined( text: String,isHidden:Bool) {
        let label = UILabel()
        let line = UIView()
        let chevron = UIImageView()
        addAllSubviews(label, line, chevron)
      
        chevron.image = UIImage(systemName: "chevron.right")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.bottomAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        label.widthAnchor.constraint(equalToConstant: 200).isActive = true
        label.heightAnchor.constraint(equalToConstant: 16).isActive = true

        line.translatesAutoresizingMaskIntoConstraints = false
        line.topAnchor.constraint(equalTo: bottomAnchor, constant: 1).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        line.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        line.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
          
        chevron.translatesAutoresizingMaskIntoConstraints = false
        chevron.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        chevron.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        chevron.widthAnchor.constraint(equalToConstant: 9).isActive = true
        chevron.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        chevron.isHidden = isHidden
        chevron.tintColor = .black
        font = .montserrat(18, .medium)
        textColor = UIColor(red: 0.171, green: 0.166, blue: 0.192, alpha: 1)
        
        label.text = text
        label.font = .montserrat(16, .regular)
        label.textColor = UIColor(red: 0.569, green: 0.569, blue: 0.569, alpha: 1)

        line.backgroundColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1)

//        attributedPlaceholder = NSAttributedString(string: placeholders, attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
    }

    func setInputDatePicker(target: Any, selector: Selector) {
        let screenWidth = UIScreen.main.bounds.width

        let datePickers = UIDatePicker(frame: CGRect(x: 0,
                                                     y: 0,
                                                     width: screenWidth,
                                                     height: 220))
        datePickers.datePickerMode = .date

        if #available(iOS 14, *) {
            datePickers.preferredDatePickerStyle = .wheels
            datePickers.locale = Locale(identifier: "ru_RU")
            datePickers.sizeToFit()
        }
        inputView?.backgroundColor = .white
        inputView = datePickers
        let toolBar = UIToolbar(frame: CGRect(x: 0,
                                              y: 0,
                                              width: screenWidth,
                                              height: 44))
        let spacing = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                      target: nil,
                                      action: nil)
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel,
                                     target: nil,
                                     action: #selector(cancel))

        let done = UIBarButtonItem(barButtonSystemItem: .done,
                                   target: target,
                                   action: selector)

        toolBar.backgroundColor = .white
        toolBar.setItems([cancel, spacing, done], animated: false)
        inputAccessoryView = toolBar
    }

    @objc func cancel() {
        resignFirstResponder()
    }
}
