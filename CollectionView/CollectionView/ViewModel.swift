//
//  ViewModel.swift
//  CollectionView
//
//  Created by 김정윤 on 7/1/25.
//

import Foundation
import RxSwift
import RxCocoa

final class ViewModel: ObservableObject {
    private let disposeBag = DisposeBag()
    
    var list = [
        Cookie(name: "락스타", price: 1),
        Cookie(name: "초코하임", price: 2)
    ]
    
    struct Input {
        let addBtnTapped: ControlEvent<Void>
    }
    
    struct Output {
        let alert: PublishRelay<Void>
    }
    
    func transform(_ input: Input) -> Output {
        let alert = PublishRelay<Void>()
        
        input.addBtnTapped
            .bind(with: self, onNext: { owner, _ in
                owner.list.append(Cookie(name: "집집집", price: 999))
                alert.accept(())
            })
            .disposed(by: disposeBag)
        
        return Output(alert: alert)
    }
}
