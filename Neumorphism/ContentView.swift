//
//  ContentView.swift
//  Neumorphism
//
//  Created by Russell Gordon on 2020-12-31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.offWhite
            
            VStack {
                Spacer()
                
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.offWhite)
                    .frame(width: 300, height: 300)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                
                Spacer()
                
                Button(action: {
                    print("Button tapped")
                }, label: {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.gray)
                })
                .buttonStyle(SimpleButtonStyle())
                
                Spacer()

            }
            

        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct SimpleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .background(
                Group {
                    if configuration.isPressed {
                        Circle()
                            .fill(Color.offWhite)
                            // Explanation of the two overlays below...
                            // See: https://www.hackingwithswift.com/articles/213/how-to-build-neumorphic-designs-with-swiftui
                            // ... for full article
                            /*
                             Now for the important part: rather than adding two flipped shadows to our pressed circle, we’re going to overlay a new circle on top of it, give it a blurred stroke, then mask it with another circle that has a gradient. That’s a lot, but let me break it down:

                             Our base circle is the neumorphic effect circle we have right now, which is filled with our off white color.
                             We place a circle over that, stroked with a gray border and blurred a little to make it a soft edge.
                             We then mask that overlaid circle with another circle, this time filled with a linear gradient.
                             When you mask one view with another, SwiftUI uses the alpha channel of the mask to determine what should be shown of the underlying view. So, if we draw a blurry gray stroke then mask it using a linear gradient of black to clear, the blurry stroke will be invisible on one side and fade in on the other – we get a smooth inner gradient. To make the effect more pronounced, we can offset the stroked circles a little in either direction, and with a little experimentation I found that drawing the light shadow in a thicker line than the dark shadow really helped maximize the effect.
                             */
                            .overlay(
                                Circle()
                                    .stroke(Color.gray, lineWidth: 4)
                                    .blur(radius: 4)
                                    .offset(x: 2, y: 2)
                                    .mask(Circle().fill(LinearGradient(Color.black, Color.clear)))
                            )
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 8)
                                    .blur(radius: 4)
                                    .offset(x: -2, y: -2)
                                    .mask(Circle().fill(LinearGradient(Color.clear, Color.black)))
                            )
                        
                    } else {
                        Circle()
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    }
                }
            )
        
    }
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
