//
//  ContentView.swift
//  wordScramble
//
//  Created by Jastin on 23/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var errorContent = (title: "",error: "", isPresented: false)
    @State private var score = 0
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section("New Words") {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                        
                    }
                }
                
                Section("Score") {
                    Text(score, format: .number)
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorContent.title, isPresented: $errorContent.isPresented) { } message: {
                Text(errorContent.error)
            }
            .toolbar {
                Button("Restart") {
                    restart()
                }
            }
        }
    }
    
    private func restart() {
        startGame()
        score = 0
    }
    
    private func addNewWord() {
        let answer =  newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else {
            return
        }
        withAnimation {
            guard isNotUsed(answer) else {
                errorContent = ("Word used already", "Be more original!!", true)
                return
            }
            guard isAPossibleWord(answer) else {
                errorContent = ("Word not possible", "you can't spell that word from `\(rootWord)`!", true)
                return
            }
            guard isAValidWord(answer) else {
                errorContent = ("Word not recognized", "you can't just make them up, you know!", true)
                return
            }
            usedWords.insert(answer, at: 0)
        }
        score += newWord.count * 2
        newWord = ""
    }
    
    private func startGame() {
        if let startWordURL = Bundle.main.url(forResource: "start", withExtension: "txt"),
           let startWords = try? String(contentsOf: startWordURL) {
            let allWords = startWords.components(separatedBy: "\n")
            rootWord = allWords[Int.random(in: 0..<allWords.count)]
        }
    }
    
    private  func isNotUsed(_ word: String) -> Bool {
        return !usedWords.contains(word)
    }
    
    private func isAPossibleWord(_ word: String) -> Bool {
        var tempRoot = rootWord
        
        for letter in word {
            if let index = tempRoot.firstIndex(of: letter) {
                tempRoot.remove(at: index)
            } else {
                return false
            }
        }
        return true
    }
    
    private func isAValidWord(_ word: String) -> Bool {
        let textChecker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = textChecker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
}

#Preview {
    ContentView()
    
}
