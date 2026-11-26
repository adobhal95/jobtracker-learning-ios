//
//  ApplicationStatus.swift
//  JobTracker
//
//  Created by abhishek on 26/11/26.
//

import SwiftUI

/// Represents the lifecycle state of a job application in the app.
enum ApplicationStatus: String, Codable, CaseIterable {
    case saved      // The user saved the job to track later, but hasn't applied yet
    case applied    // The user has submitted an application
    case interview  // The application progressed to interviews
    case offer      // The candidate received an offer
    case rejected   // The application was declined
    
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
