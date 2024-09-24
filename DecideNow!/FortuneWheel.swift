//
//  FortuneWheelView.swift
//  DecideNow!
//
//  Created by 李洪锐 on 2024/9/13.
import SwiftUI

@available(macOS 11.0, *)
@available(iOS 14.0, *)

public struct FortuneWheel: View {

    private var model : FortuneWheelModel
    @StateObject private var viewModel: FortuneWheelViewModel
    
    public init(model: FortuneWheelModel) {
        self.model = model
        _viewModel = StateObject(wrappedValue: FortuneWheelViewModel(model: model))
    }
    
    public var body: some View {
        ZStack(alignment: .center) {
            GeometryReader { reader in
                ZStack(alignment: .top) {
                    ZStack(alignment: .center) {
                        SpinWheelView(options: model.$options)
                            .frame(width: reader.size.width * 9 / 10, height: reader.size.width * 9 / 10, alignment: .center)
                            .overlay(
                                RoundedRectangle(cornerRadius: reader.size.width * 9 / 20)
                                    .stroke(lineWidth: model.strokeWidth)
                                    .foregroundColor(model.strokeColor)
                            )
                            .rotationEffect(.degrees(viewModel.degree))
                            .shadow(radius: 10)
                            .gesture(
                                DragGesture().onChanged({ (value) in
                                    if value.translation.width < 0 {
                                        viewModel.degree = Double(-value.translation.width)
                                    }
                                }).onEnded({ (value) in
                                    viewModel.spinWheel()
                                })
                            )
                        SpinWheelBolt()
                    }
                    SpinWheelPointer(pointerColor: Color(hex: "75AB53")).offset(x: 0, y: -25)
                }.frame(width: reader.size.width, height: reader.size.width, alignment: .center)
            }
        }
    }
}

@available(macOS 10.15, *)
@available(iOS 13.0, *)
extension Color {
    static let spin_wheel_color: [Color] = [
        Color(hex: "FBE488"), Color(hex: "75AB53"),
        Color(hex: "D1DC59"), Color(hex: "EC9D42"),
        Color(hex: "DE6037"), Color(hex: "DA4533"),
        Color(hex: "992C4D"), Color(hex: "433589"),
        Color(hex: "4660A8"), Color(hex: "4291C8")
    ]
    
    init(hex: String, alpha: Double = 1) {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) { cString.remove(at: cString.startIndex) }
        
        let scanner = Scanner(string: cString)
        scanner.currentIndex = scanner.string.startIndex
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        self.init(.sRGB, red: Double(r) / 0xff, green: Double(g) / 0xff, blue:  Double(b) / 0xff, opacity: alpha)
    }
}
