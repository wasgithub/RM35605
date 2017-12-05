//
//  RestCerveja.swift
//  RM35605
//
//  Created by Washington Alexandre Silva on 02/12/2017.
//  Copyright © 2017 Washington Alexandre Silva. All rights reserved.
//

import Foundation
import UIKit

class RestCerveja {
    
    static let basePath = "https://api.punkapi.com/v2/beers"
    
    static let configuration: URLSessionConfiguration = {
        
        let config = URLSessionConfiguration.default
        config.allowsCellularAccess = true
        config.timeoutIntervalForRequest = 45.0
        config.httpMaximumConnectionsPerHost = 5
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
        
        
        return config
    }()
    
    static let session = URLSession(configuration: configuration)
    
    
    static func carregaCervejas(onComplete: @escaping ([Cerveja]?) -> Void) {
        
        guard let url = URL(string: basePath) else {
            onComplete(nil)
            return
        }
        
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if error != nil {
                print("Error!!!")
                onComplete(nil)
            } else {
                
                guard let response = response as? HTTPURLResponse else {
                    onComplete(nil)
                    return
                }
                
                if response.statusCode == 200 {
                    
                    guard let data = data else {
                        onComplete(nil)
                        return
                    }
                    
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as! [[String: Any]]
                        
                        var cervejas: [Cerveja] = []
                        for item in json {
                            let id = item["id"] as! Int
                            let name = item["name"] as! String
                            let tagline = item["tagline"] as! String
                            var abv = 0.0
                            if let temp1 = item["abv"] as? Double {
                                abv = temp1
                            }
                            var ibu = 0.0
                            if let temp2 = item["ibu"] as? Double {
                                ibu = temp2
                            }
                            let description = item["description"] as! String
                            let img_url = item["image_url"] as! String
                            let cerveja = Cerveja(id: id, name: name, tagline: tagline, abv: abv, ibu: ibu, description: description, img_url: img_url)
                            cervejas.append(cerveja)
                        }
                        onComplete(cervejas)
                        
                    } catch {
                        print(error.localizedDescription)
                        onComplete(nil)
                    }
                    
                    
                } else {
                    print("Erro no servidor:", response.statusCode)
                    onComplete(nil)
                }
                
            }
            
        }
        
        dataTask.resume()
    }
    
    
}
