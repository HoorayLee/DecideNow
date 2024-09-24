//
//  OptionEditView.swift
//  DecideNow!
//
//  Created by 李洪锐 on 2024/9/13.
//
import SwiftUI

struct OptionEditView: View {
    @Binding var option : Option

    var body: some View {
        Form {
            Section(header: Text("Your option")) {
                TextField("Title", text: $option.title)
                Text("Note (Optional)")
            }
            Section(header: Text("Color theme")) {
                VStack{
                    ColorPicker(selection: $option.theme)
                }
            }
        }
    }
}

struct OptionEditView_Previews: PreviewProvider {
    static var previews: some View {
        OptionEditView(option: .constant( Option.emptyOption))
    }
}
