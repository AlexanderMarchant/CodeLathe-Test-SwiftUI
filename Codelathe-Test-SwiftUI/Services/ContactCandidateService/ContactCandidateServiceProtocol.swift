//
//  ContactCandidateServiceProtocol.swift
//  CodeLathe-Test
//
//  Created by Alex Marchant on 14/01/2021.
//

import Foundation
import UIKit

protocol ContactCandidateServiceProtocol {
    
    func sendEmail(
        recipientEmail: String,
        recipientFirstName: String,
        displayedOn viewController: UIViewController)
    
    func callNumber(phoneNumber: String)
    
}
