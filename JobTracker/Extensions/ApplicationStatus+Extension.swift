//
//  ApplicationStatus+Extension.swift
//  JobTracker
//
//  Created by abhishek on 26/11/26.
//

import SwiftUI

/// UI helpers for `ApplicationStatus`.
/// Provides a semantic color mapping for visualizing status in SwiftUI components.
extension ApplicationStatus{
    /// Semantic color associated with this status, used for badges, labels, and accents.
    var color: Color {
        switch self {
        case .saved: return .gray
        case .applied: return .blue
        case .interview: return .orange
        case .offer: return .green
        case .rejected: return .red
        }
    }
}

