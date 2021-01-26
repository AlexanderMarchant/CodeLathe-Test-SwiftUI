//
//  VirtualCVViewModel.swift
//  Codelathe-Test-SwiftUI
//
//  Created by Alex Marchant on 25/01/2021.
//

import Foundation
import SwiftUI

public class VirtualCVViewModel: ObservableObject {
    
    let candidate: Candidate
    
    init(candidate: Candidate) {
        
        self.candidate = candidate
        
    }
    
    func emailCandidate() {
        ContactCandidateService.shared.sendEmail(recipientEmail: candidate.emailAddress, recipientFirstName: candidate.firstName)
    }
    
    func callCandidate() {
        ContactCandidateService.shared.callNumber(phoneNumber: candidate.phoneNumber)
    }
}
