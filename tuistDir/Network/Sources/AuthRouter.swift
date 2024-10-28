// Copyright © 2024 jeongyun. All rights reserved.

import Foundation
import Moya

enum AuthAPI {
    case validationEmail(email: EmailQuery)
}

extension AuthAPI: TargetType {
    var baseURL: URL {
        return URL(string: APIKey.baseURL)!
    }
    
    var path: String {
        switch self {
        case .validationEmail:
            return "/v1/users/validation/email"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .validationEmail:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .validationEmail(let email):
            return .requestJSONEncodable(email)
        }
    }
    
    var headers: [String : String]? {
        return [APIKey.headerKey: APIKey.key, "Content-Type": "application/json"]
    }
}
