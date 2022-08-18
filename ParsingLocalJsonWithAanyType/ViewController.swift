//
//  ViewController.swift
//  ParsingLocalJsonWithAanyType
//
//  Created by Md. Shamiul Islam on 18/8/22.
//

import UIKit


class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    guard let users = loadJson(fileName: "User") else {return}
    for user in users {
      switch user.id {
      case let .int(value): print("Type is integer and value = ",value)
      case let .double(value): print("Type is Double and value = ",value)
      case let .string(value): print("Type is string and value = ",value)
      }
    }
  }
}

extension ViewController {
  private func loadJson(fileName: String?) -> [User]? {
    guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else { return nil}
    let url = URL(fileURLWithPath: path)
    
    do {
      let jsonData = try Data(contentsOf: url)
      let response = try JSONDecoder().decode([User].self, from: jsonData)
      return response
    } catch {
      print("Error:\(error)")
    }
    return nil
  }
}
