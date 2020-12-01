//
//  WeatherViewCell.swift
//  Weather
//
//  Created by Gordon Tran on 6/11/20.
//  Copyright © 2020 Gordon Tran. All rights reserved.
//

import UIKit

class WeatherViewCell: UITableViewCell {
    
    var tempLabel: UILabel!
    var dayLabel: UILabel!
    var tempLabel3: UILabel!
    var weatherDesc: UILabel!
    var weatherImage: UIImageView!
    var weatherImage2: UIImageView!
    var weatherImage3: UIImageView!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        tempLabel = UILabel()
        tempLabel.font = UIFont.systemFont(ofSize: 60)
        tempLabel.translatesAutoresizingMaskIntoConstraints =  false
        contentView.addSubview(tempLabel)
        
        dayLabel = UILabel()
        dayLabel.font = UIFont.systemFont(ofSize: 15)
        dayLabel.translatesAutoresizingMaskIntoConstraints =  false
        contentView.addSubview(dayLabel)
//
//        tempLabel3 = UILabel()
//        tempLabel3.font = UIFont.systemFont(ofSize: 15)
//        tempLabel3.text = "wow"
//        tempLabel3.translatesAutoresizingMaskIntoConstraints =  false
//        contentView.addSubview(tempLabel3)
        
        weatherDesc = UILabel()
        weatherDesc.font = UIFont.systemFont(ofSize: 15)
        weatherDesc.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(weatherDesc)
        
        weatherImage = UIImageView()
      //  weatherImage.image = UIImage(named: "rainy")
        weatherImage.contentMode = .scaleAspectFit
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(weatherImage)
        
//        weatherImage2 = UIImageView()
//        weatherImage2.image = UIImage(named: "rainy")
//        weatherImage2.contentMode = .scaleAspectFit
//        weatherImage2.translatesAutoresizingMaskIntoConstraints = false
//        contentView.addSubview(weatherImage2)
//
//        weatherImage3 = UIImageView()
//        weatherImage3.image = UIImage(named: "rainy")
//        weatherImage3.contentMode = .scaleAspectFit
//        weatherImage3.translatesAutoresizingMaskIntoConstraints = false
//        contentView.addSubview(weatherImage3)
         setupConstraints()
        
        
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            tempLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            tempLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            weatherImage.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -100),
            weatherImage.centerYAnchor.constraint(equalTo: tempLabel.centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            weatherDesc.topAnchor.constraint(equalTo: weatherImage.bottomAnchor),
            weatherDesc.centerXAnchor.constraint(equalTo: weatherImage.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            dayLabel.centerYAnchor.constraint(equalTo: weatherDesc.centerYAnchor),
            dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25)
        ])
//        NSLayoutConstraint.activate([
//            weatherImage3.topAnchor.constraint(equalTo: tempLabel.bottomAnchor),
//            weatherImage3.leadingAnchor.constraint(equalTo: weatherImage2.trailingAnchor, constant: 45)
//        ])
//        NSLayoutConstraint.activate([
//            tempLabel2.topAnchor.constraint(equalTo: weatherImage2.bottomAnchor),
//            tempLabel2.centerXAnchor.constraint(equalTo: weatherImage2.centerXAnchor)
//        ])
//        NSLayoutConstraint.activate([
//           tempLabel3.topAnchor.constraint(equalTo: weatherImage3.bottomAnchor),
//           tempLabel3.centerXAnchor.constraint(equalTo: weatherImage3.centerXAnchor)
//        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
