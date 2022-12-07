import UIKit
import RxSwift

let disposeBag = DisposeBag()

let variable = Variable([String]())

variable.value.append("Item 1")

variable.asObservable()// Variable을 Observable로 변환해 구독할 수 있다.
    .subscribe {
        print($0)
    }

variable.value.append("Item 2")
