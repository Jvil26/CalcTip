//
//  ViewController.swift
//  Prework
//
//  Created by Justin Sin on 11/1/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var billAmountResetButton: UIButton!
    
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var currencyLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var rateLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipSlider: UISlider!
    
    @IBOutlet weak var totalHeader: UILabel!
    
    @IBOutlet weak var billAmountHeader: UILabel!
    
    @IBOutlet weak var tipHeader: UILabel!
    
    @IBOutlet weak var rateHeader: UILabel!
    
    @IBOutlet weak var euroTotalLabel: UILabel!
    
    @IBOutlet weak var yuanTotalLabel: UILabel!
    
    @IBOutlet weak var euroTotalHeader: UILabel!
    
    @IBOutlet weak var yuanTotalHeader: UILabel!
    
    let tipPercentages = [0.15, 0.18, 0.2]
        
    let currencySymbol = Locale.current.currencySymbol
        
    let defaults = UserDefaults.standard
                    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        billAmountTextField.becomeFirstResponder()
        if let backgroundColor = defaults.string(forKey: "backgroundColorKey") {
        switch(backgroundColor) {
            case "Teal":
                self.view.backgroundColor = .systemTeal
                break;
            case "Yellow":
                self.view.backgroundColor = .systemYellow
                break;
            case "Green":
                self.view.backgroundColor = .systemGreen
                break;
            case "Red":
                self.view.backgroundColor = .systemRed
                break;
            case "Pink":
                self.view.backgroundColor = .systemPink
                break;
            case "Purple":
                self.view.backgroundColor = .systemPurple
                break;
            case "Dark":
                self.view.backgroundColor = .systemFill
                break;
            default:
                self.view.backgroundColor = .white
                break;
            }
            if (backgroundColor != "Light" && backgroundColor != "Yellow") {
                tipAmountLabel.textColor = .white
                totalLabel.textColor = .white
                rateLabel.textColor = .white
                currencyLabel.textColor = .white
                rateHeader.textColor = .white
                billAmountHeader.textColor = .white
                tipHeader.textColor = .white
                totalHeader.textColor = .white
                yuanTotalLabel.textColor = .white
                yuanTotalHeader.textColor = .white
                euroTotalLabel.textColor = .white
                euroTotalHeader.textColor = .white
                let nav = self.navigationController?.navigationBar
                nav?.barStyle = UIBarStyle.default
                nav?.tintColor = UIColor.white
                nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            } else {
                tipAmountLabel.textColor = .black
                totalLabel.textColor = .black
                rateLabel.textColor = .black
                currencyLabel.textColor = .black
                rateHeader.textColor = .black
                billAmountHeader.textColor = .black
                tipHeader.textColor = .black
                totalHeader.textColor = .black
                yuanTotalLabel.textColor = .black
                yuanTotalHeader.textColor = .black
                euroTotalLabel.textColor = .black
                euroTotalHeader.textColor = .black
                let nav = self.navigationController?.navigationBar
                nav?.barStyle = UIBarStyle.black
                nav?.tintColor = UIColor.black
                nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black
                ]
            }
        }

        self.billAmountTextField.keyboardType = .decimalPad
        if (currencySymbol == "£") {
            self.currencyLabel.text = "£"
        } else if (currencySymbol == "¥") {
            self.currencyLabel.text = "¥"
        } else {
            self.currencyLabel.text = "$"
            let yuanConversionON = defaults.bool(forKey: "settingsYuanToUS")
            let euroConversionON = defaults.bool(forKey: "settingsEuroToUS")
            if (yuanConversionON && euroConversionON) {
                yuanTotalLabel.isHidden = false
                yuanTotalHeader.isHidden = false
                euroTotalLabel.isHidden = false
                euroTotalHeader.isHidden = false
            } else if (yuanConversionON) {
                yuanTotalLabel.isHidden = true
                yuanTotalHeader.isHidden = true
                euroTotalLabel.isHidden = false
                euroTotalHeader.isHidden = false
            } else if (euroConversionON) {
                yuanTotalLabel.isHidden = false
                yuanTotalHeader.isHidden = false
                euroTotalLabel.isHidden = true
                euroTotalHeader.isHidden = true
            } else {
                yuanTotalLabel.isHidden = true
                yuanTotalHeader.isHidden = true
                euroTotalLabel.isHidden = true
                euroTotalHeader.isHidden = true
            }
        }
    }
    
    func convertUSToYuan(bill: Double) -> Double {
        return bill * 6.4
    }
    
    func convertUSToEuro(bill: Double) -> Double {
        return bill * 0.87
    }
    
    func calculateTotalBill(billAmount: Double) {
        let bill = billAmount
        let rate = (Double(rateLabel.text!.dropLast()) ?? 0) / 100
        let tip = bill * rate
        let total = bill + tip
        
        tipAmountLabel.text = String(format: "\(currencyLabel.text ?? "$")%.2f", tip)
        yuanTotalLabel.text = String(format: "\("¥")%.2f", convertUSToYuan(bill: total))
        euroTotalLabel.text = String(format: "\("£")%.2f", convertUSToEuro(bill: total))
        totalLabel.text = String(format: "\(currencyLabel.text ?? "$")%.2f", total)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        if (bill > 0) {
            calculateTotalBill(billAmount: bill)
        }
    }
    
    @IBAction func setRateByTipControl(_ sender: UISegmentedControl) {
        rateLabel.text = "\(tipPercentages[tipControl.selectedSegmentIndex] * 100)%"
        let bill = Double(billAmountTextField.text!) ?? 0
        if (bill > 0) {
            calculateTotalBill(billAmount: bill)
        }
    }
    
    @IBAction func setRateBySlider(_ sender: UISlider) {
        rateLabel.text = "\(Int(tipSlider.value))%"
    }
    
    
    @IBAction func resetBillAmount(_ sender: UIButton) {
        billAmountTextField.text = ""
        tipAmountLabel.text = "\(currencyLabel.text ?? "$")0.00"
        totalLabel.text = "\(currencyLabel.text ?? "$")0.00"
        yuanTotalLabel.text = "¥0.00"
        euroTotalLabel.text = "£0.00"
    }
    
    
}

