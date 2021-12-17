//
//  MainViewController.swift
//  MobileWallet
//
//  Created by Dominika Poleshyck on 17.12.21.
//

import UIKit
// MARK: View -
protocol MainViewProtocol: AnyObject {
    func updateLabel(text: String)
    func textfield() -> UITextField
}

class MainViewController: UIViewController {
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var textField: UITextField!

	var presenter: MainPresenterProtocol = MainPresenter()

	override func viewDidLoad() {
        super.viewDidLoad()

        presenter.view = self
        presenter.viewDidLoad()
    }
}

extension MainViewController: MainViewProtocol {
    func textfield() -> UITextField {
        return textField
    }
    
    
    func updateLabel(text: String) {
        label.text = text
    }
    
    
}
