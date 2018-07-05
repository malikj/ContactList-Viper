//
//  Endpoints.swift
//  Viper-Architecture
//
//  Created by malikj on 27/06/18.
//  Copyright © 2018 malikj. All rights reserved.
//

import Foundation

struct API {
    static let baseUrl = "http://api.androidhive.info/"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints { 
    enum Posts: Endpoint {
        case fetch
        public var path: String {
            switch self {
            case .fetch: return "/contacts"
            }
        }
        public var url: String {
            switch self {
            case .fetch: return "\(API.baseUrl)\(path)"
            }
        }
    }
}
