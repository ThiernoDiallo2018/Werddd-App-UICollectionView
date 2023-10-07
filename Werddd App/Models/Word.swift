//
//  Word.swift
//  Werddd App
//
//  Created by Thierno Diallo on 6/9/23.
//

import Foundation

struct apiWord: Codable {
    let word: String
    let results: [apiWordDetail]?
}


struct apiWordDetail: Codable {
    let definition: String?
    let synonyms: [String]?
    let antonyms: [String]?
    let examples: [String]?
    let partOfSpeech: String?
}
