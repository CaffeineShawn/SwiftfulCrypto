//
//  NetworkingManager.swift
//  SwiftfulCrypto
//
//  Created by Shaw Young on 2021/7/21.
//

import Foundation
import Combine

class NetworkingManager {

    enum NetworkingError: LocalizedError {
        case badURLResponese(url: URL)
        case unknown

        var errorDescription: String? {
            switch self {
            case .badURLResponese(url: let url):
                return "[🔥] Bad response from URL.\(url)"
            case .unknown:
                return "[⚠️] Unknown error occured"
            }
        }
    }

    static func download(url: URL) -> AnyPublisher<Data, Error> {
       return URLSession.shared.dataTaskPublisher(for: url)
//            .subscribe(on: DispatchQueue.global(qos: .default)) included above
        .tryMap({ try handleURLResponse(output: $0, url: url)})
        .retry(3)
        .eraseToAnyPublisher()
    }

    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)

        }
    }

    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURLResponese(url: url)
        }
        return output.data
    }
}
