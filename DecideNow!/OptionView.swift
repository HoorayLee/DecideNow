//
//  AllOptionsView.swift
//  DecideNow!
//
//  Created by 李洪锐 on 2024/9/13.
//
import SwiftUI

struct OptionView: View {
    let option: Option
    var body: some View {
        VStack(alignment: .leading) {
            Text(option.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            .font(.caption)
        }
        .padding()
        .foregroundColor(option.theme.accentColor)
    }
}

struct OptionView_Previews: PreviewProvider {
    static var previews: some View {
        OptionView(option: Option.emptyOption)
            .background(Option.emptyOption.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
