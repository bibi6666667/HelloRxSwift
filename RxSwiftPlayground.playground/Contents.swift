import UIKit
import RxSwift
import RxCocoa

let disposeBag = DisposeBag()

let numbers = Observable.of(2, 4, 3)

numbers.startWith(1)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

// 1
// 2
// 4
// 3
