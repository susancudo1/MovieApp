//
//  StringExtensions.swift
//  Movie
//
//  Created by Javier Susa on 27/03/21.
//

import Foundation

extension String {
    public var localized: String {
        return Localizator.sharedInstance.localize(self)
    }
}
