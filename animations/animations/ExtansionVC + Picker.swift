//
//  ExtansionVC + Picker.swift
//  animations
//
//  Created by Александр Астапенко on 1.04.22.
//

import Foundation
import NVActivityIndicatorView
import NVActivityIndicatorViewExtended
import UIKit

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in _: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_: UIPickerView, numberOfRowsInComponent _: Int) -> Int {
        return Data.presentingIndicatorTypes.count
    }

    func pickerView(_: UIPickerView, titleForRow row: Int, forComponent _: Int) -> String? {
        let types = "\(Data.presentingIndicatorTypes[row])"
        return types
    }

    func pickerView(_: UIPickerView, didSelectRow row: Int, inComponent _: Int) {
        indexOnPicker = Data.presentingIndicatorTypes[row]
    }
}
