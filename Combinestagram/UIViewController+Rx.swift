//
//  UIViewController+Rx.swift
//  Combinestagram
//
//  Created by Kora on 22/04/2020.
//  Copyright © 2020 Underplot ltd. All rights reserved.
//

import UIKit
import RxSwift

extension UIViewController {
  
  func alert(title: String, text: String?) -> Completable {
    return Completable.create { [weak self] completable in
      let alertViewController = UIAlertController(title: title, message: text, preferredStyle: .alert)
      alertViewController.addAction(UIAlertAction(title: "Close", style: .default, handler: { _ in
        completable(.completed)
      }))
      self?.present(alertViewController, animated: true, completion: nil)
      return Disposables.create {
        self?.dismiss(animated: true, completion: nil)
      }
    }
  }
}
