//
//  Json+Extension.swift
//

import Foundation
import Apollo

extension JSONDecoder {
  func decodeModel<T : Decodable>(type:T.Type, str:String?) -> T? {
    
    if str == nil {
      return nil
    }
    
    do {
      return try JSONDecoder().decode(type, from: str!.data(using: .utf8)!)
    } catch {
      print("Decode JSON Catch: \(type) \(error)")
    }
    return nil
  }
}

extension GraphQLSelectionSet {
  func decodeModel<T : Decodable>(type:T.Type) -> T? {
    let json = self.jsonObject
    let serialized = try! JSONSerialization.data(withJSONObject: json, options: [])
    
    let jsonStr = String(data: serialized, encoding: .utf8)
    return JSONDecoder().decodeModel(type: type, str: jsonStr)
  }
}
