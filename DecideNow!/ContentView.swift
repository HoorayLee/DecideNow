//
//  ContentView.swift
//  DecideNow!
//
//  Created by 李洪锐 on 2024/9/12.
//

import SwiftUI

struct ContentView: View {
    @State var selectedIndex = 0
    @Binding var inputOptions : [Option]
    var body: some View {
        VStack(alignment: .center) {
            Text("\(inputOptions[selectedIndex].title)")
                .font(.title)
                .fontWeight(.semibold)
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
            }}
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView(inputOptions: .constant( Option.sampleOptions))
        }
    }
}
