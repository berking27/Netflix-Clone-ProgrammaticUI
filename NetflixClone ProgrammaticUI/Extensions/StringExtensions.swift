//
//  StringExtensions.swift
//  NetflixClone ProgrammaticUI
//
//  Created by Berkin Koca on 19.11.2023.
//

import Foundation

extension String {
     func capitalizeFirstLetter() -> String {
          return self.prefix(1).uppercased() + self.lowercased().dropFirst()
     }
}
