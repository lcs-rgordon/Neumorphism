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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
