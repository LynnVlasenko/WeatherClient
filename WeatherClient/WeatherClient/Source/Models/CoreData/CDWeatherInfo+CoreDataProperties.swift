//
//  CDWeatherInfo+CoreDataProperties.swift
//  WeatherClient
//
//  Created by Алина Власенко on 30.05.2024.
//
//

import Foundation
import CoreData


extension CDWeatherInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDWeatherInfo> {
        return NSFetchRequest<CDWeatherInfo>(entityName: "CDWeatherInfo")
    }

    @NSManaged public var cityName: String?
    @NSManaged public var id: Int32
    @NSManaged public var temp: Double
    @NSManaged public var tempMax: Double
    @NSManaged public var tempMin: Double
    @NSManaged public var pressure: Int32
    @NSManaged public var humidity: Int32
    @NSManaged public var tempFeelsLike: Double
    @NSManaged public var relationship: NSSet?

}

// MARK: Generated accessors for relationship
extension CDWeatherInfo {

    @objc(addRelationshipObject:)
    @NSManaged public func addToRelationship(_ value: CDWeatherDetailes)

    @objc(removeRelationshipObject:)
    @NSManaged public func removeFromRelationship(_ value: CDWeatherDetailes)

    @objc(addRelationship:)
    @NSManaged public func addToRelationship(_ values: NSSet)

    @objc(removeRelationship:)
    @NSManaged public func removeFromRelationship(_ values: NSSet)

}

extension CDWeatherInfo : Identifiable {

}
