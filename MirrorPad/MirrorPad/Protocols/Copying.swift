//
//  Copying.swift
//  MirrorPad
//
//  Created by Sarvar Boltaboyev on 21/06/25.
//

import Foundation

public protocol Copying {
  init(_ prototype: Self)
}

extension Copying {
  public func copy() -> Self {
    return type(of: self).init(self)
  }
}

extension Array where Element: Copying {
  public func deepCopy() -> [Element] {
    return map { $0.copy() }
  }
}
