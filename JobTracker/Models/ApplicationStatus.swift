//
//  ApplicationStatus.swift
//  JobTracker
//
//  Created by abhishek on 26/11/26.
//

import SwiftUI

/// Represents the lifecycle state of a job application.
/// Backed by `String` for readability and conforms to `Codable` and `CaseIterable` for persistence and UI.
enum ApplicationStatus: String, Codable, CaseIterable {
    /// The user saved the job to track later, but hasn't applied yet.
    case saved
    
    /// The user has submitted an application.
    case applied
    
    /// The application progressed to interviews.
    case interview
    
    /// The candidate received an offer.
    case offer
    
    /// The application was declined.
    case rejected
    
    /// A simple Color mapping used for lightweight UI styling (e.g., tags or labels).
    var applicationStatusColor: Color {
        switch self {
        case .saved: return Color.gray
        case .applied: return Color.blue
        case .interview: return Color.orange
        case .offer: return Color.green
        case .rejected: return Color.red
        }
    }
}
