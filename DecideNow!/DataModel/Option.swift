//
//  Option.swift
//  DecideNow!
//
//  Created by 李洪锐 on 2024/9/12.
//

import Foundation
import SwiftUI

public class Option: Identifiable, Codable, Hashable {
    public static func == (lhs: Option, rhs: Option) -> Bool {
        return lhs.equals(option: rhs)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public let id: UUID
    var title: String
    var theme: Theme
    var weight: Int32
    
    init(id: UUID = UUID(), title: String, theme: Theme, weight: Int32) {
        self.id = id
        self.title = title
        self.theme = theme
        self.weight = weight
    }
    
    required public init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(UUID.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        theme = try values.decode(Theme.self, forKey: .theme)
        weight = try values.decode(Int32.self, forKey: .weight)
    }
    
    public func equals(option: Option) -> Bool {
        return self.title == option.title
        && self.theme == option.theme
        && self.id == option.id
        && self.weight == option.weight
    }
    
    public func getCopy() -> Option {
        return Option(id: UUID(), title: self.title, theme: self.theme, weight: self.weight)
    }
}

extension Option {
    static var emptyOption: Option {
        Option(title: "E.g., Go kayak!", theme: .sky, weight: 1)
    }
}

extension Option {
    static let sampleOptions: [Option] =
    [
        Option(title: "Visit a friend",
               theme: .yellow, weight: 1),
        Option(title: "Movie theatre",
               theme: .orange, weight: 1),
        Option(title: "Bar",
                   theme: .poppy, weight: 1),
        Option(title: "Hiking",
                   theme: .lavender, weight: 1),
        Option(title: "Biking",
                   theme: .seafoam, weight: 1)
    ]
}


