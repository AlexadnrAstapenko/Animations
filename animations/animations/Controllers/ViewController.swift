//
//  ViewController.swift
//  animations
//
//  Created by Александр Астапенко on 1.04.22.
//

import NVActivityIndicatorView
import NVActivityIndicatorViewExtended
import UIKit

// MARK: - ViewController

class ViewController: UIViewController, NVActivityIndicatorViewable {
    @IBOutlet var textColor: UISegmentedControl!
    @IBOutlet var labelHight: UILabel!
    @IBOutlet var labelWidth: UILabel!
    @IBOutlet var timeStepper: UILabel!
    @IBOutlet var textOnloader: UILabel!
    @IBOutlet var stepperWidth: UIStepper!
    @IBOutlet var steppetHight: UIStepper!
    @IBOutlet var colorSegment: UISegmentedControl!
    @IBOutlet var textView: UITextView!
    @IBOutlet var myPicker: UIPickerView!
    @IBOutlet var fontsChange: UISegmentedControl!
    var indexOnPicker: NVActivityIndicatorType = .audioEqualizer

    var hight = 50.0
    var wight = 50.0
    var textSize = 20.0
    var time = 5.0

    override func viewDidLoad() {
        super.viewDidLoad()
        myPicker.dataSource = self
        myPicker.delegate = self
        textView.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func stepperHight(_ sender: UIStepper) {
        self.labelHight.text = "Hight \((sender as UIStepper).value)"
        hight = (sender as UIStepper).value
    }

    @IBAction func stepperWidth(_ sender: UIStepper) {
        self.labelWidth.text = "Width \((sender as UIStepper).value)"
        wight = (sender as UIStepper).value
    }

    @IBAction func stepperSize(_ sender: UIStepper) {
        self.textOnloader.text = "Size: \((sender as UIStepper).value)"
        textSize = (sender as UIStepper).value
    }

    @IBAction func steperTime(_ sender: UIStepper) {
        self.timeStepper.text = "Time: \((sender as UIStepper).value)"
        time = Double((sender as UIStepper).value)
    }

    @IBAction func myAction(_: UIButton) {
        startAnimating(
            CGSize(width: wight, height: hight),
            message: textView.text,
            messageFont: UIFont(name: Data.fonts[fontsChange.selectedSegmentIndex], size: textSize),
            type: indexOnPicker,
            color: Data.colors[colorSegment.selectedSegmentIndex],
//          backgroundColor: <#T##UIColor?#>,
            textColor: Data.colors[textColor.selectedSegmentIndex]
        )

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) { [weak self] in
            self?.stopAnimating()
        }
    }
}

// MARK: UIPickerViewDataSource, UIPickerViewDelegate

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

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
}

// MARK: UITextViewDelegate

extension ViewController: UITextViewDelegate {
    func textView(_: UITextView, shouldChangeTextIn _: NSRange, replacementText _: String) -> Bool {
        return true
    }
}
