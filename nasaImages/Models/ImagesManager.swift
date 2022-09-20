////
////  ImagesManager.swift
////  nasaImages
////
////  Created by Ron Tabachnik on 2022-09-10.
////
//
//import Foundation
//
//
//struct ImagesManager {
//    
//    let url = "https://api.nasa.gov/planetary/apod?api_key=5wcIymKHmvfaiG554ahMUcSEBJgnj64r5D2harUm&start_date=2021-01-01&end_date=2021-03-12"
//    
//    func request(){
//        var items = [NasaData]()
//        if let url = URL(string: url) {
//            URLSession.shared.dataTask(with: url)  {(data,response,error) in
//                do {
//                
//                    if let data = data {
//                        let result = try JSONDecoder().decode([NasaData].self, from: data)
//                        DispatchQueue.main.async {
//                            items = result
//                            print(items)
//                        }
//                    } else {
//                        print("No data")
//                    }
//                
//                } catch (let error) {
//                    print(error.localizedDescription)
//                }
//            }.resume()
//                }
//            }
//
//}
