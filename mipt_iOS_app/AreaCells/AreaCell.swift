//
//  AreaCollectionViewCell.swift
//  mipt_iOS_app
//
//  Created by ms30 on 18.12.21.
//

import Foundation
import UIKit


public struct AreaCell {
    public let text:String
    public let identifier:String
    
    public init(text: String, identifier:String) {
        self.text = text
        self.identifier = identifier
    }
    
    static func == (left:Area, right:Area) -> Bool {
        return left.identifier == right.identifier
    }
    
    }
