//
//  MainPresenter.swift
//  MobileWallet
//
//  Created by Dominika Poleshyck on 17.12.21.
//

import Foundation
import Combine
import UIKit

// MARK: Presenter -
protocol MainPresenterProtocol {
    var view: MainViewProtocol? { get set }
    func viewDidLoad()
}

class MainPresenter: MainPresenterProtocol {
    
    weak var view: MainViewProtocol?
    //    var timer: Timer?
    //    var seconds: Int = 0
    //    func viewDidLoad() {
    //
    //
    //        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
    //            self.seconds += 1
    //            self.view?.updateLabel(text: "\(self.seconds)")
    //        })
    //    }
    
    //    var timerPublisher: Timer.TimerPublisher?
    //    var timerSubdcription: AnyCancellable?
    //    var seconds: Int = 0
    //    func viewDidLoad() {
    //        timerPublisher = Timer.publish(every: 1, on: .main, in: .default)
    //        timerPublisher?.connect()
    //        timerSubdcription = timerPublisher?.sink { _ in }
    //    receiveValue: { date in
    //        self.seconds += 1
    //        self.view?.updateLabel(text: "\(self.seconds)")
    //        }
    //
    //    }
    //    var textPublisher: NotificationCenter.Publisher?
    //    var textSubscription: AnyCancellable?
    //
    //    func viewDidLoad() {
    //        textPublisher = NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: view?.textfield())
    //        textSubscription.publisher.sink { notification in
    //            let text = (notification.object as? UITextField)?.text ?? ""
    //            self.view?.updateLabel(text: text)
    //        }
    //    }
    
    var urlSubscription: AnyCancellable?
    
    func viewDidLoad() {
        urlSubscription = getCategories()?
            .map({ (data: Data, response: URLResponse) -> Data in
            return data
        }).decode(type: [String].self, decoder: JSONDecoder())
            .sink(receiveCompletion: { _ in
                
            }, receiveValue: { categories in
                print(categories)
            })
    }
    
    
    func getCategories() -> URLSession.DataTaskPublisher? {
        guard let url = URL(string: "https://api.chucknorris.io/jokes/categories") else {
            return nil
        }
        return URLSession.shared.dataTaskPublisher(for: url)
    }
}
