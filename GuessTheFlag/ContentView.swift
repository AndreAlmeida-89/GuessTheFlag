//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Andre Almeida on 30/05/21.
//

import SwiftUI

struct ContentView: View {
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    
    var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            
            Color.blue
                .edgesIgnoringSafeArea(.all)
            
            VStack (spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                    
                    Text(countries[correctAnswer])
                }
                .foregroundColor(.white)
                
                ForEach(0..<3){ num in
                    Button(action: {
                        
                    }, label: {
                        Image(self.countries[num])
                            .renderingMode(.original)
                    })
                }
                Spacer()
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
