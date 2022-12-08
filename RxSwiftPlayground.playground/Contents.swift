import UIKit
import RxSwift
import RxCocoa

let disposeBag = DisposeBag()

let relay = BehaviorRelay(value: ["Item 1"])

var value = relay.value // 타입 : [String]
value.append("Item 2")
value.append("Item 3")

relay.accept(value)

relay.asObservable()
    .subscribe { event in
        print(event)
    }
