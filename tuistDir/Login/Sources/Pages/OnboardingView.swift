// Copyright © 2024 jeongyun. All rights reserved.

import SwiftUI
import Common

public struct OnboardingView: View {
    @State private var presentLogin = false
    public init() { }
    
    public var body: some View {
        ZStack(alignment: .top) {
            VStack {
                Text("빡공단을 사용하면 어디서나\n스터디그룹을 만들 수 있어요")
                    .frame(height: 60)
                    .padding(.horizontal, 24)
                    .padding(.top, 33)
                    .font(.system(size: 22, weight: .bold))
                Image("onboarding")
                    .padding(.top, 89)
                    .padding(.horizontal, 12)
                Spacer()
                nextButton()
            }
            .padding(.bottom, 11)
        }
        .sheet(isPresented: $presentLogin) {
            VStack(spacing: 16) {
                nextButton()
                    .overlay {
                        Image("AppleLogin")
                    }
                nextButton()
                nextButton()
                HStack(spacing: 0) {
                    Text("또는")
                    Text(" 새로 회원가입 하기")
                        .foregroundStyle(.blue)
                }
                .font(.system(size: 16, weight: .bold))
            }
            .cornerRadius(10)
            .presentationDetents([.height(290)])
            .presentationDragIndicator(.visible)
        }
    }
    
    private func nextButton() -> some View {
        Button {
            presentLogin.toggle()
        } label: {
            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Resources.primaryColor)
                    .frame(width: 323, height: 44)
                Text("시작하기")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.white)
            }
        }
    }
}

