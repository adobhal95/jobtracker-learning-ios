//
//  NewJobApplication.swift
//  JobTracker
//
//  Created by abhishek on 26/11/26.
//

import Foundation

/// A lightweight model used when creating a new job application.
///
/// This type is intended as a request/creation payload and therefore only conforms to `Encodable`.
/// It does not include an `id` and does not conform to `Identifiable`, since identifiers are
/// typically assigned by persistence layers (e.g., a database) after creation.
struct NewJobApplication: Encodable {
    /// The company to which the application is being submitted. Example: "Apple".
    let company: String

    /// The title of the position being applied for. Example: "iOS Engineer".
    let role: String

    /// The initial status of the application (e.g., `.saved`, `.applied`, `.interviewing`).
    let status: ApplicationStatus

    /// The expected or offered salary, if known. Use `nil` if not provided.
    let salary: Double?

    /// Optional free-form notes about the application.
    let notes: String?
}
