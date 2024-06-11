//
//  Constant.swift
//  WeatherClient
//
//  Created by Алина Власенко on 30.05.2024.
//

import Foundation

enum Constant {
    
    // MARK: - VIEWS
    
    // height
    static let heightOfView: CGFloat = 20.0 // feelsLikeView, humidityView, pressureView
    static let heightOfBgView: CGFloat = 158.0 // backgroundView
    static let heightOfLineView: CGFloat = 0.3// lineHumidityView, lineFeelsLikeView, lineDetailesView
    
    // width multiplier
    static let widthMultiplOfView: CGFloat = 0.9 // backgroundView, lineDetailesView, feelsLikeView, lineFeelsLikeView, humidityView, lineHumidityView, pressureView
    
    
    // MARK: - LABELS
    
    // height
    static let heightOfLabel: CGFloat = 20.0 // skyStateLabel, maxMinTempLabel, feelsLikeLabel, feelsLikeDataLabel, humidityLabel, humidityDataLabel, pressureLabel, pressureDataLabel
    static let heightOfMediumLabel: CGFloat = 30.0 // myLocationLabel, cityNameLabel
    static let heightOfTempLabel: CGFloat = 70.0 // tempLabel
    static let heightOfBlockTitleLabel: CGFloat = 16.0 // headerDetailesLabel
    
    // width multiplier
    static let widthMultiplOfLabel: CGFloat = 0.9 // myLocationLabel, cityNameLabel, tempLabel, skyStateLabel, maxMinTempLabel, headerDetailesLabel
   
    // MARK: - ICONS
    
    // height
    static let heightOfIcon: CGFloat = 20.0 // humidityIcon, pressureIcon, feelsLikeIcon
    static let widthOfIcon: CGFloat = 20.0 // humidityIcon, pressureIcon
    static let widthOfFeelsIcon: CGFloat = 14.0 // feelsLikeIcon
    
    // leading
    static let leadingFromIcon: CGFloat = 10.0 // pressureLabel, humidityLabel
    static let leadingFeelsFromIcon: CGFloat = 14.0 // feelsLikeLabel
    static let leadingFeelsVToIcon: CGFloat = 2.0 // feelsLikeIcon
    
    
    // MARK: - TOP
    static let topBetweenElements: CGFloat = 10.0 // pressureView, lineHumidityView, humidityView, lineFeelsLikeView, feelsLikeView, lineDetailesView, headerDetailesLabel, maxMinTempLabel, skyStateLabel, cityNameLabel
    static let topBetweenMainInfo: CGFloat = 20.0 // tempLabel, myLocationLabel
    static let topBetweenBlocks: CGFloat = 40.0 // backgroundView
    
    // MARK: - FONTS
    static let dataLabelFont: CGFloat = 20.0 // pressureDataLabel, humidityDataLabel, feelsLikeDataLabel, maxMinTempLabel, skyStateLabel, cityNameLabel
    static let dataLargeHeaderFont: CGFloat = 30.0 // myLocationLabel
    static let blockTitleFont: CGFloat = 14.0 // headerDetailesLabel
    static let tempLabelFont: CGFloat = 90.0 // tempLabel
    static let labelTitleFont: CGFloat = 18.0 // pressureLabel, humidityLabel, feelsLikeLabel
    
    // MARK: - AlphaComponent
    static let bgAlphaC: CGFloat = 0.1// backgroundView
    static let blockTitleAlphaC: CGFloat = 0.4 // headerDetailesLabel
    static let linesAlphaC: CGFloat = 0.3 // lineHumidityView, lineFeelsLikeView, lineDetailesView
    
    // MARK: - RADIUS
    static let bgRadius: CGFloat = 15.0 // backgroundView
    
    // MARK: - SIGNS
    static let roundedToZero: String = "%.0f"
    static let celsiusSigh = "°"
    static let highTempLabel = "H:"
    static let lowTempLabel = "L:"
    static let humSigh = "%"
    static let presSigh = "hPa"
    
    // MARK: - FONT NAME
    static let GS = "GillSans"
    static let GSLight = "GillSans-Light"
    static let GSSemiBold = "GillSans-SemiBold"
    
    // MARK: - IMG
    static let weatherBack = "weatherBack"
    static let feelsLikeImg = "thermometer.medium"
    static let humImg = "humidity.fill"
    static let pressImg = "tirepressure"
}
