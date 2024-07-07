//
//  File.swift
//  
//
//  Created by José Arsuaga Sotres on 05/07/24.
//

import Foundation


public struct PokemonListEndPoint: EndPoint {
    public var header: [String : String]?
    
    public var body: [String : String]?
    
    public var queryParams: [String : String]?
    
    public var pathParams: [String : String]?
    
    public var path: String {
        "/api/v2/pokemon"
    }
    public var method: RequestMethod {
        .get
    }
    
    public init() { }
}
