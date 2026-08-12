//
//  AllExpensesView.swift
//  SARK
//
//  Created by Danah yousef Almansour on 22/02/1448 AH.
//

import SwiftUI

struct AllExpensesView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedTab = 2
    
    // Search & Filter States
    @State private var searchText = ""
    @State private var selectedFilter = "This Month"
    
    // Array referencing the Expense struct defined in Expenses.swift
    let allExpenses = [
        Expense(title: "Logo Design", category: "Design", date: "May 12, 2025", amount: "SAR 500", assetName: "PaintBrush"),
        Expense(title: "Marketing Ads", category: "Marketing", date: "May 10, 2025", amount: "SAR 2,000", assetName: "speakers"),
        Expense(title: "Domain & Hosting", category: "Services", date: "May 10, 2025", amount: "SAR 350", assetName: "World"),
        Expense(title: "Prototype Materials", category: "Development", date: "May 7, 2025", amount: "SAR 2,200", assetName: "Box"),
        Expense(title: "Customer Survey", category: "Research", date: "May 5, 2025", amount: "SAR 150", assetName: "Survey"),
        Expense(title: "Printing", category: "Design", date: "May 2, 2025", amount: "SAR 100", assetName: "Print"),
        Expense(title: "Equipment", category: "Hardware", date: "Apr 30, 2025", amount: "SAR 1,050", assetName: "Equipment")
    ]
    
    var filteredExpenses: [Expense] {
        if searchText.isEmpty {
            return allExpenses
        } else {
            return allExpenses.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color("Background")
                .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // MARK: - Header
                    HStack {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(Color("priemary text"))
                        }
                        
                        Spacer()
                        
                        Text("All Expenses")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color("priemary text"))
                        
                        Spacer()
                        
                        Color.clear
                            .frame(width: 18, height: 18)
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    // MARK: - Search Bar & Filter Button
                    HStack(spacing: 12) {
                        HStack(spacing: 10) {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 16))
                                .foregroundColor(Color("faded text"))
                            
                            TextField("Search expenses..", text: $searchText)
                                .font(.system(size: 15))
                                .foregroundColor(Color("priemary text"))
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 14)
                        .background(Color("boxes"))
                        .cornerRadius(20)
                        
                        Button(action: {
                            // Filter action
                        }) {
                            Image(systemName: "slider.horizontal.3")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(Color("priemary text"))
                                .frame(width: 50, height: 50)
                                .background(Color("boxes"))
                                .cornerRadius(20)
                        }
                    }
                    .padding(.horizontal)
                    
                    // MARK: - Total Spent Summary Card
                    VStack(alignment: .leading, spacing: 16) {
                        HStack(alignment: .top) {
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Total Spent")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(Color("faded text"))
                                
                                Text("SAR 5,350")
                                    .font(.system(size: 26, weight: .bold))
                                    .foregroundColor(Color("priemary text"))
                            }
                            
                            Spacer()
                            
                            Menu {
                                Button("This Month") { selectedFilter = "This Month" }
                                Button("Last Month") { selectedFilter = "Last Month" }
                                Button("All Time") { selectedFilter = "All Time" }
                            } label: {
                                HStack(spacing: 4) {
                                    Text(selectedFilter)
                                        .font(.system(size: 13, weight: .semibold))
                                    Image(systemName: "chevron.down")
                                        .font(.system(size: 11, weight: .semibold))
                                }
                                .foregroundColor(Color("priemary text"))
                            }
                        }
                        
                        Divider()
                        
                        HStack(spacing: 0) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Categories")
                                    .font(.system(size: 13, weight: .medium))
                                    .foregroundColor(Color("faded text"))
                                Text("4")
                                    .font(.system(size: 15, weight: .bold))
                                    .foregroundColor(Color("priemary text"))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Divider()
                                .frame(height: 30)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Transactions")
                                    .font(.system(size: 13, weight: .medium))
                                    .foregroundColor(Color("faded text"))
                                Text("12")
                                    .font(.system(size: 15, weight: .bold))
                                    .foregroundColor(Color("priemary text"))
                            }
                            .padding(.leading, 12)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .padding(20)
                    .background(Color("boxes"))
                    .cornerRadius(20)
                    .padding(.horizontal)
                    
                    // MARK: - Expenses List with Navigation Links
                    VStack(spacing: 0) {
                        ForEach(Array(filteredExpenses.enumerated()), id: \.element.id) { index, expense in
                            NavigationLink(destination: ExpenseDetailView(
                                title: expense.title,
                                category: expense.category,
                                amount: expense.amount,
                                date: expense.date,
                                paymentMethod: expense.paymentMethod,
                                status: expense.status,
                                notes: expense.notes,
                                assetName: expense.assetName,
                                attachmentName: expense.attachmentName,
                                attachmentSize: expense.attachmentSize
                            )) {
                                HStack(spacing: 14) {
                                    Image(expense.assetName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 32, height: 32)
                                    
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(expense.title)
                                            .font(.system(size: 14, weight: .semibold))
                                            .foregroundColor(Color("priemary text"))
                                        Text(expense.date)
                                            .font(.system(size: 12))
                                            .foregroundColor(Color("faded text"))
                                    }
                                    
                                    Spacer()
                                    
                                    Text(expense.amount)
                                        .font(.system(size: 14, weight: .bold))
                                        .foregroundColor(Color("priemary text"))
                                    
                                    Image(systemName: "chevron.right")
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundColor(Color("faded text"))
                                }
                                .padding(.vertical, 14)
                                .padding(.horizontal, 16)
                            }
                            
                            if index < filteredExpenses.count - 1 {
                                Divider()
                                    .padding(.leading, 62)
                            }
                        }
                    }
                    .background(Color("boxes"))
                    .cornerRadius(20)
                    .padding(.horizontal)
                    
                    Spacer()
                        .frame(height: 90)
                }
            }
            
            CustomTabBar(selectedTab: $selectedTab)
                .padding(.bottom, 8)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    NavigationStack {
        AllExpensesView()
    }
}
