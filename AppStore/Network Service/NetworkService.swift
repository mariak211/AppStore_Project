//
//  NetworkService.swift
//  AppStore
//
//  Created by Mariak Achuoth on 2019-05-18.
//  Copyright © 2019 The Future I Dream. All rights reserved.
//
import Foundation
class ApiNetworkService{
    static let shared = ApiNetworkService()
    func fetchApps(searchTerm: String, completion: @escaping (SearchResult?, Error?)->())
    {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        
        genericApiDataFetch(urlString: urlString, completion: completion)
    }
    
    func FetchTopGrossingApps(completion: @escaping (appsGroup?, Error?)->())
    {
        let UrlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/100/explicit.json"
        genericApiDataFetch(urlString: UrlString, completion: completion)
    }
    func fetchNewApps(completion: @escaping (appsGroup?, Error?)->()){
        let urlString = "https://rss.itunes.apple.com/api/v1/ca/ios-apps/new-apps-we-love/all/25/explicit.json"
        genericApiDataFetch(urlString: urlString, completion: completion)
    }
    
    func topFreeApps(completion: @escaping (appsGroup?, Error?)->()){
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free-ipad/all/100/explicit.json"
       genericApiDataFetch(urlString: urlString, completion: completion)
    }
    
    func fetChNewGames(completion: @escaping (appsGroup?, Error?)->()){
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/100/explicit.json"
        genericApiDataFetch(urlString: urlString, completion: completion)
    }
    func fetchtopPaidApp(completion: @escaping (appsGroup?, Error?)->()){
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-paid/all/100/explicit.json"
        genericApiDataFetch(urlString: urlString, completion: completion)
    }
    
    func fetchTopFree(completion: @escaping (appsGroup?, Error?)->()){
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/100/explicit.json"
        genericApiDataFetch(urlString: urlString, completion: completion)
    }
    func fetchSocialMediaApps(completion: @escaping ([Socialmedia]?, Error?)->()){
        
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
    
        genericApiDataFetch(urlString: urlString, completion: completion)
    }

   
    
    
    func genericApiDataFetch<T:Decodable>(urlString: String, completion: @escaping (T?, Error?) ->())
    {
        guard let url = URL(string: urlString)else{
        
            return
        }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let error = err{
                completion(nil, error)
            }
            guard let data = data else{return}
            do{
                let appsgroup = try? JSONDecoder().decode(T.self, from: data)
                completion(appsgroup, nil)
            }catch
            {
                completion(nil, error)
            }
            }.resume()
    }
    
    
}
