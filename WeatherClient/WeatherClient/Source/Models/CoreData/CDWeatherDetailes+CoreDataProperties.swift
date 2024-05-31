//
//  CDWeatherDetailes+CoreDataProperties.swift
//  WeatherClient
//
//  Created by Алина Власенко on 30.05.2024.
//
//

import Foundation
import CoreData


extension CDWeatherDetailes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDWeatherDetailes> {
        return NSFetchRequest<CDWeatherDetailes>(entityName: "CDWeatherDetailes")
    }

    @NSManaged public var detailse: String?
    @NSManaged public var icon: String?
    @NSManaged public var id: Int32
    @NSManaged public var mainInfo: String?
    @NSManaged public var relationship: CDWeatherInfo?

}

extension CDWeatherDetailes : Identifiable {

}
