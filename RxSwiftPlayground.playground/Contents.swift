import UIKit
import RxSwift
import RxCocoa

let strikes = PublishSubject<String>()

let disposeBag = DisposeBag()

Observable.of("A", "B", "C", "D", "E", "F")
    .skip(4)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

Observable.of(2, 2, 3, 4, 4)
    .skipWhile { $0 % 2 == 0 }
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

let subject = PublishSubject<String>()
let trigger = PublishSubject<String>()

subject.takeUntil(trigger)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

subject.onNext("11")
subject.onNext("22")

trigger.onNext("XX")

subject.onNext("33")

subject.skipUntil(trigger)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

subject.onNext("A")
subject.onNext("B")

trigger.onNext("X")

subject.onNext("C")

Observable.of(1, 2, 3, 4, 5, 6)
    .take(3)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

Observable.of(2, 4, 6, 7, 8, 10)
    .takeWhile {
        return $0 % 2 == 0
    }
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

