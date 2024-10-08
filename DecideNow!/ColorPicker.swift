import Foundation
import SwiftUI

struct ColorPicker: View {
    @Binding var selection: Theme
    
    var body: some View {
        
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) { theme in
                ColorView(theme: theme)
                    .tag(theme)
            }
        }
        .pickerStyle(.wheel )
    }
}


struct ColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        ColorPicker(selection: .constant(.periwinkle))
    }
}
