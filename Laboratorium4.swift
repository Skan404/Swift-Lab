import Foundation

struct City {
    let id: Int
    let name: String
    let description: String
    let latitude: Double
    let longitude: Double
    let keywords: [String]
}

class CityManager {
    var cities: [City]
    
    init() {
        self.cities = [
 City(id: 1, name: "New York", description: "NY", latitude: 40.7128, longitude: -74.0060, keywords: ["city", "culture", "nightlife"]),
    City(id: 2, name: "Los Angeles", description: "City of Angels", latitude: 34.0522, longitude: -118.2437, keywords: ["city", "entertainment", "beach"]),
    City(id: 3, name: "Chicago", description: "Jordans City", latitude: 41.8781, longitude: -87.6298, keywords: ["city", "culture", "food"]),
    City(id: 4, name: "San Francisco", description: "Golden Gate City", latitude: 37.7749, longitude: -122.4194, keywords: ["city", "culture", "tech"]),
    City(id: 5, name: "Miami", description: "Beaches and palms", latitude: 25.7617, longitude: -80.1918, keywords: ["city", "beach", "nightlife"]),
    City(id: 6, name: "Boston", description: "Bean Town", latitude: 42.3601, longitude: -71.0589, keywords: ["city", "history", "culture"]),
    City(id: 7, name: "Seattle", description: "Emerald City", latitude: 47.6062, longitude: -122.3321, keywords: ["city", "tech", "nature"]),
    City(id: 8, name: "Austin", description: "Live Music Capital", latitude: 30.2672, longitude: -97.7431, keywords: ["city", "music", "food"]),
    City(id: 9, name: "Denver", description: "Mile High City", latitude: 39.7392, longitude: -104.9903, keywords: ["city", "outdoor", "mountains"]),
    City(id: 10, name: "Las Vegas", description: "Sin City", latitude: 36.1699, longitude: -115.1398, keywords: ["city", "entertainment", "nightlife"]),
    City(id: 11, name: "Orlando", description: "The Theme Park Capital", latitude: 28.5383, longitude: -81.3792, keywords: ["city", "theme park", "family"]),
    City(id: 12, name: "Washington, D.C.", description: "The Capital", latitude: 38.9072, longitude: -77.0369, keywords: ["city", "politics", "history"]),
    City(id: 13, name: "Philadelphia", description: "The City of Brotherly Love", latitude: 39.9526, longitude: -75.1652, keywords: ["city", "history", "culture"]),
    City(id: 14, name: "San Diego", description: "America's Finest City", latitude: 32.7157, longitude: -117.1611, keywords: ["city", "beach", "family"]),
    City(id: 15, name: "Atlanta", description: "The ATL", latitude: 33.7490, longitude: -84.3880, keywords: ["city", "culture", "sports"]),
    City(id: 16, name: "Dallas", description: "Big D", latitude: 32.7767, longitude: -96.7970, keywords: ["city", "business", "culture"]),
    City(id: 17, name: "Houston", description: "Space City", latitude: 29.7604, longitude: -95.3698, keywords: ["city", "space", "culture"]),
    City(id: 18, name: "Nashville", description: "Music City", latitude: 36.1627, longitude: -86.7816, keywords: ["city", "music", "culture"]),
    City(id: 19, name: "New Orleans", description: "The Big Easy", latitude: 29.9511, longitude: -90.0715, keywords: ["city", "music", "food"]),
    City(id: 20, name: "Portland", description: "The City of Roses", latitude: 45.5051, longitude: -122.6750, keywords: ["city", "nature", "culture"])

        ]
    }
    
    func searchByName(name: String) -> [City] {
        return cities.filter { $0.name.lowercased().contains(name.lowercased()) }
    }
    
    func searchByKeyword(keyword: String) -> [City] {
        return cities.filter { $0.keywords.contains(keyword.lowercased()) }
    }

    func calculateDistance(city1: City, city2: City) -> Double {
        let earthRadius = 6371.0 // Promień Ziemi w kilometrach
        let lat1 = city1.latitude.degreesToRadians
        let lon1 = city1.longitude.degreesToRadians
        let lat2 = city2.latitude.degreesToRadians
        let lon2 = city2.longitude.degreesToRadians
        
        let dlon = lon2 - lon1
        let dlat = lat2 - lat1
        
        let a = sin(dlat / 2) * sin(dlat / 2) + cos(lat1) * cos(lat2) * sin(dlon / 2) * sin(dlon / 2)
        let c = 2 * atan2(sqrt(a), sqrt(1 - a))
        
        let distance = earthRadius * c
        return distance
    }
    
    func findClosestAndFarthestCity(userLatitude: Double, userLongitude: Double) -> (City, City) {
        var closestCity: City?
        var farthestCity: City?
        var closestDistance = Double.greatestFiniteMagnitude
        var farthestDistance = 0.0
        
        for city in cities {
            let distance = calculateDistance(city1: city, city2: City(id: 0, name: "", description: "", latitude: userLatitude, longitude: userLongitude, keywords: []))
            if distance < closestDistance {
                closestDistance = distance
                closestCity = city
            }
            if distance > farthestDistance {
                farthestDistance = distance
                farthestCity = city
            }
        }
        
        return (closestCity!, farthestCity!)
    }
    
    func displayTwoFarthestCities() -> (City, City) {
        var farthestCities: (City, City) = (cities[0], cities[1])
        var farthestDistance = 0.0
        
        for i in 0..<cities.count {
            for j in i+1..<cities.count {
                let distance = calculateDistance(city1: cities[i], city2: cities[j])
                if distance > farthestDistance {
                    farthestDistance = distance
                    farthestCities = (cities[i], cities[j])
                }
            }
        }
        
        return farthestCities
    }
}

extension Double {
    var degreesToRadians: Double { return self * .pi / 180 }
    var radiansToDegrees: Double { return self * 180 / .pi }
}

let cityManager = CityManager()
let searchedCities = cityManager.searchByName(name: "Los")
print("Cities containing 'Los':", searchedCities.map { $0.name })

let keywordCities = cityManager.searchByKeyword(keyword: "city")
print("Cities with keyword 'city':", keywordCities.map { $0.name })

let (closestCity, farthestCity) = cityManager.findClosestAndFarthestCity(userLatitude: 40.7128, userLongitude: -74.0060)
print("Closest city to user:", closestCity.name)
print("Farthest city from user:", farthestCity.name)

let (firstFarthest, secondFarthest) = cityManager.displayTwoFarthestCities()
print("First farthest city:", firstFarthest.name)
print("Second farthest city:", secondFarthest.name)
