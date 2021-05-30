//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Andre Almeida on 30/05/21.
//

import SwiftUI

struct ContentView: View {
   @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var chosenFlag = ""
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack (spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                    
                    Text(countries[correctAnswer])
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                .foregroundColor(.white)
                
                ForEach(0..<3){ num in
                    Button(action: {
                        self.flagTapped(num)
                    }, label: {
                        Image(self.countries[num])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    })
                }
                
                Text("Total Score: \(score)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Spacer()
            }
        }
        .alert(isPresented: $showScore, content: {
            Alert(title: Text(scoreTitle), message: Text("Thats the flag of \(chosenFlag)"), dismissButton: .default(Text("Continue")){
                self.askQuestion()
            })
        })
    }
    
    func flagTapped(_ num: Int){
        chosenFlag = countries[num]
        if num == correctAnswer{
            scoreTitle = "Correct!"
            score += 1
        } else {
            scoreTitle = "Wrong!"
        }
        showScore = true
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
