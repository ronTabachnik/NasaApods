//
//  ApodManager.swift
//  nasaImages
//
//  Created by Ron Tabachnik on 2022-09-14.
//

import Foundation
import UIKit

protocol ApodManagerDelegate{
    func didUpdateApod(apods: [Apod])
}

struct ApodManager{
    var delegate: ApodManagerDelegate?
    func performRequest(){
        DispatchQueue.main.async {
            if let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=5wcIymKHmvfaiG554ahMUcSEBJgnj64r5D2harUm&start_date=2021-01-01&end_date=2021-03-12"){
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url) { (data, res, error) in
                    if error != nil {
                        print(error!)
                        return
                    }
                    if let safeData = data {
                        if let apod = parseJSON(apodData: safeData){
                            self.delegate?.didUpdateApod(apods: apod)
                        }
                        
                    }
                    
                }
                
                task.resume()
                
            }
        }
    }
    
    func parseJSON(apodData: Data) -> [Apod]? {
        
        var apods: [Apod] = []
        let decoder = JSONDecoder()
        do{
            
            let decodedData = try decoder.decode([ApodModelElement].self, from: apodData)
            for post in decodedData{
                
                if let url = URL(string: post.url!){
                    if let data = try? Data(contentsOf: url){
                        if let image = UIImage(data: data){
                            var copyright = "Missing"
                            if post.copyright != nil{
                                copyright = post.copyright!
                                
                            }
                            var item = Apod(copyright: copyright, date: post.date!, explanation: post.explanation!, title: post.title!, image: image)
                            apods.append(item)
                        }
                    }
                }
                
            }
            return apods
        }catch{
            print(error)
            return nil
        }
        
    }
    
}
//
//"https://api.nasa.gov/planetary/apod?api_key=5wcIymKHmvfaiG554ahMUcSEBJgnj64r5D2harUm&start_date=2021-01-01&end_date=2021-03-12")!
