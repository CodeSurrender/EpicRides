//
//  CarsModel.swift
//  EliteShowroom
//
//  Created by Cole on 07/06/2022.
//  Copyright © 2022 Cole. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let makeList: [MakeList]
    let pagination: Pagination
}

// MARK: - MakeList
struct MakeList: Codable {
    let id: Int
    let name: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "imageUrl"
    }
}

// MARK: - Pagination
struct Pagination: Codable {
    let total, currentPage, pageSize: Int
}

//API 2
// MARK: - Welcome
struct Welcome2: Codable {
    let result: [Result]
    let pagination: Pagination2
}

// MARK: - Pagination
struct Pagination2: Codable {
    let total, currentPage, pageSize: Int
}

// MARK: - Result
struct Result: Codable {
    let id, title: String
    let imageURL: String
    let year: Int
    let city, state: String
    let hasWarranty: Bool
    let marketplacePrice, marketplaceOldPrice: Int
    let hasFinancing: Bool
    let mileage: Int
    let mileageUnit: MileageUnit
    let installment: Double
    let depositReceived: Bool
    let loanValue: Double
    let websiteURL: String
    let stats: Stats
    let bodyTypeID: String
    let sold, hasThreeDImage: Bool
    let transmission: Transmission
    let marketplaceVisibleDate: String
    let sellingCondition: SellingCondition?
    let fuelType: FuelType?
    let gradeScore: Double?
    let licensePlate: String?
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case imageURL = "imageUrl"
        case year, city, state, hasWarranty, marketplacePrice, marketplaceOldPrice, hasFinancing, mileage, mileageUnit, installment, depositReceived, loanValue
        case websiteURL = "websiteUrl"
        case stats
        case bodyTypeID = "bodyTypeId"
        case sold, hasThreeDImage, transmission, marketplaceVisibleDate, sellingCondition, fuelType, gradeScore, licensePlate
    }
}

enum FuelType: String, Codable {
    case diesel = "diesel"
    case electric = "electric"
    case hybrid = "hybrid"
    case petrol = "petrol"
}

enum MileageUnit: String, Codable {
    case km = "km"
    case miles = "miles"
}

enum SellingCondition: String, Codable {
    case foreign = "foreign"
    case local = "local"
    case new = "new"
}

// MARK: - Stats
struct Stats: Codable {
    let webViewCount, webViewerCount, interestCount, testDriveCount: Int
    let appViewCount, appViewerCount, processedLoanCount: Int
}

enum Transmission: String, Codable {
    case automatic = "automatic"
    case duplex = "duplex"
    case manual = "manual"
}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)
//API 3
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)


// MARK: - Welcome
struct Welcome3: Codable {
    let features, carFeatures, modelFeatures: [JSONAny]?
    let damageMedia: [DamageMedia]?
    let id: String?
    let year: Int?
    let insured: Bool?
    let mileage: Int?
    let vin: String?
    let marketplacePrice: Int?
    let marketplaceVisible: Bool?
    let marketplaceVisibleDate: String?
    let isFeatured: Bool?
    let imageURL: String?
    let model: Model?
    let state, country, ownerType, transmission: String?
    let fuelType: String?
    let category: Category?
    let sellingCondition: String?
    let bodyType: BodyType?
    let city: String?
    let marketplaceOldPrice: Int?
    let createdAt, updatedAt, mileageUnit: String?
    let hasWarranty, hasFinancing: Bool?
    let interiorColor, exteriorColor, engineType: String?
    let gradeScore: Double?
    let installment: Int?
    let depositReceived: Bool?
    let loanValue: Double?
    let websiteURL: String?
    let sold, hasThreeDImage: Bool?
    let inspectorDetails: InspectorDetails?
    let carName: String?
    let financingSettings: FinancingSettings?
    
    enum CodingKeys: String, CodingKey {
        case features, carFeatures, modelFeatures, damageMedia, id, year, insured, mileage, vin, marketplacePrice, marketplaceVisible, marketplaceVisibleDate, isFeatured
        case imageURL
        case model, state, country, ownerType, transmission, fuelType, category, sellingCondition, bodyType, city, marketplaceOldPrice, createdAt, updatedAt, mileageUnit, hasWarranty, hasFinancing, interiorColor, exteriorColor, engineType, gradeScore, installment, depositReceived, loanValue
        case websiteURL
        case sold, hasThreeDImage, inspectorDetails, carName, financingSettings
    }
}

// MARK: - BodyType
struct BodyType: Codable {
    let id: Int?
    let name: String?
    let imageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL
    }
}

// MARK: - Category
struct Category: Codable {
    let id: Int?
    let name: String?
}

// MARK: - DamageMedia
struct DamageMedia: Codable {
    let inspectionItems: [InspectionItem]?
    let name: String?
}

// MARK: - InspectionItem
struct InspectionItem: Codable {
    let medias: [Media]?
    let name, comment: String?
    let response: Response?
    let condition: String?
}

// MARK: - Media
struct Media: Codable {
    let url: String?
}

enum Response: String, Codable {
    case bad = "bad"
}

// MARK: - FinancingSettings
struct FinancingSettings: Codable {
    let loanCalculator: LoanCalculator?
}

// MARK: - LoanCalculator
struct LoanCalculator: Codable {
    let loanPercentage: Double?
    let ranges: Ranges?
    let defaultValues: DefaultValues?
}

// MARK: - DefaultValues
struct DefaultValues: Codable {
    let interestRate, downPayment: Double?
    let tenure: Int?
}

// MARK: - Ranges
struct Ranges: Codable {
    let minInterestRate, maxInterestRate, minDownPayment, maxDownPayment: Double?
    let tenure: Int?
}

// MARK: - InspectorDetails
struct InspectorDetails: Codable {
    let inspectedMakes: [JSONAny]?
    let totalInspection: Int?
}

// MARK: - Model
struct Model: Codable {
    let modelFeatures: [JSONAny]?
    let id: Int?
    let name, imageURL, wheelType, series: String?
    let make: BodyType?
    let popular: Bool?
    
    enum CodingKeys: String, CodingKey {
        case modelFeatures, id, name
        case imageURL
        case wheelType, series, make, popular
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String
    
    required init?(intValue: Int) {
        return nil
    }
    
    required init?(stringValue: String) {
        key = stringValue
    }
    
    var intValue: Int? {
        return nil
    }
    
    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {
    
    let value: Any
    
    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }
    
    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }
    
    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }
    
    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }
    
    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }
    
    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}

//API 4

// MARK: - Welcome
struct Welcome4: Codable {
    let carMediaList: [CarMediaList]
    let pagination: Pagination4
}

// MARK: - CarMediaList
struct CarMediaList: Codable {
    let id: Int
    let name: String
    let url: String
    let createdAt, type: String
}

// MARK: - Pagination
struct Pagination4: Codable {
    let total, currentPage, pageSize: Int
}

