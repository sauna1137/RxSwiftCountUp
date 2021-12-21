//
//  ViewController.swift
//  RxSwiftCountUp
//
//  Created by KS on 2021/12/21.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countUpButton: UIButton!

    private var count = 0
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        countUpButton.rx.tap
            .subscribe(onNext: {[unowned self] _ in
                self.count += 1
                self.countLabel.text = String(self.count)
            })
            .disposed(by: disposeBag)
    }
}
