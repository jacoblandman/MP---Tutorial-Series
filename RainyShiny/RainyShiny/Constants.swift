//
//  Constants.swift
//  RainyShiny
//
//  Created by Jacob Landman on 1/13/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let UNITS = "&units=imperial"
let APP_ID = "&appid="
let API_KEY = "6c7551ae498dff2b6948dea84450a01d"

// tell function we are done downloading
typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)-36\(LONGITUDE)123\(UNITS)\(APP_ID)\(API_KEY)"
