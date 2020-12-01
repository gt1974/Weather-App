//
//  ViewController.swift
//  Weather
//
//  Created by Gordon Tran on 6/11/20.
//  Copyright © 2020 Gordon Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView: UITableView!
    var collectionView: UICollectionView!
    
    //var searchController: UISearchController!
    let cellReuse = "cellReuseIdenitifier"
    let reuseIdentifier = "cellreuse"
    let cellHeight: CGFloat = 150
    let padding: CGFloat = 10
    var forecast: [weath] = []
    var hourlyy: [weathe] = []
    
    var icon: UIImageView!
    var current: weath?
    var place: String?
    
    var tempLabel: UILabel!
    var locationLabel: UILabel!
    var descrLabel: UILabel!
    var dayOfWeekLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        updateSearchResults()
        //title = "Weather Forecast"
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = padding
        layout.minimumLineSpacing = padding
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: cellReuse)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
//        let a = Weath(temper: "109"+"°", day: "Monday", description:"Rainy")
//
//        forecast = [a,a,a,a,a]
        
        //initialize tableView
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate =  self
        tableView.register(WeatherViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        
//        searchController = UISearchController(searchResultsController: nil)
//        searchController.searchResultsUpdater = self
//        searchController.dimsBackgroundDuringPresentation = false
//        searchController.searchBar.sizeToFit()
//        searchController.searchBar.placeholder = "Search By City"
//        searchController.searchBar.delegate = self
        
       // tableView.tableHeaderView = searchController.searchBar
        tempLabel = UILabel()
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.textAlignment = .center
        tempLabel.font = UIFont.systemFont(ofSize: 80)
        view.addSubview(tempLabel)
        
        locationLabel = UILabel()
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.textAlignment = .center
        locationLabel.text = "Brooklyn"
        locationLabel.font = UIFont.systemFont(ofSize: 30)
        view.addSubview(locationLabel)
        
        descrLabel = UILabel()
        descrLabel.translatesAutoresizingMaskIntoConstraints = false
        descrLabel.textAlignment = .center
        descrLabel.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(descrLabel)
        
        dayOfWeekLabel = UILabel()
        dayOfWeekLabel.translatesAutoresizingMaskIntoConstraints = false
        dayOfWeekLabel.textAlignment = .left
        dayOfWeekLabel.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(dayOfWeekLabel)
        
        definesPresentationContext = true
        
        setupConstraints()
       // updateSearchResults()
    }
    func setupConstraints() {
           //Setup the constraints for our views
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            locationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            descrLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 5),
            descrLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            tempLabel.topAnchor.constraint(equalTo: descrLabel.bottomAnchor, constant: 10),
            tempLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            dayOfWeekLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 30),
            dayOfWeekLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
        ])
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: dayOfWeekLabel.bottomAnchor, constant: 10),
            collectionView.heightAnchor.constraint(equalToConstant: 120),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])


       }


}
//extension ViewController : UISearchBarDelegate{
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//            if let searchText = searchController.searchBar.text {
//
//            if !searchText.isEmpty {
//                NetworkManager.getWeather(fromTitle: searchText) { (wea) in
//                    self.forecast = wea
//                    DispatchQueue.main.async{
//                    self.tableView.reloadData()
//                    self.current = self.forecast[0]
//                    self.place = searchText
//                    self.tableView.tableHeaderView = self.createTableHeader(fromTitle: searchText)
//                    }
//                }
//                self.tableView.reloadData()
//                }
//
//            else {
//                self.forecast = []
//                self.tableView.reloadData()
//            }
//        }
//
//    }
//}
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! WeatherViewCell
        cell.tempLabel.text = Int(forecast[indexPath.row+1].temp.day).description + " °F"
        cell.weatherDesc.text = forecast[indexPath.row+1].weather[0].main
        let date = forecast[indexPath.row+1].dt
        cell.dayLabel.text = getDayForDate(Date(timeIntervalSince1970: date))
        let codes = forecast[indexPath.row+1].weather[0].icon
        NetworkManager.getIcon(imageURL: codes) { image in
        
            cell.weatherImage.image = image
        }
        
        cell.selectionStyle = .none
        
        //cell.configure(for: weath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecast.count-1
    }
    
}
extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func updateSearchResults() {

            NetworkManager.getWeather() { (wea) in
                
                self.forecast = wea.daily
                self.hourlyy = wea.hourly
                DispatchQueue.main.async{
                self.tableView.reloadData()
                self.updateSearchResultss()
                self.current = self.forecast[0]
                let curr = Int(self.current!.temp.day)
                self.tempLabel.text = (curr.description) + "°"
                self.descrLabel.text = self.current?.weather[0].description.capitalized
                let date = self.forecast[0].dt
                self.dayOfWeekLabel.text = self.getWeekday(Date(timeIntervalSince1970: date))
                
                //self.tableView.tableHeaderView = self.createTableHeader()
                }
            }

}
    
    func getDayForDate(_ date: Date?)-> String{
        guard let inputDate = date else{
            return ""
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d"
        return formatter.string(from: inputDate)
    }
    func getWeekday(_ date: Date?)-> String{
        guard let inputDate = date else{
            return ""
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: inputDate)
    }

    
    
//    func createTableHeader()-> UIView {
//        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))
//        headerView.backgroundColor = .white
//        let locationLabel = UILabel(frame: CGRect(x: 0, y: -50, width: view.frame.size.width, height: view.frame.size.width/2))
//        let tempLabel = UILabel(frame: CGRect(x: 10, y: 50, width: view.frame.size.width, height: view.frame.size.width/2))
//        let descLabel = UILabel(frame: CGRect(x: 0, y: -17, width: view.frame.size.width, height: view.frame.size.width/2))
//        locationLabel.textAlignment = .center
//        locationLabel.text = "Brooklyn"
//        locationLabel.font = UIFont.systemFont(ofSize: 30)
//        tempLabel.textAlignment = .center
//        headerView.addSubview(locationLabel)
//
//        let curr = Int(self.current!.temp.day)
//        tempLabel.text = (curr.description) + "°"
//        tempLabel.font = UIFont.systemFont(ofSize: 80)
//        headerView.addSubview(tempLabel)
//
//        descLabel.textAlignment = .center
//        descLabel.text = self.current?.weather[0].description.capitalized
//        descLabel.font = UIFont.systemFont(ofSize: 15)
//        headerView.addSubview(descLabel)
//
//        //collectionView.translatesAutoresizingMaskIntoConstraints = false
//        //setUpCollection()
//
//        //headerView.addSubview(collectionView)
//
//        return headerView
//    }
//
    
    
}
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(hourlyy.count)
        return hourlyy.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuse, for: indexPath) as! WeatherCollectionViewCell
        cell.tempLabel.text = Int(hourlyy[indexPath.row].temp).description + "°"
        
        let codes = hourlyy[indexPath.row].weather[0].icon
        NetworkManager.getIcon(imageURL: codes) { image in
        
        cell.imageView.image = image
        }
        let date = hourlyy[indexPath.row].dt
        cell.timeLabel.text = getTime(Date(timeIntervalSince1970: date))
        return cell
    }
    func getTime(_ date: Date?)-> String{
        guard let inputDate = date else{
            return ""
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "h a"
        return formatter.string(from: inputDate)
    }
    
    
}
extension ViewController: UICollectionViewDelegate {
    func updateSearchResultss() {
        self.collectionView.reloadData()
        
    }
}

    
        

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let size = (collectionView.frame.width)/5
        return CGSize(width: size, height: 100)
}

}

