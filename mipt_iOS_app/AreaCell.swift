//
//  AreaCollectionViewCell.swift
//  mipt_iOS_app
//
//  Created by ms30 on 19.12.21.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}

class AreaCell: UICollectionViewCell {
    public struct Area {
//    public let text:String
    public let identifier:String
        
    public init(identifier:String) {
//        self.text = text
        self.identifier = identifier
        }
        
        static func == (left:Area, right:Area) -> Bool {
            return left.identifier == right.identifier
        }
        

    }


}
