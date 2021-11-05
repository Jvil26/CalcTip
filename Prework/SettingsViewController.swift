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
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var euroToUSLabel: UILabel!
    
    @IBOutlet weak var yuanToUSLabel: UILabel!
    
    @IBOutlet weak var euroToUSSwitch: UISwitch!
    
    @IBOutlet weak var yuanToUSSwitch: UISwitch!
    
    let currencySymbol = Locale.current.currencySymbol

    let backgroundColorPickerData: [String] = ["Light", "Dark", "Teal", "Yellow", "Green", "Red", "Pink", "Purple"]
        
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        backgroundColorPickerView.dataSource = self
        backgroundColorPickerView.delegate = self
        backgroundColorPickerView.selectRow(backgroundColorPickerData.firstIndex(of: defaults.string(forKey: "backgroundColorKey")!) ?? 0, inComponent: 0, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
                backgroundColorHeader.textColor = .white
                conversionsHeader.textColor = .white
                yuanToUSLabel.textColor = .white
                euroToUSLabel.textColor = .white
                let nav = self.navigationController?.navigationBar
                nav?.barStyle = UIBarStyle.default
                nav?.tintColor = UIColor.white
                nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white
                ]
                backgroundColorPickerView.setValue(UIColor.white, forKey: "backgroundColor")
            } else {
                backgroundColorHeader.textColor = .black
                conversionsHeader.textColor = .black
                yuanToUSLabel.textColor = .black
                euroToUSLabel.textColor = .black
                let nav = self.navigationController?.navigationBar
                nav?.barStyle = UIBarStyle.black
                nav?.tintColor = UIColor.black
                nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black
                ]
                backgroundColorPickerView.setValue(UIColor.black, forKey: "textColor")
            }
        }
        yuanToUSSwitch.isOn = defaults.bool(forKey: "settingsYuanToUS")
        euroToUSSwitch.isOn = defaults.bool(forKey: "settingsEuroToUS")
        if (currencySymbol == "$") {
            yuanToUSSwitch.isHidden = false
            yuanToUSLabel.isHidden = false
            euroToUSSwitch.isHidden = false
            euroToUSLabel.isHidden = false
        } else {
            yuanToUSSwitch.isHidden = true
            yuanToUSSwitch.isOn = false
            yuanToUSLabel.isHidden = true
            euroToUSSwitch.isHidden = true
            euroToUSSwitch.isOn = false
            euroToUSLabel.isHidden = true
        }
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
                backgroundColorHeader.textColor = .white
                conversionsHeader.textColor = .white
                yuanToUSLabel.textColor = .white
                euroToUSLabel.textColor = .white
                let nav = self.navigationController?.navigationBar
                nav?.barStyle = UIBarStyle.default
                nav?.tintColor = UIColor.white
                nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
                backgroundColorPickerView.setValue(UIColor.black, forKey: "textColor")
            } else {
                backgroundColorHeader.textColor = .black
                conversionsHeader.textColor = .black
                yuanToUSLabel.textColor = .black
                euroToUSLabel.textColor = .black
                let nav = self.navigationController?.navigationBar
                nav?.barStyle = UIBarStyle.black
                nav?.tintColor = UIColor.black
                nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black
                ]
                backgroundColorPickerView.setValue(UIColor.black, forKey: "textColor")
            }
            defaults.set(color, forKey: "backgroundColorKey")
        }
    }
