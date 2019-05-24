//
//  NetworkService.swift
//  AppStore
//
//  Created by Mariak Achuoth on 2019-05-18.
//  Copyright © 2019 The Future I Dream. All rights reserved.
//
import Foundation
class NetworkService{
    static let shared = NetworkService()
    func fetchApps(searchTerm: String, completion: @escaping ([Result])->())
    {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        guard  let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err{
                print("fail to fetch apps: ", err)
                return
            }
            guard let data = data else {return}
            do{
                let searchResult = try? JSONDecoder().decode(SearchResult.self, from: data)
            
                guard let searchReslt = searchResult else{return}
                
                completion(searchReslt.results)
            }catch let jsonErr{
                print("fail to decode json :", jsonErr)

            }
            }.resume()//fires off the request
        

    }
}
