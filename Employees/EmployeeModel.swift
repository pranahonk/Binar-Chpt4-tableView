//
//  EmployeeModel.swift
//  Employees
//
//  Created by Anilkumar PS  on 27/05/22.
//

import Foundation


struct Employees: Codable {
    let id : Int?
    let name : String?
    let username : String?
    let email : String?
    let profile_image : String?
    let address : Address?
    let phone : String?
    let website : String?
    let company : Companydata?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case username = "username"
        case email = "email"
        case profile_image = "profile_image"
        case address = "address"
        case phone = "phone"
        case website = "website"
        case company = "company"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        username = try values.decodeIfPresent(String.self, forKey: .username)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        profile_image = try values.decodeIfPresent(String.self, forKey: .profile_image)
        address = try values.decodeIfPresent(Address.self, forKey: .address)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        website = try values.decodeIfPresent(String.self, forKey: .website)
        company = try values.decodeIfPresent(Companydata.self, forKey: .company)
    }
     static let database = DatabaseHandler()
     func storeData()
     {
        DispatchQueue.main.async {
            guard let user = Employees.database.addToDB(EmployeeList.self) else { return  }
            user.address = address as? NSObject
            user.name = name
            user.username = username
            user.emp_Id = Int32(id!)
            user.company = company as? Company
            user.profileImg = profile_image
            user.email = email
            user.phone = phone
            user.website = website
        }
       
     }
    
}

struct Address: Codable {
    let street : String?
    let suite : String?
    let city : String?
    let zipcode : String?
    let geo : Geo?

    enum CodingKeys: String, CodingKey {

        case street = "street"
        case suite = "suite"
        case city = "city"
        case zipcode = "zipcode"
        case geo = "geo"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        street = try values.decodeIfPresent(String.self, forKey: .street)
        suite = try values.decodeIfPresent(String.self, forKey: .suite)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        zipcode = try values.decodeIfPresent(String.self, forKey: .zipcode)
        geo = try values.decodeIfPresent(Geo.self, forKey: .geo)
    }
    
    
}


struct Companydata : Codable {
    let name : String?
    let catchPhrase : String?
    let bs : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case catchPhrase = "catchPhrase"
        case bs = "bs"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        catchPhrase = try values.decodeIfPresent(String.self, forKey: .catchPhrase)
        bs = try values.decodeIfPresent(String.self, forKey: .bs)
    }

}
struct Geo : Codable {
    let lat : String?
    let lng : String?

    enum CodingKeys: String, CodingKey {

        case lat = "lat"
        case lng = "lng"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decodeIfPresent(String.self, forKey: .lat)
        lng = try values.decodeIfPresent(String.self, forKey: .lng)
    }

}
