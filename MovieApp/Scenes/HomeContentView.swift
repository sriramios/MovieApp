import SwiftUI

struct HomeContentView: View {
    @Environment(\.appTheme) var appTheme
    @ObservedObject var viewModel = MovieViewModel()
    var body: some View {
        NavigationView {
            if viewModel.loading {
                ProgressView()
                    .progressViewStyle(.circular)
                    .padding()
            } else {
                self.loadList()
                    .navigationTitle(MovieAppLocalisationKeys.appName)
            }
        }
        .onAppear() {
            viewModel.fetchMovies()
        }
    }
    
    func loadList() -> some View {
        return List {
            ForEach(viewModel.movies) { movie in
                MovieListCell(movie: movie)
            }
        }
        .listStyle(.plain)
//        .background(appTheme.primaryColor)
    }
}


#Preview {
    HomeContentView()
}
