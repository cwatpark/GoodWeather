//
//  WeatherDetailViewController.swift
//  GoodWeather
//
//  Created by Ice on 23/1/2562 BE.
//  Copyright © 2562 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class WeatherDetailViewController: UIViewController{
    
    @IBOutlet weak var cityNameLabel:UILabel!
    @IBOutlet weak var currentTempLabel:UILabel!
    @IBOutlet weak var maxTempLabel:UILabel!
    @IBOutlet weak var minTempLabel:UILabel!
    
    var weatherViewModel:WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if let weatherVM = self.weatherViewModel{
        
        self.cityNameLabel.text = weatherVM.name
        self.currentTempLabel.text = weatherVM.currentTemperature.temperature.formatAsDegree
        
        }
    }
    
}
