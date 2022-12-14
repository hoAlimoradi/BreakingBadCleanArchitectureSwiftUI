//
//  Image+Extensions.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi.
//

import SwiftUI

extension Image {
  static let logo = Image( "logo")
  static let person1 = Image(systemName: "person.2.crop.square.stack")
  static let person2 = Image(systemName: "person.crop.circle.badge.moon")
  static let person3 = Image(systemName: "person.and.arrow.left.and.arrow.right")
  static let person4 = Image(systemName: "person.badge.plus")
  static let person5 = Image(systemName: "person.circle")
  static let person6 = Image(systemName: "folder.fill.badge.person.crop")
  static let all = Image(systemName: "person.text.rectangle")
}

extension UIImage {
  
  /// Average color of the image, nil if it cannot be found
  var averageColor: UIColor? {
    // convert the UIImage into Core Image image
    guard let inputImage = CIImage(image: self) else {
      return nil
    }
    
    // Create an extent vector (a frame with width and height of our current input image)
    let extentVector = CIVector(
      x: inputImage.extent.origin.x,
      y: inputImage.extent.origin.y,
      z: inputImage.extent.size.width,
      w: inputImage.extent.size.height
    )
    
    // create a CIAreaAverage filter, this will allow us to pull the average color from the image
    guard let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]),
          let outputImage = filter.outputImage else {
      return nil
    }
    
    // bitmap consisting of r, g, b, a values
    var bitmap = [UInt8](repeating: 0, count: 4)
    let context = CIContext(options: [.workingColorSpace: kCFNull!])
    
    // render output image into a 1 by 1 image supplying it our bitmap to update the values of (i.e the rgba of the 1 by 1 image will fill out bitmap array
    context.render(
      outputImage,
      toBitmap: &bitmap,
      rowBytes: 4,
      bounds: CGRect(x: 0, y: 0, width: 1, height: 1),
      format: .RGBA8,
      colorSpace: nil
    )
    
    // Convert our bitmap images of r, g, b, a to a UIColor
    return UIColor(
      red: CGFloat(bitmap[0]) / 255,
      green: CGFloat(bitmap[1]) / 255,
      blue: CGFloat(bitmap[2]) / 255,
      alpha: CGFloat(bitmap[3]) / 255
    )
  }
}
