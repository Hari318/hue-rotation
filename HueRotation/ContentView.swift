//
//  ContentView.swift
//  HueRotation
//
//  Created by Hari on 21/06/24.
//

import SwiftUI

struct ContentView: View {
    @State private var shiftColors = false
    @State private var image = "dog"
    let backgroundColor = Color.black
    
    var body: some View {
        VStack {
            ZStack {
                backgroundColor
                    .scaleEffect(1.2)
                Image(image).resizable().padding(20).frame(width: 350, height: 350)
                    .hueRotation(.degrees(self.shiftColors ? 360 * 2 : 0))
                    .onAppear() {
                        withAnimation(.easeInOut(duration: 2).delay(0.4).repeatForever(autoreverses: true)) {
                            shiftColors.toggle()
                        }
                    }
            }
            ImagePicker(selectedImage: $image)
                .frame(width: 350, height: 200)
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ImagePicker: View {
    @Binding var selectedImage: String
    let images = ["ornament", "landscape", "dog", "dice", "cat", "multicolor"]
    
    var body: some View {
        Picker("", selection: $selectedImage) {
            ForEach(images, id: \.self) { value in
                Text(value)
                    .foregroundStyle(Color.white)
            }
        }
        .pickerStyle(WheelPickerStyle())
        .frame(width: 300, height: 150)
        .background(Color.red.colorMultiply(.blue))
        .cornerRadius(20)
        .shadow(color: .white, radius: 5)
    }
}

#Preview {
    ContentView()
}
