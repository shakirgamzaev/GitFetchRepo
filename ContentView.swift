//
//  ContentView.swift
//  Regex
//
//  Created by shakir Gamzaev on 29/10/23.
//

import SwiftUI
import RegexBuilder




struct PlayButton: View {
    @Binding var Playing: Bool
    
    var body: some View {
        Button(action: {
                Playing.toggle()
            }) {
                    Image(systemName: Playing ? "pause.circle" : "play.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60)
        }
    }
}

struct ContentView: View {
    
    @State private var episode = Episode(isPlaying: false, name: "Wolves")
    var body: some View {
        VStack {
            Text(episode.isPlaying ? episode.name + "playing" : episode.name)
            Text("Episode 1")
            PlayButton(Playing: $episode.isPlaying) // Pass a binding.
            Toggle("play", isOn: $episode.isPlaying)
                .frame(width: 100)
        }
    }
}

struct Episode {
    var isPlaying: Bool
    var name: String
}


//    func runRegex() {
//        let phoneNumberRegex = Regex {
//            Anchor.startOfLine
//            Optionally {
//                Capture {
//                    Character("+")
//                    Repeat(1...3) {
//                        CharacterClass.digit
//                    }
//                }
//                Optionally {
//                    ChoiceOf {
//                        Character(" ")
//                        Character("-")
//                    }
//                }
//            }
//            
//            
//            Capture {
//                Repeat(count: 3) {
//                    CharacterClass.digit
//                }
//            }
//            Optionally {
//                ChoiceOf {
//                    Character(" ")
//                    Character("-")
//                }
//            }
//            Capture {
//                Repeat(count: 3) {
//                    CharacterClass.digit
//                }
//            }
//            Optionally {
//                ChoiceOf {
//                    Character(" ")
//                    Character("-")
//                }
//            }
//            Capture {
//                Repeat(count: 4) {
//                    CharacterClass.digit
//                }
//            }
//            Optionally {
//                ChoiceOf {
//                    Character(" ")
//                    Character("-")
//                }
//            }
//            
//        }
//        let telephoneNumbers = """
//        +1 123 456 1232
//        +89 324-221-1083
//        +7 898 243 6705
//        637 898 1222
//        """
//        let telephoneMatches = telephoneNumbers.matches(of: phoneNumberRegex)
//        if !telephoneMatches.isEmpty {
//            print(telephoneMatches.first!.output)
//            for number in telephoneMatches {
//                print(number.output)
//            }
//        }
//        
//    }


#Preview {
    ContentView()
}
