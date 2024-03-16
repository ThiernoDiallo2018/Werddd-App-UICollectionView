//
//  Definitions.swift
//  Werddd App
//
//  Created by Thierno Diallo on 5/7/23.
//

import UIKit




// Can pass in the Data Model below but making an instance
// let def = Definitions().definitions


struct Definition {
    let word: String
    let type: String // either "noun" or "adjective"
    let definition: String
    
    let synonyms: String?
    let antonyms: String?
    let example: String?
}


// MARK: Data Model

let definitions: [Definition] = [
    Definition(
        word: "Abacus",
        type: "noun",
        definition: "A manual calculating device that consists of beads on rods or wires",
        synonyms: "String",
        antonyms: "String",
        example: "He used an abacus to perform quick calculations."
    ),
    Definition(
        word: "Bifurcate",
        type: "verb",
        definition: "To divide into two branches or forks",
        synonyms: "split",
        antonyms: "join",
        example: "The road bifurcates into two separate paths."
    ),
    Definition(
        word: "Cacophony",
        type: "noun",
        definition: "A harsh, discordant mixture of sounds",
        synonyms: "discord",
        antonyms: "harmony",
        example: "The concert was filled with a cacophony of different instruments."
    ),
    Definition(
        word: "Dichotomy",
        type: "noun",
        definition: "A division or contrast between two things that are or are represented as being opposed or entirely different",
        synonyms: "contrast",
        antonyms: "unity",
        example: "There is a dichotomy between his public persona and his private life."
    ),
    Definition(
        word: "Euphoria",
        type: "noun",
        definition: "A feeling of intense happiness or excitement",
        synonyms: "bliss",
        antonyms: "sadness",
        example: "Winning the championship filled him with a sense of euphoria."
    ),
    Definition(
        word: "Furtive",
        type: "adjective",
        definition: "Attempting to avoid notice or attention, typically because of guilt or a belief that discovery would lead to trouble; secretive",
        synonyms: "stealthy",
        antonyms: "open",
        example: "She cast a furtive glance around the room before slipping out unnoticed."
    ),
    Definition(
        word: "Gregarious",
        type: "adjective",
        definition: "Fond of company; sociable",
        synonyms: "sociable",
        antonyms: "unsociable",
        example: "He is known for his gregarious nature and love of socializing."
    ),
    Definition(
        word: "Hypocrisy",
        type: "noun",
        definition: "The practice of claiming to have moral standards or beliefs to which one's own behavior does not conform",
        synonyms: "insincerity",
        antonyms: "sincerity",
        example: "His hypocrisy was evident when his actions contradicted his professed beliefs."
    ),
    
    Definition(
        word: "Inferno",
        type: "noun",
        definition: "A large fire that is dangerously out of control",
        synonyms: "blaze",
        antonyms: "extinguished",
        example: "The building was engulfed in an inferno, and firefighters worked tirelessly to control the blaze."
    ),
    Definition(
        word: "Juxtapose",
        type: "verb",
        definition: "To place side by side for contrast or comparison",
        synonyms: "compare",
        antonyms: "separate",
        example: "The artist juxtaposed light and dark colors to create a striking visual effect."
    ),
    Definition(
        word: "Kinetic",
        type: "adjective",
        definition: "Relating to or resulting from motion",
        synonyms: "active",
        antonyms: "stationary",
        example: "The kinetic energy of the moving car was converted into electricity."
    ),
    Definition(
        word: "Luminous",
        type: "adjective",
        definition: "Full of or shedding light; bright or shining, especially in the dark",
        synonyms: "radiant",
        antonyms: "dim",
        example: "The moon cast a luminous glow over the lake."
    ),
    Definition(
        word: "Metamorphosis",
        type: "noun",
        definition: "The process of transformation from an immature form to an adult form in two or more distinct stages",
        synonyms: "transformation",
        antonyms: "stagnation",
        example: "The caterpillar undergoes a metamorphosis and transforms into a beautiful butterfly."
    ),
    Definition(
        word: "Nihilism",
        type: "noun",
        definition: "The rejection of all religious and moral principles, often in the belief that life is meaningless",
        synonyms: "anarchy",
        antonyms: "faith",
        example: "His nihilism led him to question the purpose and meaning of existence."
    ),
    Definition(
        word: "Ostentatious",
        type: "adjective",
        definition: "Characterized by pretentious or showy display; designed to impress",
        synonyms: "extravagant",
        antonyms: "modest",
        example: "She arrived at the party in an ostentatious gown, drawing everyone's attention."
    ),
    Definition(
        word: "Panacea",
        type: "noun",
        definition: "A solution or remedy for all problems or difficulties",
        synonyms: "cure-all",
        antonyms: "problem",
        example: "Some people believe that love is a panacea for all of life's challenges."
    ),
    
    Definition(
        word: "Quintessential",
        type: "adjective",
        definition: "Representing the most perfect or typical example of a quality or class",
        synonyms: "typical",
        antonyms: "atypical",
        example: "The Eiffel Tower is considered the quintessential symbol of Paris."
    ),
    Definition(
        word: "Reticent",
        type: "adjective",
        definition: "Not revealing one's thoughts or feelings readily; reserved",
        synonyms: "reserved",
        antonyms: "outgoing",
        example: "He was reticent about discussing his personal life."
    ),
    Definition(
        word: "Sycophant",
        type: "noun",
        definition: "A person who acts obsequiously toward someone important in order to gain advantage",
        synonyms: "flatterer",
        antonyms: "critic",
        example: "The politician surrounded himself with sycophants who praised his every decision."
    ),
    Definition(
        word: "Truculent",
        type: "adjective",
        definition: "Eager or quick to argue or fight; aggressively defiant",
        synonyms: "aggressive",
        antonyms: "peaceful",
        example: "He had a truculent attitude and was always ready for a confrontation."
    ),
    Definition(
        word: "Ubiquitous",
        type: "adjective",
        definition: "Present, appearing, or found everywhere",
        synonyms: "omnipresent",
        antonyms: "rare",
        example: "Cell phones have become ubiquitous in today's society."
    ),
    Definition(
        word: "Vicarious",
        type: "adjective",
        definition: "Experienced in the imagination through the feelings or actions of another person",
        synonyms: "indirect",
        antonyms: "direct",
        example: "She lived vicariously through her favorite character in the novel."
    )
]



