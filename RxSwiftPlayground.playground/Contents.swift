import UIKit
import RxSwift
import RxCocoa

let disposeBag = DisposeBag()

Observable.of(1, 2, 3, 4, 5)
    .map {
        $0 * 2
    }
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
