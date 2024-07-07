import Foundation


public enum NetworkError: Error {
    case invalidURL
    case unexpectedStatusCode
    case unknownError
    case errorDecodingResponse
}
