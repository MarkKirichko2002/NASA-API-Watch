//
//  NASAService.swift
//  NASA-API-Watch Watch App
//
//  Created by Марк Киричко on 29.04.2023.
//

import Alamofire
import Foundation

enum ResponseType {
    case apod
    case marsphotos
    case nasaimages
    case epic
    case earth
    case asteroids
    case marsweather
}

class NASAService {
    
    static let shared = NASAService()
    private var url = ""
    
    struct Contacts {
        static var apiKey = "iN4Lu3Ku0270mo9YWlhXAgJAuwbEQ8aobiGZo6tX"
    }

    private func UrlForResponse(response: ResponseType) -> String {
        switch response {
        case .apod:
            return "https://api.nasa.gov/planetary/apod?api_key=\(Contacts.apiKey)"
        case .marsphotos:
        return "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=\(Contacts.apiKey)"
        case .nasaimages:
        return "https://images-api.nasa.gov/search?q=apollo%2022&description=moon%20landing&media_type=image"
        case .epic:
        return "https://epic.gsfc.nasa.gov/api/natural"
        case .asteroids:
        return "https://api.nasa.gov/neo/rest/v1/feed?start_date=2015-09-07&end_date=2015-09-08&api_key=\(Contacts.apiKey)"
        case .marsweather:
        return "https://api.nasa.gov/insight_weather/?api_key=iN4Lu3Ku0270mo9YWlhXAgJAuwbEQ8aobiGZo6tX&feedtype=json&ver=1.0"
        case .earth:
            return ""
        }
    }
    
    func execute<T: Codable>(type: T.Type, response: ResponseType,completion: @escaping(Result<T,Error>)->Void) {
        
        url = UrlForResponse(response: response)
        
        AF.request(url).responseData { response in
            guard let data = response.data else {return}
            
            var response: T
            
            do {
                response = try JSONDecoder().decode(T.self, from: data)
                completion(.success(response))
            } catch {
                print(error)
                completion(.failure(error))
            }
        }
    }
    
    func fetchVideo(json: String, completion: @escaping(String)->()) {
        
        AF.request(json).responseData { response in
            guard let data = response.data else {return}
            
            var jsonResponse: [String]?
            
            do {
                jsonResponse = try JSONDecoder().decode([String].self, from: data)
                
                for i in jsonResponse! {
                    if i.contains("orig.mp4") {
                        completion(i)
                    }
                }
            } catch {
                print(error)
            }
        }
    }
}
