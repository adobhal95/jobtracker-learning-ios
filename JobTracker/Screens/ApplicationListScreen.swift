//
//  ApplicationListScreen.swift
//  JobTracker
//
//  Created by abhishek on 26/11/26.
//

import SwiftUI

struct ApplicationListScreen: View {
    let applications: [JobApplication]
    @State private var isAddApplicationPresented = false

    var body: some View {
        NavigationStack {
            List(applications) { application in
                ApplicationRowView(jobApplication: application)
            }
            .navigationTitle("Applications")
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
        .sheet(isPresented: $isAddApplicationPresented) {
            AddApplicationScreen()
        }
    }
}

#Preview {
    ApplicationListScreen(applications: MockApplications.samples)
}
