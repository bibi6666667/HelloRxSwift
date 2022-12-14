import UIKit
import RxSwift
import RxCocoa

let strikes = PublishSubject<String>()

let disposeBag = DisposeBag()

strikes.elementAt(2)
    .subscribe(onNext: { str in
        print("\(str) - You are out!")
    }).disposed(by: disposeBag)

strikes.onNext("1X")
strikes.onNext("2X")
strikes.onNext("3X")
