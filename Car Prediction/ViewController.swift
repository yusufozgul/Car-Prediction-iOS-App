//
//  ViewController.swift
//  Car Prediction
//
//  Created by Yusuf Özgül on 2.12.2019.
//  Copyright © 2019 Yusuf Özgül. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SelectEndDelagate
{
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var carModelTextField: UITextField!
    @IBOutlet weak var carColorTextField: UITextField!
    @IBOutlet weak var carFuelTextField: UITextField!
    @IBOutlet weak var carTractionTextfield: UITextField!
    @IBOutlet weak var carTypeTextField: UITextField!
    @IBOutlet weak var gearTypeTextField: UITextField!
    @IBOutlet weak var sumKmTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var horsePowerTextField: UITextField!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    private var currentSelectAttribute: Int?
    private var companyIndex: Int?
    private var data = SelectableData()
    private var carData = CarData(color: nil, gear: nil, fuel: nil, type: nil, traction: nil, company: nil, model: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sumKmTextField.addTarget(self, action: #selector(self.sumKMDidChange(_:)), for: UIControl.Event.editingChanged)
        
        yearTextField.addTarget(self, action: #selector(self.yearDidChange(_:)), for: UIControl.Event.editingChanged)
        
        horsePowerTextField.addTarget(self, action: #selector(self.horsePowerDidChange(_:)), for: UIControl.Event.editingChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(closeKeyboardAfterTap))
        self.view.addGestureRecognizer(tapGesture)
        self.scrollView.addGestureRecognizer(tapGesture)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "goSelectAttribute"
        {
            let vc = segue.destination as! SelectAttributeVC
            vc.delegate = self
            
            switch currentSelectAttribute {
            case 1:
                vc.selectableArray = data.company
                vc.navTitleText = "Marka Seçin"
            case 2:
                guard companyIndex != nil else { return }
                vc.selectableArray = data.model[companyIndex!]
                vc.navTitleText = "Model Seçin"
            case 3:
                vc.selectableArray = data.color
                vc.navTitleText = "Renk Seçin"
            case 4:
                vc.selectableArray = data.fuel
                vc.navTitleText = "Yakıt Seçin"
            case 5:
                vc.selectableArray = data.traction
                vc.navTitleText = "Çekiş Türü Seçin"
            case 6:
                vc.selectableArray = data.type
                vc.navTitleText = "Araç Tipi Seçin"
            case 7:
                vc.selectableArray = data.gear
                vc.navTitleText = "Vites Tipi Seçin"
            default:
                break
            }
            
        }
    }
    
    func selectEnd(selection: String?)
    {
        switch currentSelectAttribute {
        case 1:
            carData.company = selection
            companyTextField.text = selection
            var counter = 0
            for company in data.company
            {
                if company == selection
                {
                    companyIndex = counter
                }
                counter += 1
            }
        case 2:
            carData.model = selection
            carModelTextField.text = selection
        case 3:
            carData.color = selection
            carColorTextField.text = selection
        case 4:
            carData.fuel = selection
            carFuelTextField.text = selection
        case 5:
            carData.traction = selection
            carTractionTextfield.text = selection
        case 6:
            carData.type = selection
            carTypeTextField.text = selection
        case 7:
            carData.gear = selection
            gearTypeTextField.text = selection
        default:
            break
        }
    }


    @IBAction func tapSelectButton(_ sender: UIButton)
    {
        switch sender.tag {
        case 1:
            currentSelectAttribute = 1
        case 2:
            currentSelectAttribute = 2
        case 3:
            currentSelectAttribute = 3
        case 4:
            currentSelectAttribute = 4
        case 5:
            currentSelectAttribute = 5
        case 6:
            currentSelectAttribute = 6
        case 7:
            currentSelectAttribute = 7
        default:
            break
        }
        performSegue(withIdentifier: "goSelectAttribute", sender: nil)
    }
    
    @objc func sumKMDidChange(_ textField: UITextField)
    {
        carData.sumKM = textField.text
    }
    
    @objc func yearDidChange(_ textField: UITextField)
    {
        carData.year = textField.text
    }
    
    @objc func horsePowerDidChange(_ textField: UITextField)
    {
        carData.horsePower = textField.text
    }
    
    @IBAction func searchButton(_ sender: Any)
    {
        loading.isHidden = false
        print(carData)
        GetPrice().getPrice(data: carData) { (result) in
            let alert = UIAlertController(title: "Tahmin Sonucu", message: result, preferredStyle: .alert)
            let cancelButton = UIAlertAction(title: "Kapat", style: .cancel, handler: nil)
            alert.addAction(cancelButton)
            self.present(alert, animated: true)
            print(result)
            self.loading.isHidden = true
        }
    }
    
    @objc func closeKeyboardAfterTap()
    {
        self.view.endEditing(true)
    }
    
}

protocol SelectEndDelagate: class
{
    func selectEnd(selection: String?)
}

