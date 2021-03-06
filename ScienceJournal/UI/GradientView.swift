/*
 *  Copyright 2019 Google Inc. All Rights Reserved.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

import UIKit

/// A view with a background that is a vertical gradient of any number of colors.
class GradientView: UIView {

  private var gradientLayer: CAGradientLayer {
    return layer as! CAGradientLayer
  }

  /// An array of colors for the gradient, starting at the top and going down.
  var colors: [UIColor]? {
    get {
      guard let cgColors = gradientLayer.colors else { return nil }
      return cgColors.map { UIColor(cgColor: $0 as! CGColor) }
    }
    set {
      if let colors = newValue {
        gradientLayer.colors = colors.map { $0.cgColor }
      } else {
        gradientLayer.colors = nil
      }
    }
  }

  /// Designated initializer.
  ///
  /// - Parameters:
  ///   - frame: The view frame.
  ///   - colors: An array of colors for the gradient, starting at the top and going down.
  init(frame: CGRect = .zero, colors: [UIColor]? = nil) {
    super.init(frame: frame)
    if let colors = colors {
      gradientLayer.colors = colors.map { $0.cgColor }
    }
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) is not supported.")
  }

  override class var layerClass: AnyClass {
    return CAGradientLayer.self
  }

}
