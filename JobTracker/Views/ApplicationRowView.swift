//
//  ApplicationRowView.swift
//  JobTracker
//
//  Created by abhishek on 26/11/26.
//

import SwiftUI

struct ApplicationRowView: View {

    let jobApplication: JobApplication

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {

                Text(jobApplication.company)
                    .font(.headline)

                Text(jobApplication.role)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                Group {
                    if let salary = jobApplication.salary {
                        Text(salary, format: .currency(code: "INR"))
                    } else {
                        Text("Salary not specified")
                    }
                }.font(.caption)
                    .foregroundStyle(.secondary)

            }

            Spacer()

            StatusBadgeView(status: jobApplication.status)
        }
    }
}

#Preview {
    VStack(spacing: 16) {
        ForEach(MockApplications.samples) { application in
            ApplicationRowView(jobApplication: application)
        }
    }
    .padding()
}
