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
    
    init(id: UUID = UUID(), title: String, theme: Theme) {
        self.id = id
        self.title = title
        self.theme = theme
    }
    
    required public init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(UUID.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        theme = try values.decode(Theme.self, forKey: .theme)
    }
    
    public func equals(option: Option) -> Bool {
        return self.title == option.title && self.theme == option.theme && self.id == option.id
    }
    
    public func getCopy() -> Option {
        return Option(id: UUID(), title: self.title, theme: self.theme)
    }
}

extension Option {
    static var emptyOption: Option {
        Option(title: "E.g., Go kayak!", theme: .sky)
    }
}

extension Option {
    static let sampleOptions: [Option] =
    [
        Option(title: "Visit a friend",
                   theme: .yellow),
        Option(title: "Movie theatre",
                   theme: .orange),
        Option(title: "Bar",
                   theme: .poppy),
        Option(title: "Hiking",
                   theme: .lavender),
        Option(title: "Biking",
                   theme: .seafoam)
    ]
}


