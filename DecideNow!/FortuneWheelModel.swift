//
//  FortuneWheelModel.swift
//  DecideNow!
//
//  Created by 李洪锐 on 2024/9/13.
//
import SwiftUI

@available(macOS 10.15, *)
@available(iOS 13.0, *)
public class FortuneWheelModel: ObservableObject {
    @Binding public var options: [Option]
    let onSpinEnd: ((Int) -> ())?
    let pointerColor: Color
    let strokeWidth: CGFloat
    let strokeColor: Color
    let animDuration: Double
    let animation: Animation
    let getWheelItemIndex: (() -> (Int))?
    public init(
        options: Binding<[Option]>,
        onSpinEnd: ((Int) -> ())?,
        colors: [Theme]? = nil,
        pointerColor: Color? = nil,
        strokeWidth: CGFloat = 3,
        strokeColor: Color? = nil,
        animDuration: Double = Double(4),
        animation: Animation? = nil,
        getWheelItemIndex: (() -> (Int))? = nil
    ) {
        self.onSpinEnd = onSpinEnd
        self.pointerColor = pointerColor ?? Color(hex: "DA4533")
        self.strokeWidth = strokeWidth
        self.strokeColor = strokeColor ?? Color(hex: "252D4F")
        self.animDuration = animDuration
        self.animation = animation ?? Animation.timingCurve(0, 0, 0.18, 0.99, duration: animDuration)
        self.getWheelItemIndex = getWheelItemIndex
        self._options = options
        self.objectWillChange.send()
    }
}
