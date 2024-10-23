//
//  GameView.swift
//  MockAssignmentOne-PT
//
//  Created by Pubudu Mihiranga on 2024-10-11.
//

import SwiftUI

enum MathOperator: String, CaseIterable {
    case addition = "+"
    case subtraction = "-"
    case multiplication = "X"
    case division = "/"
}

struct GameView: View {
    @State var randomNumberOne = 0
    @State var randomNumberTwo = 0
    @State var randomOperator: MathOperator = .addition
    @State var correctAnswer = 0
    @State var userInput: Int?
    @State var points: Int = 0
    @State var displayAnswerLabel: Bool = false
    @State var isAnswerCorrect: Bool = false
    
    @Binding var preferredFontSize: Double
    @Binding var preferredSystemColor: AppThemeColor
    
    var body: some View {
        VStack {
            Text("What is \(randomNumberOne) \(randomOperator.rawValue) \(randomNumberTwo)?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(preferredSystemColor.rawValue))
            
            HStack {
                TextField("Answer", value: $userInput, format: .number)
                    .keyboardType(.numberPad)
                
                Button("Submit") {
                    guard let userInput = userInput else {
                        return
                    }
                    if correctAnswer == userInput {
                        points += 1
                        isAnswerCorrect = true
                    } else {
                        points -= 1
                        isAnswerCorrect = false
                    }
                    displayAnswerLabel = true
                }
                .buttonStyle(.bordered)
                .tint(.blue)
            }
            .padding()
            .border(.black, width: 1)
            
            if displayAnswerLabel {
                isAnswerCorrect ?
                Label("Correct answer, well done!", systemImage: "checkmark.circle.fill").foregroundStyle(.green) :
                Label("Incorrect answer, correct answer is \(correctAnswer)!", systemImage: "x.circle.fill").foregroundStyle(.red)
            }
            
            Text("\(points)")
                .font(.system(size: 120, weight: .bold))
            
            VStack {
                Text("Instructions")
                
                Text("Submit the correct answer and gain 1 point.")
            }
            .font(.system(size: preferredFontSize))
            .multilineTextAlignment(.center)
            
            Button("Next") {
                userInput = nil
                displayAnswerLabel = false
                generateRandomQuestion()
            }
            .buttonStyle(.bordered)
            .tint(.green)
        }
        .padding()
        .onAppear {
            generateRandomQuestion()
        }
    }
    
    func generateRandomQuestion() {
        randomNumberOne = Int.random(in: 0...9)
        randomNumberTwo = Int.random(in: 0...9)
        randomOperator = MathOperator.allCases.randomElement()!
        
        switch randomOperator {
        case .addition:
            correctAnswer = randomNumberOne + randomNumberTwo
        case .subtraction:
            correctAnswer = randomNumberOne - randomNumberTwo
        case .multiplication:
            correctAnswer = randomNumberOne * randomNumberTwo
        case .division:
            guard randomNumberTwo != 0 else {
                generateRandomQuestion()
                return
            }
            correctAnswer = randomNumberOne / randomNumberTwo
        }
    }
}

#Preview {
    GameView(preferredFontSize: .constant(0),
             preferredSystemColor: .constant(.red))
}
