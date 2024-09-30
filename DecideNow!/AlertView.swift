import SwiftUI

struct AlertView: View {
    @Binding var options: [Option]
    
    var body: some View {
        ZStack{
            NavigationLink(destination: ContentView(inputOptions: $options)) {
                Text("Woohoo! Done!")
            }
        }
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(options: .constant([Option.emptyOption]))
    }
}
