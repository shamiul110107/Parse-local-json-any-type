//
//  Model.swift
//  ParsingLocalJsonWithAanyType
//
//  Created by Md. Shamiul Islam on 18/8/22.
//

import Foundation

struct User: Decodable {
  let id: QuantumValue
}

enum QuantumValue: Decodable {
  
  case int(Int), string(String), double(Double)
  
  init(from decoder: Decoder) throws {
    if let int = try? decoder.singleValueContainer().decode(Int.self) {
      self = .int(int)
      return
    }
    
    if let string = try? decoder.singleValueContainer().decode(String.self) {
      self = .string(string)
      return
    }
    
    if let double = try? decoder.singleValueContainer().decode(Double.self) {
      self = .double(double)
      return
    }
    
    throw QuantumError.missingValue
  }
  
  enum QuantumError:Error {
    case missingValue
  }
}
