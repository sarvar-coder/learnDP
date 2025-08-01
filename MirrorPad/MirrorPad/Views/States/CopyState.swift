

import UIKit

public class CopyState: DrawViewState {
  
  public override func copyLines(from source: DrawView) {
    drawView.layer.sublayers?.removeAll()
    drawView.lines = source.lines.deepCopy()
    drawView.lines.forEach { drawView.layer.addSublayer($0) }
    transitionToState(matching: AcceptInputState.identifier)
  }
}
