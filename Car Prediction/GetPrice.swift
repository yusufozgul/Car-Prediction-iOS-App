//
//  GetPrice.swift
//  Car Prediction
//
//  Created by Yusuf Özgül on 2.12.2019.
//  Copyright © 2019 Yusuf Özgül. All rights reserved.
//

import Foundation
import Alamofire

class GetPrice
{
    func getPrice(data: CarData, completion: @escaping (String) -> Void)
    {
        var urlString = "http://104.45.129.38/\(data.color!)/\(data.sumKM!)/\(data.year!)/\(data.gear!)/\(data.fuel!)/\(data.type!)/\(data.traction!)/\(data.horsePower!)/\(data.model!)"
        urlString = urlString.replacingOccurrences(of: " ", with: "%20")
        urlString = urlString.replacingOccurrences(of: "ü", with: "%C3%BC")
        urlString = urlString.replacingOccurrences(of: "ş", with: "%C5%9F")
        urlString = urlString.replacingOccurrences(of: "ı", with: "%C4%B1")
        urlString = urlString.replacingOccurrences(of: "Ö", with: "%C3%96")
        urlString = urlString.replacingOccurrences(of: "Ç", with: "%C3%87")
        urlString = urlString.replacingOccurrences(of: "ğ", with: "%C4%9F")
        urlString = urlString.replacingOccurrences(of: "Ş", with: "%C5%9E")
        urlString = urlString.replacingOccurrences(of: "İ", with: "%C4%B0")
        urlString = urlString.replacingOccurrences(of: "ç", with: "%C3%A7")
        
        
        AF.request(urlString).responseString { (response) in
            switch response.result
            {
            case .success(let data):
                var result = data
                result.removeFirst()
                result.removeLast()
                
                
                for c in result.reversed()
                {
                    if c != "."
                    {
                        result.removeLast()
                    }
                    else
                    { break }
                    
                }
                if result.last == "."
                {
                   result.removeLast()
                }
                result = result + " ₺"
                completion(result)
            case .failure(let error):
                completion(error.localizedDescription)
            }
        }
    }
}

//http://127.0.0.1:5000/G%C3%BCm%C3%BC%C5%9F%20Gri/85000/2016/Yar%C4%B1%20Otomatik/Dizel/Sedan/%C3%96nden%20%C3%87eki%C5%9F/120/Passat
