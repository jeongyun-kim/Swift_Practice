// Copyright © 2024 jeongyun. All rights reserved.

import Foundation
import Alamofire

public class NetworkService {
    private init() { }
    public static let shared = NetworkService()
    
    public func printF() {
        print("F")
    }
}
