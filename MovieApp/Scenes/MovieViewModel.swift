import Foundation
import Combine
@MainActor
class MovieViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var loading: Bool = true
    private var cancellables: Set<AnyCancellable> = []
    func fetchMovies() {
        APIManager.shared.fetchData()
            .sink { result in
                switch result {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
                self.loading = false
            } receiveValue: { movieArr in
                self.movies = movieArr
            }
            .store(in: &cancellables)
    }
}
