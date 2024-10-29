//
//  FeatureView.swift
//  Feature
//
//  Created by 김정윤 on 10/29/24.
//

import SwiftUI
import LoginFeature

public struct FeatureView: View {
    public init() { }
    public var body: some View {
        NavigationStack {
            OnboardingView()
        }
    }
}

#Preview {
    FeatureView()
}
