// Copyright © 2024 jeongyun. All rights reserved.

import Foundation
import Alamofire
import Moya

public class NetworkService {
    private init() { }
    public static let shared = NetworkService()
    private let provider = MoyaProvider<AuthAPI>()
    
    public func postValidationEmail(email: EmailQuery, completionHandler: @escaping (Result<Data, APIErrors>) -> Void){
        provider.request(.validationEmail(email: email)) { result in
            switch result {
            case .success(let value):
                let statusCode = value.statusCode
                guard statusCode == 200 else {
                    do {
                        let result = try JSONDecoder().decode(ErrorModel.self, from: value.data)
                        print(result)
                    } catch {
                        print("result x")
                    }
                    return
                }
                print(value)
            case .failure(let error):
                print(error)
            }
        }
    }
}
