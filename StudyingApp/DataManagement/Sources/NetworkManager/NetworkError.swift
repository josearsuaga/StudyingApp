import Foundation


enum NetworkError: Error {
    case invalidURL
    case unexpectedStatusCode
    case unknownError
    case errorDecodingResponse
}
