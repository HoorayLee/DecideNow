import SwiftUI

struct ContentView: View {
    @State var selectedIndex = 0
    @Binding var inputOptions : [Option]
    var body: some View {
        VStack(alignment: .center) {
            Text("\(inputOptions[selectedIndex].title)")
                .font(.largeTitle)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .foregroundColor(inputOptions[selectedIndex].theme.mainColor)
            Spacer()
            HStack(alignment: .center){
                FortuneWheel(model: FortuneWheelModel(options: $inputOptions, onSpinEnd: { i in
                    selectedIndex = i
                }) )
               
            }.scaledToFit()
            Spacer()
            Spacer()
        }
        .toolbar {
            ToolbarItem {
                NavigationLink(destination: AllOptionsView(options: $inputOptions)) {
                    Text("Edit")
                }
            }
        }
        .background(
            RadialGradient(gradient: Gradient(colors: [inputOptions[selectedIndex].theme.mainColor, .black]),
                            center: .bottom, startRadius: 50, endRadius: 450)
        )
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView(inputOptions: .constant( Option.sampleOptions))
        }
    }
}
