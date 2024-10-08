import Foundation
import SwiftUI

struct ColorView: View {
    let theme: Theme
    
    var body: some View {
        Text(theme.name)
            .frame(maxWidth: .infinity)
            .background(theme.mainColor)
            .foregroundColor(theme.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 4))
        }
}


struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(theme: .buttercup)
    }
}
