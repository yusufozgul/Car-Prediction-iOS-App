//
//  MapSelectVC.swift
//  Car Prediction
//
//  Created by Yusuf Özgül on 2.12.2019.
//  Copyright © 2019 Yusuf Özgül. All rights reserved.
//

import UIKit

class MapSelectVC: UIViewController, SelectEndDelagate
{
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var carModelTextField: UITextField!
    
    private var currentSelectAttribute: Int?
    private var companyIndex: Int?
    private var data = SelectableData()
    private var carData = CarData(color: nil, gear: nil, fuel: nil, type: nil, traction: nil, company: nil, model: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "goMapSelecting"
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
            default:
                break
            }
            
        }
        else if segue.identifier == "goMapPage"
        {
            let vc = segue.destination as! MapVC
            vc.url = "http://3.135.222.251/\(companyTextField.text!)/\(carModelTextField.text!)"
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
        default:
            break
        }
        performSegue(withIdentifier: "goMapSelecting", sender: nil)
    }

    @IBAction func searchButton(_ sender: Any)
    {
        performSegue(withIdentifier: "goMapPage", sender: nil)
    }
}
