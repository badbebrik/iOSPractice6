//
//  Request.swift
//  CustomNetworking
//
//  Created by Виктория Серикова on 01.12.2023.
//

import Foundation

struct Request {
    enum RequestMethod : String {
        case get = "GET"
        case postcase = "POST"
        case put = "PUT"
        case patch = "PATCH"
        case delete = "DELETE"
        case options = "OPTIONS"
    }
    
    var endpoint: Endpoint
    var method: RequestMethod
    let parameters: RequestParamenters?
    let body: Data?
    
    init(endpoint: Endpoint, method: RequestMethod, parameters: RequestParamenters? = nil, body: Data? = nil) {
        self.endpoint = endpoint
        self.method = method
        self.parameters = parameters
        self.body = body
    }
}
