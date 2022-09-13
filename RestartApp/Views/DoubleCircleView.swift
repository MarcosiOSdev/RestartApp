//
//  DoubleCircle.swift
//  RestartApp
//
//  Created by marcos.felipe.souza on 30/08/22.
//

import SwiftUI

struct DoubleCircleView: View {
    @State var lineColor: Color = .white
    @State var lineOpacity: Double = 0.2
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineColor.opacity(lineOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            
            Circle()
                .stroke(lineColor.opacity(lineOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear {
            isAnimating = true
        }
    }
}

struct DoubleCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue").ignoresSafeArea()
            DoubleCircleView()
        }
        
    }
}
