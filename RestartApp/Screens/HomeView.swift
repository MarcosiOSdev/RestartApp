//
//  HomeView.swift
//  RestartApp
//
//  Created by marcos.felipe.souza on 30/08/22.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("onboarding")
    var isOnboardingViewActive = false
    
    @State private var isAnimating: Bool = false
    
    var header: some View {
        ZStack {
            DoubleCircleView(lineColor: .gray, lineOpacity: 0.1)
            Image("character-2")
                .resizable()
                .scaledToFit()
                .padding()
                .offset(y: isAnimating ? 35 : -35)
                .animation(
                    Animation
                        .easeOut(duration: 4)
                        .repeatForever()
                    ,
                    value: isAnimating)
                            
        }
    }
    var middle: some View {
        Text("The time that leads to mastery is dependent on the intensity of our focus")
            .font(.title3)
            .fontWeight(.light)
            .foregroundColor(.secondary)
            .multilineTextAlignment(.center)
            .padding()
    }
    
    var bottom: some View {
        Button {
            withAnimation {
                playSound(sound: "success", type: "m4a")
                isOnboardingViewActive = true
            }
        } label: {
            Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                .imageScale(.large)
            
            Text("Restart")
                .font(.system(.title3, design: .rounded))
                .fontWeight(.bold)
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            header
            middle
            Spacer()
            bottom
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                isAnimating = true
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
