//
//  Extensions.swift
//  Netflix_clon
//
//  Created by Amit Sharan on 18/02/23.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {return self.prefix(1).uppercased() + self.lowercased().dropFirst()
        
    }
}
