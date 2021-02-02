//
//  Network.swift
//  DodoTestTask
//
//  Created by Mikhail Rubanov on 01.02.2021.
//

import Foundation

class Network {
    typealias DataCompletion = (_ result: Result<Data, Error>) -> Void
    
    func fetch(_ completion: @escaping DataCompletion) {
        let deadline: DispatchTime = .now() + .milliseconds(300)
        
        queue.asyncAfter(deadline: deadline) {
            completion(.success(self.dataFromFile()))
        }
    }
    
    private func dataFromFile() -> Data {
        let url = Bundle.main.url(forResource: "Bonuses", withExtension: "json")!
        return try! Data(contentsOf: url)
    }
    
    private let queue = DispatchQueue.global(qos: .userInitiated)

}
