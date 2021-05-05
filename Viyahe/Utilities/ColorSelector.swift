//
//  ColorSelector.swift
//  Viyahe
//
//  Created by Gino Simon Alo on 5/5/21.
//

import UIKit

final class ColorSelector {
    func getColor(forInt int: Int) -> CGColor {
        return int.isEven ? UIColor.green.cgColor : UIColor.blue.cgColor
    }
}
