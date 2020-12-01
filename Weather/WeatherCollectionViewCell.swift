//
//  WeatherCollectionViewCell.swift
//  Weather
//
//  Created by Gordon Tran on 6/25/20.
//  Copyright © 2020 Gordon Tran. All rights reserved.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    var imageView: UIImageView!
    var tempLabel: UILabel!
    var timeLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .white
        imageView.image = UIImage(named: "rainy")
        contentView.addSubview(imageView)
        
        tempLabel = UILabel()
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.font = UIFont.systemFont(ofSize: 15)
        tempLabel.text = "88"
        contentView.addSubview(tempLabel)
        
        timeLabel = UILabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.font = UIFont.systemFont(ofSize: 15)
        timeLabel.text = "5:00"
        contentView.addSubview(timeLabel)
        setupConstraints()
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 60),
            imageView.widthAnchor.constraint(equalToConstant: 60),
            imageView.bottomAnchor.constraint(equalTo: tempLabel.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
        NSLayoutConstraint.activate([
            tempLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            tempLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            timeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
