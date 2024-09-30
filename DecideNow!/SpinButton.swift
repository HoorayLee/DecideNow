import SwiftUI


struct CustomButton: View {
    @Binding var viewModel: FortuneWheelViewModel
    var body: some View {
        Button("Click me") {
            viewModel.spinWheel()
        }
        //TODO Spin button
        //.background(Image("your_image_name"))
        .foregroundColor(.white)
        .cornerRadius(10) // Add corner radius for rounded button
    }
}
