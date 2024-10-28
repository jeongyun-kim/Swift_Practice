import SwiftUI
import NetworkKit

public struct ContentView: View {
    public init() {}

    public var body: some View {
        Text("Hello, World!")
            .padding()
            .task {
                let query = EmailQuery(email: "kkanyo04@naver.com")
                NetworkService.shared.postValidationEmail(email: EmailQuery(email: "kkanyo04@naver.com")) { result in
                    switch result {
                    case .success(let value):
                        print(value)
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
