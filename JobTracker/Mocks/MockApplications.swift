//
//  MockApplications.swift
//  JobTracker
//
//  Created by abhishek on 26/11/26.
//

import Foundation

/// A lightweight container for sample `JobApplication` data.
/// Use these samples in previews, prototyping, or tests where persistent storage is unnecessary.
struct MockApplications {
    /// Curated examples covering common application states for use in previews/tests.
    static let samples: [JobApplication] = [
        JobApplication(id: 1, company: "KPMG",     role: "Data Engineer",    status: .interview, salary: 1_500_000, notes: nil), // In interview loop
        JobApplication(id: 2, company: "NatWest",  role: "Data Engineer",    status: .applied,   salary: 1_200_000, notes: nil), // Recently applied
        JobApplication(id: 3, company: "Google",   role: "Cloud Engineer",   status: .saved,     salary: 2_000_000, notes: nil), // Saved to apply later
        JobApplication(id: 4, company: "Microsoft",role: "iOS Developer",    status: .offer,     salary: 1_800_000, notes: nil), // Offer received
        JobApplication(id: 5, company: "Amazon",   role: "Software Engineer",status: .rejected,  salary: nil,       notes: nil)  // Rejected application
    ]
}
