//
//  MapVC.swift
//  Car Prediction
//
//  Created by Yusuf Özgül on 2.12.2019.
//  Copyright © 2019 Yusuf Özgül. All rights reserved.
//

import UIKit
import WebKit

class MapVC: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    var url = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        
        url = url.replacingOccurrences(of: " ", with: "%20")
        url = url.replacingOccurrences(of: "ü", with: "%C3%BC")
        url = url.replacingOccurrences(of: "ş", with: "%C5%9F")
        url = url.replacingOccurrences(of: "ı", with: "%C4%B1")
        url = url.replacingOccurrences(of: "Ö", with: "%C3%96")
        url = url.replacingOccurrences(of: "Ç", with: "%C3%87")
        url = url.replacingOccurrences(of: "ğ", with: "%C4%9F")
        url = url.replacingOccurrences(of: "Ş", with: "%C5%9E")
        url = url.replacingOccurrences(of: "İ", with: "%C4%B0")
        url = url.replacingOccurrences(of: "ç", with: "%C3%A7")

        let req  = URLRequest(url: URL(string: url)!)
        webView.load(req)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
