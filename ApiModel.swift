//
//  ApiModel.swift
//  catchesapp
//
//  Created by Ruzanna Ghazaryan on 6/20/18.
//

import Foundation

struct ApiModel {
    struct UserProfile: Decodable {
        let firstName: String
        let lastName: String
        let username: String
        let email: String
    }
    
    struct UpdateProfileRequest: Encodable {
        let countryCode:String?
        let dateOfBirth: String?
        let gender:String?
        let firstName: String?
        let lastName: String?
        let bio: String?
        let website: String?
        let profilePicturePath:String?
        let coverPhotoPath:String?
        let facebookProfile: String?
        let instagramProfile:String?
        let twitterProfile :String?
        let phone:String?
        let brandBio: BrandBio?
        let influencerBio: InfluencerBio?
        let name : String?
        
        init(countryCode:String? = nil, dateOfBirth: String? = nil,gender:String? = nil, firstName: String? = nil, lastName: String? = nil, bio: String? = nil, website: String? = nil, profilePicturePath:String? = nil, coverPhotoPath:String? = nil, facebookProfile: String? = nil, instagramProfile:String? = nil, twitterProfile :String? = nil, phone:String? = nil, brandBio: BrandBio? = nil, influencerBio: InfluencerBio? = nil, name : String? = nil) {
            self.countryCode = countryCode
            self.dateOfBirth = dateOfBirth
            self.gender = gender
            self.firstName = firstName
            self.lastName = lastName
            self.bio = bio
            self.website = website
            self.profilePicturePath = profilePicturePath
            self.coverPhotoPath = coverPhotoPath
            self.facebookProfile = facebookProfile
            self.instagramProfile = instagramProfile
            self.twitterProfile = twitterProfile
            self.phone = phone
            self.brandBio = brandBio
            self.influencerBio = influencerBio
            self.name = name
        }
        
    }

    struct Post: Decodable {
        let id: String
        let userId: String
        let imageUrl: URL?
        let smallImageUrl: URL?
    }

    struct Token: Codable {
        let accessToken: String
        let refreshToken: String
        let accessTokenExpiresAt: Date
        let refreshTokenExpiresAt: Date
        let userId: String
    }

    enum SocialAccountProvider: String, Encodable {
        case instagram = "INSTAGRAM"
        case facebook = "FACEBOOK"
        case google = "GOOGLE"
    }
    
    struct SocialAccount: Encodable {
        let provider: SocialAccountProvider
        let token: String
    }

    struct SignIn {
        struct Credentials: Encodable {
            let username: String
            let password: String
        }
        
        struct ChangePassword: Encodable {
            let currentPassword: String
            let newPassword: String
        }
        
        struct ResetPassword: Encodable {
            let code: String
            let newPassword: String
        }

        struct Verification: Encodable {
            let code: String
        }
        
        struct Token: Encodable {
            let refreshToken: String
        }
    }

    struct SignUp {
        struct UserInfo: Encodable {
            let countryCode:String
            let dateOfBirth: String
            let gender:String?
            let firstName: String
            let lastName: String
            let username: String
            let email: String
            let password: String
            let referrer:String?
        }
        
        struct InfluencerRequest: Encodable {
            let instagramProfile: String?
            let youtubeProfile:String?
        }

        struct SocialUserInfo: Encodable {
            let countryCode:String?
            let dateOfBirth: String?
            let gender:String?
            let firstName: String?
            let lastName: String?
            let username: String?
            let email: String?
            let socialAccount: ApiModel.SocialAccount
            let referrer:String?
        }
    }

    struct CreatePostRequest: Encodable {
        struct Media: Encodable {
            struct Size: Encodable {
                let width: Int
                let height: Int
            }
            let type: String
            let size: Size
            let duration: Int?
            let imagePath: String
            let videoPath: String
        }

        let description: String?
        let audioDescriptionPath: String?
        let media: [Media]?
        let hashtags: [String]?
        let styleIds: [String]?
        let productPartNumbers: [String]?
        let gender: String?
    }
    
    
    struct EditPostRequest: Encodable {
        let description: String?
        let audioDescriptionPath: String?
        let hashtags: [String]?
        let styleIds: [String]?
        let productPartNumbers: [String]?
    }
    
    struct CreateVideoRequest: Encodable {
        let externalUrl: String?
        let externalId: String?
        let duration: Int?
        let thumbUrl: String?
        let title: String?
        let description: String?
        let hashtags: [String]?
        let styleIds: [String]?
        let productPartNumbers: [String]?
    }
    
    struct EditVideoRequest: Encodable {
        let title: String?
        let description: String?
        let hashtags: [String]?
        let styleIds: [String]?
        let productPartNumbers: [String]?
    }

    struct CreatePostResponse: Decodable {
        struct MediaInfo: Decodable {
            let id: String
            let imageKey: String
            let videoKey: String?
        }

        let id: String
        let audioDescriptionKey: String?
        let mediaKeys: [MediaInfo]
    }
    
    struct CreateCommentRequest: Encodable {
        let comment: String?
        let hashtags: [String]?
    }
    
    struct CreateItemRequest: Encodable {
        let quantity: Int
        let refPostId: String?
        let refUserId: String?
        let sku: String
        let merchantId: Int?
    }
    
    struct CreateMessageRequest: Encodable {
        let conversationId: String
        let text: String
    }
    
    struct CreateConversationRequest: Encodable {
        let userId: String
    }

    struct CreateMeasurementsRequest: Encodable {
        let height: Int?
        let weight: Int?
        let bust: Int?
        let cup: String?
        let hips: Int?
        let chest: Int?
        let legSize: Int?
        let waist: Int?
        let eyeColor: String?
        let hair: String?
        let shoulderShape: String?
        let skin: String?
        let bodyShapes: [String]?
        
        init(height: Int? = nil, weight: Int? = nil, bust: Int? = nil, cup: String? = nil, hips: Int? = nil ,chest: Int? = nil, legSize: Int? = nil, waist: Int? = nil, eyeColor: String? = nil, hair: String? = nil, shoulderShape: String? = nil, skin: String? = nil, bodyShapes: [String]? = nil) {
            self.height = height
            self.weight = weight
            self.bust = bust
            self.cup = cup
            self.hips = hips
            self.chest = chest
            self.legSize = legSize
            self.waist = waist
            self.eyeColor = eyeColor
            self.hair = hair
            self.shoulderShape = shoulderShape
            self.skin = skin
            self.bodyShapes = bodyShapes
        }
    }
    
    struct CreateContactInfo: Encodable {
        var id: String?
        let salutation: String?
        let firstName: String?
        let lastName: String?
        let addressLine1: String?
        let addressLine2: String?
        let country: String?
        let state: String?
        let city: String?
        let zip: String?
        let phone: String?
        
        init(salutation: String, firstName: String?, lastName: String, addressLine1: String, addressLine2: String? = nil, country: String, state: String, city: String, zip: String, phone: String? = nil) {
            self.salutation = salutation
            self.firstName = firstName
            self.lastName = lastName
            self.addressLine1 = addressLine1
            self.addressLine2 = addressLine2
            self.country = country
            self.state = state
            self.city = city
            self.zip = zip
            self.phone = phone
        }
    }
    
    struct CreateShippingAddress: Encodable {
           var id: String?
        
           var shippingAddressLine1: String?
           var shippingAddressLine2: String?
           var shippingCity: String?
           var shippingCountry: String?
           var shippingCountryCode: String?
           var shippingFirstName: String?
           var shippingLastName: String?
           var shippingPhone: String?
           var shippingSalutation: String?
           var shippingState: String?
           var shippingZip: String?
           
           var billingAddressLine1: String?
           var billingAddressLine2: String?
           var billingCity: String?
           var billingCountry: String?
           var billingCountryCode: String?
           var billingFirstName: String?
           var billingLastName: String?
           var billingPhone: String?
           var billingSalutation: String?
           var billingState: String?
           var billingZip: String?
           
           
           init(shippingSalutation: String, shippingFirstName: String?, shippingLastName: String, shippingAddressLine1: String, shippingAddressLine2: String? = nil, shippingCountry: String, shippingState: String, shippingCity: String, shippingZip: String, shippingPhone: String? = nil, billingSalutation: String?, billingFirstName: String?, billingLastName: String?, billingAddressLine1: String?, billingAddressLine2: String? = nil, billingCountry: String?, billingState: String?, billingCity: String?, billingZip: String?, billingPhone: String? = nil) {
               self.shippingSalutation = shippingSalutation
               self.shippingFirstName = shippingFirstName
               self.shippingLastName = shippingLastName
               self.shippingAddressLine1 = shippingAddressLine1
               self.shippingAddressLine2 = shippingAddressLine2
               self.shippingCountry = shippingCountry
               self.shippingState = shippingState
               self.shippingCity = shippingCity
               self.shippingZip = shippingZip
               self.shippingPhone = shippingPhone
            
               self.billingSalutation = billingSalutation
               self.billingFirstName = billingFirstName
               self.billingLastName = billingLastName
               self.billingAddressLine1 = billingAddressLine1
               self.billingAddressLine2 = billingAddressLine2
               self.billingCountry = billingCountry
               self.billingState = billingState
               self.billingCity = billingCity
               self.billingZip = billingZip
               self.billingPhone = billingPhone
            
            
           }
       }
    

    struct CreateOrderRequest: Encodable {
        let billingContact: CreateContactInfo?
        let shippingContact: CreateContactInfo?
        
        init (billingContact: CreateContactInfo, shippingContact: CreateContactInfo) {
            self.billingContact = billingContact
            self.shippingContact = shippingContact
        }
    }
    
    struct CreateStyleMeasurementsRequest: Encodable {
        let arms: String?
        let armsBiceps: String?
        let bottomFit: [String]?
        let colorsDisLike: [String]?
        let colorsLike: [String]?
        let fitConcerns: [String]?
        let fitMeasurements: [FitMeasurements]?
        let garmentShoulders: String?
        let hips: String?
        let jeansFit: String?
        let jeansFits: [String]?
        let jeansRise: [String]?
        let legs: String?
        let materials: [String]?
        let musicTastes: [String]?
        let musicTaste: String?
        let patterns: [String]?
        let profession: String?
        let shirtFit: [String]?
        let shoulders: String?
        let showArms: String?
        let showBack: String?
        let showBottom: String?
        let showCleavage: String?
        let showLegs: String?
        let showMidsection: String?
        let showShoulders: String?
        let sleeveLength: String?
        let sustainableFashion: String?
        let tShirtFit: [String]?
        let topFit: [String]?
        let torso: String?
        let trouserFit: [String]?
        let trousersLength: String?
        let trousersLowerLeg: String?
        let trousersThigh: String?
        let veganFashion: String?
        let jeansStyle: [String]?
    }
    
    struct CreatePreferencesRequest: Encodable {
        let brands: [String]?
        let budget: String?
        let colors: [String]?
        let styleIds: [String]?
        let sizeIds: [String]?
        let celebIds : [String]?
        let colorsDislike : [String]?
        let struggleShopping:Bool?
        let facebook: String?
        let instagram: String?
        let pinterestBoard: String?
    }
    
    struct CreateBrandPreferencesRequest: Encodable {
        let brandType: String?
        let averageCustomerAge: String?
        let averageCustomerGender: String?
        let brandGender: String?
        let currentCountries: [String]?
        let penetrateCountries: [String]?
        let targetCustomerAge: String?
        let targetCustomerGender: String
        
    }
    
    struct CreatedDislikePostsRequest : Encodable {
        let ids : [String]
    }
    
    struct CreatedDislikeProductsRequest : Encodable {
        let ids : [String]
    }
}

