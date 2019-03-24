//
//  DayWeatherCell.swift
//  WeatherGift
//
//  Created by Christopher Knapp on 3/23/19.
//  Copyright © 2019 Christopher Knapp. All rights reserved.
//

import UIKit

private let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE"
    return dateFormatter
}()

class DayWeatherCell: UITableViewCell {

    @IBOutlet weak var dayCellSummary: UITextView!
    @IBOutlet weak var dayCellIcon: UIImageView!
    @IBOutlet weak var dayCellWeekday: UILabel!
    @IBOutlet weak var dayCellMaxTemp: UILabel!
    @IBOutlet weak var dayCellMinTemp: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func update(with dailyForecast: WeatherLocation.DailyForecast, timeZone: String) {
        dayCellIcon.image = UIImage(named: dailyForecast.dailyIcon)
        dayCellSummary.text = dailyForecast.dailySummary
        dayCellMaxTemp.text = String(format: "%2.f", dailyForecast.dailyMaxTemp)
        dayCellMinTemp.text = String(format: "%2.f", dailyForecast.dailyMinTemp)
        
//        let usableDate = Date(timeIntervalSince1970: dailyForecast.dailyDate)
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "EEEE"
//        dateFormatter.timeZone = TimeZone(identifier: timeZone)
        let dateString = dailyForecast.dailyDate.format(timeZone: timeZone, dateFormatter: dateFormatter)
        dayCellWeekday.text = dateString
    }
    
    
}
