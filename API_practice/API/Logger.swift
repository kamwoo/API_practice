//
//  Logger.swift
//  API_practice
//
//  Created by wooyeong kam on 2021/06/03.
//

import Foundation
import Alamofire

final class Logger : EventMonitor{
    
    let queue = DispatchQueue(label: "Api log")
    
    func requestDidResume(_ request: Request) {
        debugPrint(request)
    }
    
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        debugPrint(request)
    }
}
