//
//  Rx.swift
//  SampleApp
//
//  Created by Mohaitheen on 10/02/20.
//  Copyright © 2020 Mohaitheen. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Rx {
    private static let disposeBag = DisposeBag()
    
    static func bind(_ object: Any?, selector: Selector, handler: @escaping () -> Void) {
        if let object = object as? UIViewController {
            object.rx
                .methodInvoked(selector)
                .map { _ in }
                .subscribe(onNext: {
                    handler()
                })
                .disposed(by: disposeBag)
        }
    }
    
    static func bind(_ label: UILabel?, property: BehaviorRelay<String?>) {
        if let label = label {
            property
                .asObservable()
                .bind(to: label.rx.text)
                .disposed(by: disposeBag)
        }
    }
    
    static func bind(_ textView: UITextView?, property: BehaviorRelay<String?>) {
        if let textView = textView {
            property
                .asObservable()
                .bind(to: textView.rx.text)
                .disposed(by: disposeBag)
        }
    }
    
    static func bind(_ imageView: UIImageView?, property: BehaviorRelay<UIImage?>) {
        if let imageView = imageView {
            property
                .asObservable()
                .bind(to: imageView.rx.image)
                .disposed(by: disposeBag)
        }
    }
    
    static func bind(_ button: UIButton?, handler: @escaping () -> Void) {
        if let button = button {
            button.rx.tap.bind {
                handler()
                }
                .disposed(by: disposeBag)
        }
    }
    
    static func bind<T>(_ property: BehaviorRelay<T>, handler: @escaping (T) -> Void) {
        property.bind { value in
            handler(value)
            }
            .disposed(by: disposeBag)
    }
}
