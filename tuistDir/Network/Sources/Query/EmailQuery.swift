// Copyright © 2024 jeongyun. All rights reserved.

import Foundation

public struct EmailQuery: Encodable, Sendable {
    let email: String
    
    public init(email: String) {
        self.email = email
    }
}
