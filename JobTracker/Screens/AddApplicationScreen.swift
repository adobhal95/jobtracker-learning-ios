//
//  AddApplicationScreen.swift
//  JobTracker
//
//  Created by abhishek on 26/11/26.
//

import SwiftUI

struct AddApplicationScreen: View {
    @State private var company = ""
    @State private var role = ""
    @State private var status: ApplicationStatus = .saved
    @State private var salary: Double?
    @State private var notes = ""

    let onSave: (NewJobApplication) -> Void

    private func saveApplication() {
        guard isFormValid else {
            return
        }
        let trimmedNotes = notes.trimmingCharacters(
            in: .whitespacesAndNewlines
        )
        let payload = NewJobApplication(
            company: company.trimmingCharacters(
                in: .whitespacesAndNewlines
            ),
            role: role.trimmingCharacters(
                in: .whitespacesAndNewlines
            ),
            status: status,
            salary: salary,
            notes: trimmedNotes.isEmpty ? nil : notes
        )
        onSave(payload)
        dismiss()
    }

    private var isFormValid: Bool {
        !company.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            && !role.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            && (salary.map { $0.isFinite && $0 >= 0 } ?? true)
    }

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            Form {
                Section("Job Information") {
                    // Company and role fields
                    TextField("Company", text: $company)
                    TextField("Role", text: $role)
                }

                Section("Application Details") {
                    // Status and salary
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
                    // Multiline text input
                    TextEditor(text: $notes)
                        .frame(minHeight: 100)
                }
            }
            .navigationTitle("Add Application")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button("Save",action:saveApplication)
                        .disabled(!isFormValid)
                }
            }
        }
    }
}

#Preview {
    AddApplicationScreen { newApplication in

    }
}
