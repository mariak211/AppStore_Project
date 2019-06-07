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
    
    func FetchTopGrossingApps(completion: @escaping (appsGroup?, Error?)->())
    {
        let UrlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/100/explicit.json"
        ApiFetchJsonData(urlString: UrlString, completion: completion)
    }
    func fetchNewApps(completion: @escaping (appsGroup?, Error?)->()){
        let urlString = "https://rss.itunes.apple.com/api/v1/ca/ios-apps/new-apps-we-love/all/25/explicit.json"
        ApiFetchJsonData(urlString: urlString, completion: completion)
    }
    
    func topFreeApps(completion: @escaping (appsGroup?, Error?)->()){
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free-ipad/all/100/explicit.json"
        ApiFetchJsonData(urlString: urlString, completion: completion)
    }
    
    func fetChNewGames(completion: @escaping (appsGroup?, Error?)->()){
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/100/explicit.json"
        ApiFetchJsonData(urlString: urlString, completion: completion)
    }
    func fetchtopPaidApp(completion: @escaping (appsGroup?, Error?)->()){
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-paid/all/100/explicit.json"
        ApiFetchJsonData(urlString: urlString, completion: completion)
    }
    
    func fetchSocialMediaApps(completion: @escaping ([Socialmedia]?, Error?)->()){
        
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
    
        guard let url = URL(string: urlString)else{return}
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let error = err{
                completion(nil, err)
            }
            guard let Data = data else{return}
            do{
                let socialMedia = try? JSONDecoder().decode([Socialmedia].self, from: Data)
                print(socialMedia)
                completion(socialMedia, nil)
            }catch{completion(nil, error)}
            }.resume()
    }
    //helper function
    func ApiFetchJsonData(urlString: String, completion: @escaping (appsGroup?, Error?) ->()){
        
        guard let url = URL(string: urlString)else{return}
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let error = err{
                completion(nil, error)
            }
            guard let data = data else{return}
            do{
                let appsgroup = try? JSONDecoder().decode(appsGroup.self, from: data)
                completion(appsgroup, nil)
            }catch{
                completion(nil, error)
            }
            }.resume()
    }
}
