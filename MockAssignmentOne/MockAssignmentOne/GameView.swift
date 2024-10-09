//
//  GameView.swift
//  MockAssignmentOne
//
//  Created by Pubudu Mihiranga on 2024-10-09.
//

import SwiftUI

enum MathOperator: String, CaseIterable {
    case addition = "+"
    case subtraction = "-"
    case multiplication = "X"
    case division = "/"
}

struct GameView: View {
    @State var firstNumber: Int = Int.random(in: 0...9)
    @State var secondNumber: Int = Int.random(in: 0...9)
    @State var mathOperator: MathOperator = MathOperator.allCases.randomElement()!
    @State var correctAnswer: Int?
    
    @State var userInput: Int? = nil
    
    @State var points: Int = 0
    @State var showAnwserStatus: Bool = false
    @State var anwserStatus: Bool = false
    
    
    var body: some View {
        VStack {
            Text("What is \(firstNumber) \(mathOperator.rawValue) \(secondNumber)?")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            HStack {
                TextField("Your answer", value: $userInput, format: .number)
                    .keyboardType(.numberPad)
                
                Button("Sumbit") {
                    guard let correctAnswer = correctAnswer,
                          let userInput = userInput else {
                        return
                    }
                    
                    if correctAnswer == userInput {
                        points += 1
                        anwserStatus = true
                    } else {
                        points -= 1
                        anwserStatus = false
                    }
                    
                    showAnwserStatus = true
                }
                .disabled(userInput == nil)
                .buttonStyle(.bordered)
                .tint(.blue)
            }
            .padding()
            .border(.black, width: 1)
            
            if showAnwserStatus {
                Label(anwserStatus ? "Correct answer, well done!" : "Incorrect answer, correct answer is \(correctAnswer!)!",
                      systemImage: anwserStatus ? "checkmark.circle.fill" : "x.circle.fill")
            }
            
            Text("\(points)")
                .font(.system(size: 120, weight: .bold))
            
            Button("Next") {
                randomQuestion()
                showAnwserStatus = false
                userInput = nil
            }
            .buttonStyle(.bordered)
            .tint(.green)
        }
        .padding()
        .onAppear {
            randomQuestion()
        }
    }
    
    func randomQuestion() {
        firstNumber = Int.random(in: 0...9)
        secondNumber = Int.random(in: 0...9)
        mathOperator = MathOperator.allCases.randomElement()!
        
        switch mathOperator {
        case .addition:
            correctAnswer = firstNumber + secondNumber
        case .subtraction:
            correctAnswer = firstNumber - secondNumber
        case .multiplication:
            correctAnswer = firstNumber * secondNumber
        case .division:
            guard secondNumber != 0 else {
                randomQuestion()
                return
            }
            correctAnswer = firstNumber / secondNumber
        }
    }
}

#Preview {
    GameView()
}
