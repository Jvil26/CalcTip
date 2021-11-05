//
//  SettingsViewController.swift
//  Prework
//
//  Created by Justin Sin on 11/1/21.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var backgroundColorPickerView: UIPickerView!
                    
    @IBOutlet weak var backgroundColorHeader: UILabel!
    
    @IBOutlet weak var conversionsHeader: UILabel!
        
    @IBOutlet weak var euroToUSLabel: UILabel!
    
    @IBOutlet weak var yuanToUSLabel: UILabel!
    
    @IBOutlet weak var euroToUSSwitch: UISwitch!
    
    @IBOutlet weak var yuanToUSSwitch: UISwitch!
    
    @IBOutlet weak var presetRateTextField: UITextField!
    
    @IBOutlet weak var presetRateLabel: UILabel!
    
    let currencySymbol = Locale.current.currencySymbol

    let backgroundColorPickerData: [String] = ["Light", "Dark", "Teal", "Yellow", "Green", "Red", "Pink", "Purple"]
        
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        backgroundColorPickerView.dataSource = self
        backgroundColorPickerView.delegate = self
        self.presetRateTextField.keyboardType = .decimalPad
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let presetRate = defaults.string(forKey: "presetRate") {
            presetRateTextField.text = presetRate
        } else {
            presetRateTextField.text = "15"
        }
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
                self.backgroundColorHeader.textColor = .white
                self.conversionsHeader.textColor = .white
                self.yuanToUSLabel.textColor = .white
                self.euroToUSLabel.textColor = .white
                self.presetRateLabel.textColor = .white
                let nav = self.navigationController?.navigationBar
                nav?.barStyle = UIBarStyle.default
                nav?.tintColor = UIColor.white
                nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white
                ]
                self.backgroundColorPickerView.setValue(UIColor.white, forKey: "textColor")
            } else {
                self.backgroundColorHeader.textColor = .black
                self.conversionsHeader.textColor = .black
                self.yuanToUSLabel.textColor = .black
                self.euroToUSLabel.textColor = .black
                self.presetRateLabel.textColor = .black
                let nav = self.navigationController?.navigationBar
                nav?.barStyle = UIBarStyle.black
                nav?.tintColor = UIColor.black
                nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black
                ]
                self.backgroundColorPickerView.setValue(UIColor.black, forKey: "textColor")
            }
            backgroundColorPickerView.selectRow(backgroundColorPickerData.firstIndex(of: defaults.string(forKey: "backgroundColorKey")!) ?? 0, inComponent: 0, animated: true)
        }
        self.yuanToUSSwitch.isOn = defaults.bool(forKey: "settingsYuanToUS")
        self.euroToUSSwitch.isOn = defaults.bool(forKey: "settingsEuroToUS")
        if (currencySymbol == "$") {
            self.yuanToUSSwitch.isHidden = false
            self.yuanToUSLabel.isHidden = false
            self.euroToUSSwitch.isHidden = false
            self.euroToUSLabel.isHidden = false
        } else {
            self.yuanToUSSwitch.isHidden = true
            self.yuanToUSSwitch.isOn = false
            self.yuanToUSLabel.isHidden = true
            self.euroToUSSwitch.isHidden = true
            self.euroToUSSwitch.isOn = false
            self.euroToUSLabel.isHidden = true
        }
    }
    
    @IBAction func setPresetRate(_ sender: Any) {
        defaults.set(presetRateTextField.text, forKey: "presetRate")
    }
    
    @IBAction func setConvertYuanToUS(_ sender: Any) {
        defaults.set(yuanToUSSwitch.isOn, forKey: "settingsYuanToUS")
    }
    @IBAction func setConvertEuroToUS(_ sender: Any) {
        defaults.set(euroToUSSwitch.isOn, forKey: "settingsEuroToUS")
    }
}
    
    extension SettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return backgroundColorPickerData.count
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
              return backgroundColorPickerData[row]
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            let color: String = backgroundColorPickerData[row]
            switch(color) {
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
            if (color != "Light" && color != "Yellow") {
                self.backgroundColorHeader.textColor = .white
                self.conversionsHeader.textColor = .white
                self.yuanToUSLabel.textColor = .white
                self.euroToUSLabel.textColor = .white
                self.presetRateLabel.textColor = .white
                let nav = self.navigationController?.navigationBar
                nav?.barStyle = UIBarStyle.default
                nav?.tintColor = UIColor.white
                nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
                self.backgroundColorPickerView.setValue(UIColor.white, forKey: "textColor")
            } else {
                self.backgroundColorHeader.textColor = .black
                self.conversionsHeader.textColor = .black
                self.yuanToUSLabel.textColor = .black
                self.euroToUSLabel.textColor = .black
                self.presetRateLabel.textColor = .black
                let nav = self.navigationController?.navigationBar
                nav?.barStyle = UIBarStyle.black
                nav?.tintColor = UIColor.black
                nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black
                ]
                self.backgroundColorPickerView.setValue(UIColor.black, forKey: "textColor")
            }
            defaults.set(color, forKey: "backgroundColorKey")
        }
    }
