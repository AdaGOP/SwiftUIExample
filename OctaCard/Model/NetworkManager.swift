
//
//  NetworkManager.swift
//  OctaCard
//
//  Created by octavianus on 22/06/20.
//  Copyright © 2020 com.octavianus. All rights reserved.
//

import Foundation


class NetworkManager: ObservableObject{
    
    @Published var posts = [Post]()
    @Published var mentors = [MentorRecord]()
    let decoder = JSONDecoder()
    
    func fetchData(){
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            URLSession.shared.dataTask(with: url) { (data, res, err) in
                if let safeData = data, err == nil {
                    
                    do{
                        let results = try self.decoder.decode(Results.self, from: safeData)
                        DispatchQueue.main.async {
                            self.posts = results.hits
                        }
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            }.resume()

        }
    }
    
    
    func fetchMentorData(){
        if let url = URL(string: "https://api.airtable.com/v0/appCrDMPDzO1N2gYJ/mentorApi?api_key=keyW9iw7rCrEtnyWK"){
            URLSession.shared.dataTask(with: url) { (data, res, err) in
                if let safeData = data,err == nil{
                    do{
                        let results = try self.decoder.decode(MentorsRecords.self, from: safeData)
                        DispatchQueue.main.async {
                            self.mentors = results.records
                        }
                    }catch let jsonError{
                        print(jsonError.localizedDescription)
                    }
                }
            }.resume()
        }
    }
    
}
