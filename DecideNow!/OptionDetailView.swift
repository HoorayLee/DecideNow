import SwiftUI

struct OptionDetailView: View {
    @Binding var option: Option
    @Binding var options: [Option]

    @State private var editingOption = Option.emptyOption.getCopy()
    @State private var editingOptions = [Option.emptyOption]
    @State private var isPresentingEditView = false
    @State private var isShowingDeletingAlert = false
    @State private var isShowingDeletedAlert = false
    var body: some View {
        List {
            Section(header: Text("Your option")) {
                Text("\(option.title)")
                HStack {
                    Label("Color", systemImage: "paintpalette")
                    Spacer()
                    Text(option.theme.name)
                        .padding(4)
                        .foregroundColor(option.theme.accentColor)
                        .background(option.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
                Text("\(option.id)")
            }
        }
        .navigationTitle(option.title)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                editingOption = option.getCopy()
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                OptionEditView(option: $editingOption)
                    .navigationTitle(option.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                options = options.filter(){!$0.equals(option: option)}
                                options.append(editingOption)
                                saveOptions(options: options)
                            }
                        }
                    }
            }
        }
        VStack{
            Button("Remove", role: .destructive) {
                isShowingDeletingAlert = true
            }
            .alert("Delete the option \(option.title) ?", isPresented: $isShowingDeletingAlert) {
                Button("Yes", role: .destructive) {
                    editingOptions = options.filter(){!$0.equals(option: option)}
                    options = editingOptions
                    saveOptions(options: options)
                    isShowingDeletedAlert = true
//                    AlertView(options: $options).offset(x: 0, y: isShowingDeletedAlert ? 0:150)
                }
                Button("Cancel", role: .cancel) {}
            }
            AlertView(options: $options).offset(x: 0, y: isShowingDeletedAlert ? 0:150)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OptionDetailView(option: .constant(Option.emptyOption), options: .constant(Option.sampleOptions))
        }
    }
}

func saveOptions(options: [Option]) {
    let encoder = JSONEncoder()
    do {
        let data = try encoder.encode(options)
        UserDefaults.standard.set(data, forKey: "options")
    } catch {
        print("Error encoding options: \(error)")
    }
}
