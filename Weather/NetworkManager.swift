//
//  NetworkManager.swift
//  Weather
//
//  Created by Gordon Tran on 6/22/20.
//  Copyright © 2020 Gordon Tran. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    //private static let newsURL = "http://api.openweathermap.org/data/2.5/forecast?q="
    private static let newsURL = "https://api.openweathermap.org/data/2.5/onecall?"
    private static let key = "d37f596891ec61fd3b0450acb0a195a6"
    private static let iconEndPoint = " https://www.openweathermap.org/img/wn/" //10d@2x.png
    static func getWeather( _ didGetWeather: @escaping (WeatherSearchResponse) -> Void) {
    AF.request(newsURL+"lat=40.6782&lon=-73.9442"+"&units=imperial&exclude=minutely&appid="+key, method: .get).validate().responseData { response in
            switch response.result{
            case .success(let results):
                let decoder = JSONDecoder()
                if let weatherData = try? decoder.decode(WeatherSearchResponse.self, from: results) {
                    let wea = weatherData
                    didGetWeather(wea)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
//    static func getIcon(code: String, completion: @escaping ((UIImage)-> Void)) {
//        AF.request(iconEndPoint+"10d"+"@2x.png", method: .get).validate().responseData { (response) in
//            switch response.result {
//            case .success(let data):
//                let decoder = JSONDecoder()
//                if let iconResponse = try? decoder.decode(iconResponse.self, from: data){
//                    fetchIconImage(imageURL: iconResponse.url){ image in
//                    let returnedimage = image
//
//                    completion(returnedimage)
//                }
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    
        
    static func getIcon(imageURL : String, completion: @escaping ((UIImage) ->Void )){
        let url = "https://www.openweathermap.org/img/wn/"+imageURL+"@2x.png"
        let encodedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        AF.request(encodedUrl, method: .get).validate().responseData{ (response) in
            switch response.result {
            case .success(let data):
                if let image = UIImage(data: data){
                completion(image)
            }
            case .failure(let error):
                print(error.localizedDescription)
        }
    }
}

}
