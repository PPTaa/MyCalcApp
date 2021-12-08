//
//  RoundButton.swift
//  MyCalcApp
//
//  Created by leejungchul on 2021/12/08.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {

    @IBInspectable var isRound: Bool = false {
        didSet {
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }
}
