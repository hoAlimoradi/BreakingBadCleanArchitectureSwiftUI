//
//  ImageService.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi on 7/18/1401 AP.
//
import UIKit

/// Service to retrieve images from a file storage solution
/// implementation is with Cloudinary
protocol ImageService {
  
  /// returns Image Data passed by the URL String
  func getImage(byURL url: String) async throws -> Data
}
