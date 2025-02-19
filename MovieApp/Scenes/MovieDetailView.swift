import SwiftUI
struct MovieDetailView: View {
    @Environment(\.appTheme) var appTheme
    let movie: Movie
    var body: some View {
        ScrollView  {
            VStack(alignment: .leading) {
                MovieImageView(moviewImageUrk: movie.image?.original)
                HTMLTextView(text: movie.summary)
                    .padding(.horizontal, MovieAppConstants.padding) // Padding around the text view
                    .clipped()
                GenresView(genres: movie.genres)
                    .padding(MovieAppConstants.padding)
                VStack(alignment: .leading) {
                    HStack() {
                        Text(MovieAppLocalisationKeys.languageSubtitle)
                            .font(MovieAppFonts.titleFont)
                            .fontWeight(.bold)
                            .padding(.top, MovieAppConstants.padding)
                            .padding(.bottom, MovieAppConstants.padding)
                            .padding(.leading, MovieAppConstants.padding)
                        Text(movie.language ?? "")
                            .font(MovieAppFonts.titleFont)
                            .fontWeight(.light)
                            .padding(.top, MovieAppConstants.padding)
                            .padding(.bottom, MovieAppConstants.padding)
                            .padding(.leading, MovieAppConstants.padding)
                        
                    }
                }
                .padding(MovieAppConstants.padding)
            }
            .padding(.vertical, MovieAppConstants.padding) // Optional: Add vertical padding if needed
        }
        .background(appTheme.primaryColor)
        .navigationTitle(movie.name ?? "")
        .navigationBarTitleDisplayMode(.inline)
    }
}
struct HTMLTextView: UIViewRepresentable {
    var text: String?
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textAlignment = .justified
        textView.dataDetectorTypes = .link
        textView.showsVerticalScrollIndicator = false
        textView.showsHorizontalScrollIndicator = false
        textView.textContainer.lineBreakMode = .byWordWrapping
        textView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        textView.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        textView.font = UIFont.systemFont(ofSize: 24)
        textView.backgroundColor = .clear
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        if let data = text?.data(using: .utf8) {
            do {
                let attributedString = try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
                uiView.attributedText = attributedString
            } catch {
                print("Error parsing HTML: \(error)")
            }
        }
    }
}
struct MovieImageView: View {
    var moviewImageUrk: String?
    var body: some View {
        VStack {
            if let posterUrlStr = moviewImageUrk, let posterUrl = URL(string: posterUrlStr) {
                AsyncImage(url: posterUrl) { image in
                    image.resizable().scaledToFit()
                        .cornerRadius(MovieAppConstants.padding)
                        .shadow(radius: MovieAppConstants.padding)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: MovieAppConstants.posterImageSize.width,
                       height:  MovieAppConstants.posterImageSize.height)
                .cornerRadius(MovieAppConstants.padding)
            }
        }
        .frame(maxWidth: .infinity)
    }
}
struct GenresView: View {
    @Environment(\.appTheme) var appTheme
    var genres: [String]?
    private let columns = [
      GridItem(.flexible()),
      GridItem(.flexible()),
      GridItem(.flexible()),
      GridItem(.flexible()),
      GridItem(.flexible())
    ]
    var body: some View {
        LazyVGrid(columns: columns, spacing: 2) {
            ForEach( genres ?? [] , id: \.self, content: { item in
                Text(item).font(MovieAppFonts.titleFont)
                    .padding(MovieAppConstants.padding) // Padding at the top
                    .background(appTheme.genreColor)
                    .cornerRadius(MovieAppConstants.padding)
            })
        }
    }
}


#Preview {
    let images = Images(original:"https://static.tvmaze.com/uploads/images/original_untouched/81/202627.jpg",
                       medium: "https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg")
    let movie = Movie(id: 1,
                      name: "Under the Dome",
                      summary: """
    <p><b>Under the Dome</b> is the story of a small town that is suddenly and inexplicably sealed off from the rest of the world by an enormous transparent dome. The town's inhabitants must deal with surviving the post-apocalyptic conditions while searching for answers about the dome, where it came from and if and when it will go away.</p>
    <p><i>Additional Information:</i> The series explores survival in isolation, and the impact of the dome on social dynamics.</p>
    <p><i>Another paragraph for testing long text...</i> This text will simulate multiple lines of content that should expand the UITextView correctly.</p>
    """, image: images, genres: [
        "Drama",
        "Science-Fiction",
        "Thriller"
    ], language: "English")
    MovieDetailView(movie: movie)
}
