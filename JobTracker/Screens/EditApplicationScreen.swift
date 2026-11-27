//
//  EditApplicationScreen.swift
//  JobTracker
//
//  Created by abhishek on 27/11/26.
//

//
//  ApplicationDetailScreen.swift
//  JobTracker
//
//  Created by abhishek on 27/11/26.
//

import SwiftUI

struct EditApplicationScreen: View {
    let jobApplication: JobApplication

    @State private var status: ApplicationStatus
    @State private var salary: Double?
    @State private var notes: String
    let onUpdate: (UpdateJobApplication) -> Void
    @Environment(\.dismiss) private var dismiss

    init(
        jobApplication: JobApplication,
        onUpdate: @escaping (UpdateJobApplication) -> Void
    ) {
        self.jobApplication = jobApplication
        self.onUpdate = onUpdate
        _salary = State(initialValue: jobApplication.salary)
        _status = State(initialValue: jobApplication.status)
        _notes = State(initialValue: jobApplication.notes ?? "")
    }


    private var isFormValid: Bool {
        salary.map { $0.isFinite && $0 >= 0 } ?? true
    }

    private func OnEdit() {
        guard isFormValid else { return }
        let trimmedNotes = notes.trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        let payload = UpdateJobApplication(
            status: status,
            salary: salary,
            notes: trimmedNotes.isEmpty ? nil : trimmedNotes
        )

        onUpdate(payload)

        dismiss()
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Job Information") {
                    LabeledContent(
                        "Company",
                        value: jobApplication.company
                    )
                    
                    LabeledContent(
                        "Role",
                        value: jobApplication.role
                    )
                }
                Section("Application Details") {
                    Picker("Status", selection: $status) {
                        ForEach(ApplicationStatus.allCases, id: \.self) {
                            status in
                            
                            Text(status.rawValue.capitalized)
                                .tag(status)
                        }
                    }
                    .pickerStyle(.menu)
                    
                    TextField(
                        "Expected salary",
                        value: $salary,
                        format: .number
                    )
                    .keyboardType(.decimalPad)
                }
                Section("Notes") {
                    TextEditor(text: $notes)
                        .frame(minHeight: 100)
                }
            }
            .navigationTitle(jobApplication.company)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save",action: OnEdit)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        EditApplicationScreen(jobApplication: MockApplications.samples[0]) {
            newApp in
        }
    }
}
