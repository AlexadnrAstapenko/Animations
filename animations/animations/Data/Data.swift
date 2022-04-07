//
//  Data.swift
//  animations
//
//  Created by Александр Астапенко on 1.04.22.
//

import Foundation
import UIKit
import NVActivityIndicatorView
import NVActivityIndicatorViewExtended

struct Data: NVActivityIndicatorViewable {
    
    
    static let colors: [UIColor] = [.red, .purple, .green, .yellow, .orange, .black]
    static let fonts: [String] = ["Marker Felt", "Party LET", "Savoye LET Plain:1.0", "Snell Roundhand"]
    static let presentingIndicatorTypes = NVActivityIndicatorType.allCases.filter { $0 != .blank }
    
}
