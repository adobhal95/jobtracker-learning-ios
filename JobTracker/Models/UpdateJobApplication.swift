//
//  UpdateJobApplication.swift
//  JobTracker
//
//  Created by abhishek on 27/11/26.
//

import Foundation


struct UpdateJobApplication: Encodable {
    let status: ApplicationStatus
    let salary: Double?
    let notes: String?
}
