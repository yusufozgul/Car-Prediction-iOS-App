//
//  SelectAttributeVC.swift
//  Car Prediction
//
//  Created by Yusuf Özgül on 2.12.2019.
//  Copyright © 2019 Yusuf Özgül. All rights reserved.
//

import UIKit

class SelectAttributeVC: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var resultTableView: UITableView!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var navTitle: UILabel!
    
    var lastSelection: IndexPath!
    
    var selectableArray: [String] = []
    var searchResultArray: [String] = []
    var navTitleText: String = ""
    
    weak var delegate: SelectEndDelagate?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        navTitle.text = navTitleText
        searchResultArray = selectableArray
        
        searchTextField.delegate = self
        searchTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResultArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = searchResultArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        delegate?.selectEnd(selection: searchResultArray[indexPath.row])
        
        if self.lastSelection != nil
        {
            tableView.cellForRow(at: self.lastSelection as IndexPath)?.accessoryType = .none
        }
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark

        self.lastSelection = indexPath

        tableView.deselectRow(at: indexPath, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4)
        {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func doneButton(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
}
extension SelectAttributeVC: UITextFieldDelegate
{
    @objc func textFieldDidChange(_ textField: UITextField)
    {
        searchResultArray = selectableArray.filter { $0.lowercased().contains(textField.text!.lowercased()) }
        resultTableView.reloadData()
        if textField.text == ""
        {
            searchResultArray = selectableArray
            resultTableView.reloadData()
        }
    }
}
