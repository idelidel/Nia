//
//  Editor.swift
//  Nia Editor
//
//  Created by Damik Minnegalimov on 07.11.2020.
//

import SwiftUI

enum VerticalDirection {
  case up
  case down
}

class Editor: Identifiable, ObservableObject {
  var id = UUID()
  @Published var size: CGSize = CGSize(width: 1080, height: 1920)
  @Published var layers: [Layer] = []
  
  @discardableResult
  func add(_ newLayer: Layer) -> Editor {
    layers.append(newLayer)
    return self
  }
  
  @discardableResult
  func remove(_ newLayer: Layer) -> Editor {
    layers.removeAll { (layer) -> Bool in
      return layer.id == newLayer.id
    }
    
    return self
  }
  
  @discardableResult
  func move(_ layer: Layer, _ direction: VerticalDirection) -> Editor {
    
    if let currentIndex = layers.firstIndex(of: layer) {
      
      if direction == .up && currentIndex < layers.count - 1 {
        layers.insert(layer, at: currentIndex + 2)
        layers.remove(at: currentIndex)
      } else if direction == .down && currentIndex > 0 {
        layers.insert(layer, at: currentIndex - 1)
        layers.remove(at: currentIndex + 1)
      }
      
    }
    
    return self
  }
  
  @discardableResult
  func removeAll() -> Editor {
    layers.removeAll()
    return self
  }
  
}
