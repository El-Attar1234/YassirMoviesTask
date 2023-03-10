// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Movies
  internal static let movies = L10n.tr("Localizable", "movies", fallback: "Movies")
  internal enum Movie {
    /// Popularity : %@
    internal static func popularity(_ p1: Any) -> String {
      return L10n.tr("Localizable", "movie.popularity", String(describing: p1), fallback: "Popularity : %@")
    }
    /// Rating : %@ 
    internal static func rating(_ p1: Any) -> String {
      return L10n.tr("Localizable", "movie.rating", String(describing: p1), fallback: "Rating : %@ ")
    }
    /// Release Date : %@ 
    internal static func releaseDate(_ p1: Any) -> String {
      return L10n.tr("Localizable", "movie.releaseDate", String(describing: p1), fallback: "Release Date : %@ ")
    }
    /// Localizable.strings
    ///   YassirMoviesTask
    /// 
    ///   Created by Ibtikar on 27/01/2023.
    internal static func totalVotes(_ p1: Any) -> String {
      return L10n.tr("Localizable", "movie.totalVotes", String(describing: p1), fallback: "Total Votes : %@ ")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
