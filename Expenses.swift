/
//  Expenses.swift
//  SARK
//
//  Created by Danah yousef Almansour on 23/02/1448 AH.
//

import SwiftUI

struct Expense: Identifiable {
    let id = UUID()
    var title: String
    var category: String = "General"
    var date: String
    var amount: String
    var paymentMethod: String = "Bank Transfer"
    var status: String = "Paid"
    var notes: String = ""
    var assetName: String
    var attachmentName: String = "receipt.pdf"
    var attachmentSize: String = "120 KB"
}
