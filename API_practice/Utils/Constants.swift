//
//  Constants.swift
//  API_practice
//
//  Created by wooyeong kam on 2021/06/03.
//

import Foundation

enum SEGUE_ID {
    static let USER_LIST_VC = "goToUserVC"
    static let PHOTO_COLLECTION_VC = "goToPhotoVC"
}

enum API{
    static let CLIENT_ID = "bxFGrienusnCM-tg6GP7uNlc6WhzB-2tpoIU1335gfo"
    static let BASE_URL = "https://api.unsplash.com/"
}

enum NOTIFICATION{
    enum API {
        static let AUTH_FAIL = "authentification_fail"
    }
}
