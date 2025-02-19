import SwiftUI
struct MovieAppThemeKey: EnvironmentKey {
    static let defaultValue: MovieAppTheme = MovieAppTheme()
}

struct MovieAppTheme {
    let primaryColor: Color = Color.white
    let secondaryColor: Color = Color.green
    let genreColor: Color = Color.brown.opacity(0.8)
}

extension EnvironmentValues {
    var appTheme: MovieAppTheme {
        get { self[MovieAppThemeKey.self] }
        set { self[MovieAppThemeKey.self] = newValue }
    }
}

struct MovieAppConstants {
    static let thumbnailImageSize = CGSize(width: 50, height: 75)
    static let posterImageSize: CGSize = CGSize(width: 300, height: 400)
    static let padding: CGFloat = 8.0
}

struct MovieAppLocalisationKeys {
    static let appName = "Movies"
    static let languageSubtitle = "Languages"
}

struct MovieAppFonts {
    static let titleFont: Font = .system(size: 12,
                                         weight: .bold)
}
