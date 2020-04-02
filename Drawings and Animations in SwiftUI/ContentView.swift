 //
 //  ContentView.swift
 //  Drawings and Animations in SwiftUI
 //
 //  Created by Roberto Liccardo on 30/03/2020.
 //  Copyright © 2020 Roberto Liccardo. All rights reserved.
 //
 
 import SwiftUI
 
 struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Drawings")) {
                    NavigationLink(destination: Example1(), label: {
                        LabelStyle(imageName: "one", text: "Your first drawing using Path")
                    })
                    
                    NavigationLink(destination: Example2(), label: {
                        LabelStyle(imageName: "two", text: "Get into the groove with Shapes")
                    })
                    
                    NavigationLink(destination: Example3(), label: {
                        LabelStyle(imageName: "three", text: "Step up with Shapes overlapping")
                    })
                }
                
                Section(header: Text("Easy Animations")) {
                    NavigationLink(destination: Example4(), label: {
                        LabelStyle(imageName: "four", text: "Your first animation with the prebuilt animation modifier")
                    })
                    
                    NavigationLink(destination: Example5(), label: {
                        LabelStyle(imageName: "five", text: "Learn to use the rotationEffect modifier")
                    })
                    
                    NavigationLink(destination: Example6(), label: {
                        LabelStyle(imageName: "six", text: "Test your knowledge so far on shapes and animations")
                    })
                }
                
                Section(header: Text("Advanced Animations")) {
                    NavigationLink(destination: Example7(), label: {
                        LabelStyle(imageName: "seven", text: "Learn to use the gesture recognizer")
                    })
                    
                    NavigationLink(destination: Example8(), label: {
                        LabelStyle(imageName: "eight", text: "Put everything together with the Geometry Effect protocol")
                    })
                }

            }.navigationBarTitle("SwiftUI Tutorial")
        }
    }
 }
 
 struct LabelStyle: View {
    let imageName: String
    let text: String
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .overlay(
                    RoundedRectangle(cornerRadius: 60)
                        .strokeBorder(style: StrokeStyle(lineWidth: 2))
                        .foregroundColor(Color.black)
                )
                .cornerRadius(60)
            Text(text)
        }
    }
 }
 
 struct MyButton: View {
    let label: String
    var font: Font = .title
    var textColor: Color = .white
    let action: () -> ()
    
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            Text(label)
                .font(font)
                .padding(10)
                .frame(width: 70)
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.green).shadow(radius: 2))
                .foregroundColor(textColor)
        })
    }
 }
 
 struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
 }
