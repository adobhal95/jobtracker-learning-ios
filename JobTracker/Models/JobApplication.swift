//
//  JobApplication.swift
//  JobTracker
//
//  Created by abhishek on 26/11/26.
//

import Foundation

/// A model representing a single job application record.
/// Conforms to `Codable` for easy persistence and `Identifiable` for SwiftUI lists.
struct JobApplication: Codable, Identifiable, Hashable {
    /// Unique identifier for the application
    let id: Int

    /// Company name where the application was submitted
    let company: String

    /// Role or position title applied for
    let role: String

    /// Current status of the application (e.g., applied, interviewing, offered)
    let status: ApplicationStatus

    /// Expected or offered salary, if available
    let salary: Double?

    /// Any additional notes about the application
    let notes: String?
}
