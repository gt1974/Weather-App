//
//  Weath.swift
//  Weather
//
//  Created by Gordon Tran on 6/11/20.
//  Copyright © 2020 Gordon Tran. All rights reserved.
//

import UIKit

struct desc: Codable {
    var main: String
    var icon: String
    var description: String
}
struct temperature: Codable{
    var day: Double
    var min: Double
    var max: Double
}
struct weath: Codable{
    var dt: Double
    var temp: temperature
    var weather: [desc]
}
struct descr: Codable{
    var icon: String
}
struct weathe: Codable{
    var dt: Double
    var temp: Double
    var weather: [descr]
}
struct WeatherSearchResponse: Codable {
    var daily: [weath]
    var hourly: [weathe]
}
