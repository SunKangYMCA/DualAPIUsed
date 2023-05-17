//
//  User.swift
//  DualAPIUsed
//
//  Created by 강성찬 on 2023-05-11.
//

import SwiftUI

struct User: Codable, Identifiable {
    var gender: String
    var name: UserName
    var location: UserLocation
    var email: String
    var login: UserLogin
    var dob: UserDob
    var registered: UserRegistered
    var phone: String
    var cell: String
    var picture: UserPicture
    var nat: String
    
    var  fullName: String {
        name.first + " " + name.last
    }
    
    var id: String {
        login.uuid
    }
    
    var largePictureURL: URL? {
        URL(string: picture.large)
    }
    
    var mediumPictureURL: URL? {
        URL(string: picture.medium)
    }
    
    var thumbnailPictureURL: URL? {
        URL(string: picture.thumbnail)
    }
    
    static var mockUser: User {
        User(
            gender: "Male",
            name: UserName(
                title: "Mr",
                first: "Sun",
                last: "Kang"
            ),
            location: UserLocation(
                street: UserStreet(
                    number: 12,
                    name: "Dufferin"
                ),
                city: "Toronto",
                state: "Ontatio",
                country: "Canada",
                coordinates: UserCoordinates(
                    latitude: "1111",
                    longitude: "2222"
                ),
                timezone: UserTimezone(
                    offset: "+9:30",
                    description: "3333"
                )
            ),
            email: "Sun@mail.com",
            login: UserLogin(
                uuid: "12345"
            ),
            dob: UserDob(
                date: "2000.01.01",
                age: 25
            ),
            registered: UserRegistered(
                date: "2020.12.12",
                age: 22
            ),
            phone: "123-123-1234",
            cell: "234-234-2344",
            picture: UserPicture(
                large: "",
                medium: "",
                thumbnail: ""
            ),
            nat: "CA"
        )
    }
    
    
}

struct UserName: Codable {
    var title: String
    var first: String
    var last: String
}

struct UserLocation: Codable {
    var street: UserStreet
    var city: String
    var state: String
    var country: String
    var coordinates: UserCoordinates
    var timezone: UserTimezone
}

struct UserStreet: Codable {
    var number: Int
    var name: String
}

struct UserCoordinates: Codable {
    var latitude: String
    var longitude: String
}

struct UserTimezone: Codable {
    var offset: String
    var description: String
}

struct UserLogin: Codable {
    var uuid: String
}

struct UserDob: Codable {
    var date: String
    var age: Int
}

struct UserRegistered: Codable {
    var date: String
    var age: Int
}

struct UserPicture: Codable {
    var large: String
    var medium: String
    var thumbnail: String
}
