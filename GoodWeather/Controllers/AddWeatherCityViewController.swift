//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by Mohammad Azam on 12/1/18.
//  Copyright © 2018 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {
    
    private var addCityViewModel = AddCityViewModel()
    
    @IBOutlet weak var cityNameTextField: BindingTextField!{
        didSet{
            cityNameTextField.bind {self.addCityViewModel.city = $0}
        }
    }
    
    @IBOutlet weak var StateTextField: BindingTextField!{
        didSet{
            StateTextField.bind {self.addCityViewModel.state = $0}
        }
    }
    
    @IBOutlet weak var ZipTextField: BindingTextField!{
        didSet{
            ZipTextField.bind {self.addCityViewModel.Zipcode = $0}
        }
    }
    
    var delegate: AddWeatherDelegate?
    
    @IBAction func saveCityButtonPressed() {
      
        print(self.addCityViewModel)
        
        if let city = cityNameTextField.text {
            
            let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=7d2dd8c9c5578b741c7735ad3f0d39ea&units=imperial")!
            
            let weatherResource = Resource<WeatherViewModel>(url: weatherURL) { data in
                
                let weatherVM = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
                return weatherVM
            }
            
            Webservice().load(resource: weatherResource) { [weak self] result in
                
                if let weatherVM = result {
                    
                    if let delegate = self?.delegate {
                        delegate.addWeatherDidSave(vm: weatherVM)
                        self?.dismiss(animated: true, completion: nil)
                    }
                    
                }
                
            }
            
            
        }
       
    }
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
