//
//  WeatherCell.swift
//  RainyShiny
//
//  Created by Jacob Landman on 1/13/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var lowTemperatureLabel: UILabel!
    @IBOutlet weak var highTemperatureLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(forecast: Forecast) {
        lowTemperatureLabel.text = "\(forecast.lowTemp)"
        highTemperatureLabel.text = "\(forecast.highTemp)"
        weatherTypeLabel.text = forecast.weatherType
        dayLabel.text = forecast.date
        weatherImage.image = UIImage(named: "\(forecast.weatherType) Mini")
    }

}
