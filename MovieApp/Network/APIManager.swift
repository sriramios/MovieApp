import SwiftUI
import Combine


class APIManager {
    static let shared = APIManager()
    func fetchData() -> AnyPublisher<[Movie], Error> {
        guard let url = URL(string: "https://api.tvmaze.com/shows") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Movie].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
