//
//  AlamofireManager.swift
//  API_practice
//
//  Created by wooyeong kam on 2021/06/03.
//

import Foundation
import Alamofire
import SwiftyJSON

final class AlamofireManager{
    
    static let shared = AlamofireManager()
    
    var interceptors = Interceptor(interceptors: [BaseInterceptor()])
    
    let monitors = [Logger()]
    
    var session : Session
    
    private init(){
        session = Session(interceptor: interceptors)
    }
    
    func getPhotos(searchTerm userInput : String, completion : @escaping (Result<[Photo], MyError>) -> Void){
        self.session
            .request(SearchRouter.searchPhotos(term: userInput))
            .validate(statusCode: 200...400)
            .responseJSON{ response in
                guard let responseValue = response.value else {return}
                let responseJson = JSON(responseValue)
                let jsonArray = responseJson["results"]
                var photos = [Photo]()
                
                for (index, subJson) : (String, JSON) in jsonArray {
                    let thumnail = subJson["urls"]["thumb"].string ?? ""
                    let username = subJson["urls"]["username"].string ?? ""
                    let likeCount = subJson["likes"].intValue
                    let createdAt = subJson["created"].string ?? ""
                    
                    let photoItem = Photo(thumbnail: thumnail, username: username, likesCount: likeCount, createAt: createdAt)
                    
                    photos.append(photoItem)
                }
                
                if photos.count > 0{
                    completion(.success(photos))
                }else{
                    completion(.failure(.noContent))
                }
            }
    }
    
}
