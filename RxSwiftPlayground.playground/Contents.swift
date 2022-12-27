import UIKit
import RxSwift

let disposeBag = DisposeBag()

let left = PublishSubject<Int>()
let right = PublishSubject<Int>()

let source = Observable.of(left.asObservable(), right.asObservable())
let observable = source.merge()
observable.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)

left.onNext(20)
left.onNext(40)
left.onNext(60)
right.onNext(1)
left.onNext(80)
left.onNext(100)
right.onNext(1)
