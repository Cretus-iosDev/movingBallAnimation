//
//  ContentView.swift
//  movingBallAnimation
//
//  Created by rutik maraskolhe on 01/08/21.
//

import SwiftUI

struct ContentView: View {
    @State private var rotate2D = false
    @State private var revealStroke = false
    @State private var moveAlongCircle = false
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.black, Color.black]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/, endRadius: /*@START_MENU_TOKEN@*/500/*@END_MENU_TOKEN@*/)
                .scaleEffect(1.2)
            Text("")
                .font(.title)
            .padding(20)
                .foregroundColor(.blue)
                .offset(y: -300)
            
            // Inner small circles: Anticlockwise 2D rotation
            Circle() // Gray
                .frame(width: 50, height: 50)
                .foregroundColor(.gray)
            Circle() // Semicircle: white
                .trim(from: 1/2, to: 1)
                .frame(width: 50, height: 50)
                .foregroundColor(.white)
                .rotationEffect(.degrees(rotate2D ? -360 : 0))
                .animation(Animation.easeInOut(duration: 10).delay(0.99).repeatForever(autoreverses: false))
                .onAppear() {
                    self.rotate2D.toggle()
            }
            
            // Circular path
            Circle()
                .stroke(lineWidth: 2)
                .frame(width: 200, height: 200)
                .foregroundColor(.white)
            
            
            Circle() // Dashed stroke: Draw stroke using trim path
                .trim(from: revealStroke ? 0 : 1, to: 1)
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, dash: [1, 10], dashPhase: 20.0)) // Alter the dash array to change gap
                .frame(width: 220, height: 220)
                .foregroundColor(.white)
                .rotationEffect(.degrees(90))
                .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                .animation(Animation.easeInOut(duration: 10).delay(1).repeatForever(autoreverses: false))
                .onAppear() {
                    self.revealStroke.toggle()
            }
            
            Circle() // Hidden motion path
                .stroke(lineWidth: 2)
                .frame(width: 220, height: 220)
                .foregroundColor(.blue)
                .opacity(0)
            
            Circle() // Ball
                .frame(width: 20, height: 20)
                .foregroundColor(.white)
                .offset(y: -110)
                .rotationEffect(.degrees(moveAlongCircle ? 360 : 0))
                .animation(Animation.easeInOut(duration: 10).delay(0.99).repeatForever(autoreverses: false))
                .onAppear() {
                    self.moveAlongCircle.toggle()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
