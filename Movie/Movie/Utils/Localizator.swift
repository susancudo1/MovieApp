//
//  Localizator.swift
//  Movie
//
//  Created by Javier Susa on 27/03/21.
//

import Foundation

public protocol XIBLocalizable {
    var localizableKey: String? { get set }
}

class Localizator {

    static let sharedInstance = Localizator()

    func localize(_ string: String) -> String {
        return NSLocalizedString(string, bundle: Bundle(for: type(of: self)), comment: "")

    }
}
