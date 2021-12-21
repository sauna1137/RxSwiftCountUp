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

//「rx.tap」はUIButtonに用意されている、ボタンがタップされたことを通知してくれるObservable
//「subscribe」は文字通り購読の意味で、対象に変化があった時に呼ばれます。今回はfavButtonがtapされる時
//「onNext」はイベントが通常通りであるたびに通知します。他にもエラー時に通知するonError、完了時に通知するonCompletedがあります。

        countUpButton.rx.tap
            .subscribe(onNext: {[unowned self] _ in
                self.count += 1
                self.countLabel.text = String(self.count)
            })
//「disposed」は購読の解除です。onNextの場合は、イベント後も購読が継続するため、メモリーリークになる恐れがあります。なのでdisposedで開放してあげる必要があります。
            .disposed(by: disposeBag)
    }
}
