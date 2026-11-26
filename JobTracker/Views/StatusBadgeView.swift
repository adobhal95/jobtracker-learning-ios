//
//  BadgeStatusView.swift
//  JobTracker
//
//  Created by abhishek on 26/11/26.
//

import SwiftUI

struct StatusBadgeView: View {
    let status: ApplicationStatus

    var body: some View {
        Text(status.rawValue.capitalized)
            .font(.caption)
            .fontWeight(.semibold)
            .foregroundStyle(status.color)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(status.color.opacity(0.12), in: Capsule())
    }
}
