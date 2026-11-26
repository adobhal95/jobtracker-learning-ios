//
//  ApplicationListScreen.swift
//  JobTracker
//
//  Created by abhishek on 26/11/26.
//

import SwiftUI

/**
 A screen that displays a list of job applications.
 
 This view owns its state for the list of applications and allows users to add new applications.
 New applications can be added by presenting a modal sheet.
 */
struct ApplicationListScreen: View {
    /// The list of job applications displayed in this view. Private to encapsulate state.
    @State private var applications: [JobApplication]
    /// Controls whether the AddApplicationScreen sheet is presented. Private to encapsulate state.
    @State private var isAddApplicationPresented = false

    /// Initializes the view-owned state using the supplied
    /// initial collection of job applications.
    init(applications: [JobApplication] = []) {
        _applications = State(initialValue: applications)
    }

    var body: some View {
        // NavigationStack provides navigation capabilities along with a title and toolbar area.
        NavigationStack {
            // Render a row for each JobApplication in the list.
            List(applications) { application in
                ApplicationRowView(jobApplication: application)
            }
            .navigationTitle("Applications")
            // Toolbar with a plus button that presents the AddApplicationScreen.
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAddApplicationPresented = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .accessibilityLabel("Add Application")
                }
            }
        }
        // Modal sheet presentation of AddApplicationScreen, shown when isAddApplicationPresented is true.
        .sheet(isPresented: $isAddApplicationPresented) {
            AddApplicationScreen { newApplication in
                let nextID = (applications.map(\.id).max() ?? 0) + 1
                applications.append(
                    JobApplication(
                    id: nextID,
                    company: newApplication.company,
                    role: newApplication.role,
                    status: newApplication.status,
                    salary: newApplication.salary,
                    notes: newApplication.notes
                ))
            }
        }
    }
}

#Preview {
    ApplicationListScreen(applications: MockApplications.samples)
}
