import SwiftUI

struct AllOptionsView: View {
    @Binding var options : [Option]
    @State var newOption = Option.emptyOption
    @State private var isPresentingEditView = false
  
    var body: some View {
        VStack {
            List($options) { $option in
                NavigationLink(destination: OptionDetailView(option: $option, options: $options)) {
                    OptionView(option: option)
                }
                .listRowBackground(option.theme.mainColor)
            }
            .navigationTitle("All options")
            .toolbar {
                Button("Add") {
                    isPresentingEditView = true
                }
            }
            .sheet(isPresented: $isPresentingEditView) {
                NavigationView {
                    OptionEditView(option: $newOption)
                        .navigationTitle("Add a new option")
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    isPresentingEditView = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Done") {
                                    options.append(newOption)
                                    saveOptions(options: options)
                                    isPresentingEditView = false
                                    newOption = Option.emptyOption
                                }
                            }
                        }
                }
            }
        }
    }
}


struct AllOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        AllOptionsView(options: .constant(Option.sampleOptions))
    }
}

