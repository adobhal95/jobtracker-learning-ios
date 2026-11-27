//
//  ApplicationDetailScreen.swift
//  JobTracker
//
//  Created by abhishek on 27/11/26.
//

import SwiftUI

struct ApplicationDetailScreen: View {
    let jobApplication: JobApplication
    @State private var isEditPresented = false
    var body: some View {
        Form {
            Section("APPLICATION INFORMATION") {
                LabeledContent("Company", value: jobApplication.company)
                LabeledContent("Role", value: jobApplication.role)
                LabeledContent("Status") {
                    StatusBadgeView(status: jobApplication.status)
                }
                if let salary = jobApplication.salary {
                    LabeledContent(
                        "Salary",
                        value: salary,
                        format: .currency(code: "INR")
                    )
                } else {
                    LabeledContent("Salary", value: "Salary not specified")
                }
            }
            Section("Notes") {
                if let notes = jobApplication.notes,
                    !notes.isEmpty
                {
                    Text(notes)
                } else {
                    Text("No notes added")
                        .foregroundStyle(.secondary)
                }
            }
        }
        .navigationTitle(jobApplication.company)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Edit") {
                    isEditPresented = true
                }
            }
        }
        .sheet(isPresented: $isEditPresented) {
            EditApplicationScreen(jobApplication: jobApplication) {
                jobApplication in
                let newPayload = UpdateJobApplication(
                    status: jobApplication.status,
                    salary: jobApplication.salary,
                    notes: jobApplication.notes ?? ""
                )
            }
        }
    }
}

#Preview {
    NavigationStack {
        ApplicationDetailScreen(jobApplication: MockApplications.samples[0])
    }
}
