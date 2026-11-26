//
//  JobTrackerApp.swift
//  JobTracker
//
//  Created by abhishek on 25/11/26.
//

import SwiftUI

@main
struct JobTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ApplicationListScreen(applications: MockApplications.samples)
        }
    }
}
