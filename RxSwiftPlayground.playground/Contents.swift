import UIKit
import RxSwift

let disposeBag = DisposeBag()

let left = PublishSubject<Int>()
let middle = PublishSubject<Int>()
let right = PublishSubject<String>()

let observable = Observable.combineLatest(left, middle, right, resultSelector: {
    lastLeft, lastMiddle, lastRight in
    return "\(lastLeft) \(lastMiddle) \(lastRight)"
})

observable.subscribe(onNext: { result in
    print(result)
}).disposed(by: disposeBag)

left.onNext(1)
middle.onNext(10)
right.onNext("A")
left.onNext(2)
middle.onNext(9)
right.onNext("B")
left.onNext(3)
middle.onNext(8)
right.onNext("C")
left.onNext(4)
middle.onNext(7)
right.onNext("D")
left.onNext(5)
