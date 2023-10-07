//
//  Networking.swift
//  Werddd App
//
//  Created by Thierno Diallo on 5/31/23.
//



import Foundation

/*
class NetworkingLeadRandomWord {
    
    let errorNotice = "Invalid - Try Again"
    let apiInfo = APIConstant()
    
     func networkingRandomWordURL(completion: @escaping (Result<apiWord, Error>) -> Void) {
        guard let randomWordUrl = URL(string: "https://wordsapiv1.p.rapidapi.com/words/?random=true&hasDetails=definitions") else {
            print("\(errorNotice)")
            return
        }
                
        let headers = [
            "X-RapidAPI-Key": apiInfo.key,
            "X-RapidAPI-Host": "wordsapiv1.p.rapidapi.com"
        ]
        
        var urlRequest = URLRequest(url: randomWordUrl)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) -> Void in
            guard let data = data, error == nil else {
                print("\(self.errorNotice)")
                completion(.failure("You suck" as! Error))
                return
            }
            
            do {
                let randomWord = try JSONDecoder().decode(apiWord.self, from: data)
                completion(.success(randomWord))
                print(randomWord)
            } catch {
                print("Failed to convert data")
            }
            
            
        }).resume()
        
    }
    
}




class NetworkingLeadDetails {

    let errorNotice = "Invalid - Try Again"
    let apiInfo = APIConstant()

    func networkingWordDetailsURL(_ word: String, completion: @escaping (Result<apiWord, Error>) -> Void) {
    guard let fetchingDetailsURL = URL(string: "https://wordsapiv1.p.rapidapi.com/words/\(word)") else {
        print("\(errorNotice)")
        return
    }
    
    
    let headers = [
        "X-RapidAPI-Key": apiInfo.key,
        "X-RapidAPI-Host": "wordsapiv1.p.rapidapi.com"
    ]
    
    var urlRequest = URLRequest(url: fetchingDetailsURL)
    urlRequest.httpMethod = "GET"
    urlRequest.allHTTPHeaderFields = headers
    
    
    URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) -> Void in
        guard let data = data, error == nil else {
            print("\(self.errorNotice)")
            completion(.failure("\(self.errorNotice)" as! Error))
            return
        }
        
        do {
            let word = try JSONDecoder().decode(apiWord.self, from: data)
            completion(.success(word))
            print(word)
        } catch {
            print("Failed to convert data")
        }
        
    }).resume()
                               
  }
                               
      
}

*/

class NetworkingLead {
    
    let errorNotice = "Invalid - Try Again"
    let apiInfo = APIConstant()
    
     func networkingRandomWordURL(completion: @escaping (Result<apiWord, Error>) -> Void) {
        guard let randomWordUrl = URL(string: "https://wordsapiv1.p.rapidapi.com/words/?random=true&hasDetails=definitions") else {
            print("\(errorNotice)")
            return
        }
                
        let headers = [
            "X-RapidAPI-Key": apiInfo.key,
            "X-RapidAPI-Host": "wordsapiv1.p.rapidapi.com"
        ]
        
        var urlRequest = URLRequest(url: randomWordUrl)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) -> Void in
            guard let data = data, error == nil else {
                print("\(self.errorNotice)")
                completion(.failure("You suck" as! Error))
                return
            }
            
            do {
                let randomWord = try JSONDecoder().decode(apiWord.self, from: data)
                completion(.success(randomWord))
                print(randomWord)
            } catch {
                print("Failed to convert data")
            }
            
            
        }).resume()
        
    }
    

    func networkingWordDetailsURL(_ word: String, completion: @escaping (Result<apiWord, Error>) -> Void) {
    guard let fetchingDetailsURL = URL(string: "https://wordsapiv1.p.rapidapi.com/words/\(word)") else {
        print("\(errorNotice)")
        return
    }
    
    
    let headers = [
        "X-RapidAPI-Key": apiInfo.key,
        "X-RapidAPI-Host": "wordsapiv1.p.rapidapi.com"
    ]
    
    var urlRequest = URLRequest(url: fetchingDetailsURL)
    urlRequest.httpMethod = "GET"
    urlRequest.allHTTPHeaderFields = headers
    
    
    URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) -> Void in
        guard let data = data, error == nil else {
            print("\(self.errorNotice)")
            completion(.failure("\(self.errorNotice)" as! Error))
            return
        }
        
        do {
            let word = try JSONDecoder().decode(apiWord.self, from: data)
            completion(.success(word))
            print(word)
        } catch {
            print("Failed to convert data")
        }
        
    }).resume()
                               
  }
                               
      
}
