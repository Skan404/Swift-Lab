import Foundation

enum MediaType {
    case video, photo, music
}

struct Media {
    var type: MediaType
    var url: String
}

class Profile {
    var name: String
    var profilePictureURL: String
    
    init(name: String, profilePictureURL: String) {
        self.name = name
        self.profilePictureURL = profilePictureURL
    }
}

class FeedItem {
    var profile: Profile
    var media: Media
    var date: Date
    var numberOfLikes: Int
    
    init(profile: Profile, media: Media, date: Date, numberOfLikes: Int) {
        self.profile = profile
        self.media = media
        self.date = date
        self.numberOfLikes = numberOfLikes
    }
    

    func likesToDisplay() -> String {
        if numberOfLikes >= 1000 {
            return "\(numberOfLikes / 1000)k"
        } else {
            return "\(numberOfLikes)"
        }
    }
    
    func dateToDisplay() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.string(from: date)
    }
}

let profile1 = Profile(name: "Alice", profilePictureURL: "https://example.com/alice.jpg")
let media1 = Media(type: .photo, url: "https://example.com/photo.jpg")
let feedItem1 = FeedItem(profile: profile1, media: media1, date: Date(), numberOfLikes: 413000)

print("Profile name: \(feedItem1.profile.name) | Media type: \(feedItem1.media.type) | Date: \(feedItem1.dateToDisplay()) | Number of likes: \(feedItem1.likesToDisplay())")
