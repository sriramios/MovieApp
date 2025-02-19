import SwiftUI
struct MovieListCell: View {
    var movie: Movie
    var body: some View {
        NavigationLink(destination: MovieDetailView(movie: movie)) {
            HStack{
                if let posterUrlStr = movie.image?.medium, let posterUrl = URL(string: posterUrlStr) {
                    AsyncImage(url: posterUrl) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: MovieAppConstants.thumbnailImageSize.width,
                           height: MovieAppConstants.thumbnailImageSize.height)
                    .cornerRadius(MovieAppConstants.padding)
                }
                VStack(alignment: .leading){
                    Text(movie.name ?? "")
                        .font(.headline)
                    Text(String(movie.rating?.average ?? 0.0))
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                .padding()
            }
            .listRowBackground(Color.clear)
        }
    }
}
struct CustomSection: View {
    var title: String?
    var body: some View {
        HStack{
            Text(title ?? "")
                .foregroundStyle(.brown)
                .font(.headline)
            
        }
        .listRowBackground(Color.gray)
    }
}
