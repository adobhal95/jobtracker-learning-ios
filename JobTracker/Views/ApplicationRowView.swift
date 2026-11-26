//
//  ApplicationRowView.swift
//  JobTracker
//
//  Created by abhishek on 26/11/26.
//

import SwiftUI

struct ApplicationRowView: View {
    var jobApplication:JobApplication
    var body: some View {
        HStack(){
            VStack{
                Text(jobApplication.company)
                Text(jobApplication.role)
                Text(jobApplication.salary ?? 0,format: .currency(code: "INR"))
            }
            Spacer()
            StatusBadgeView(status: jobApplication.status)
        }
    }
}

#Preview {
    ApplicationRowView(jobApplication: MockApplications.samples[0])
}
