//
//  BudgetOverviewView.swift
//  SARK
//
//  Created by Danah yousef Almansour on 22/02/1448 AH.
//

import SwiftUI

struct BudgetOverviewView: View {
    @State private var selectedTab = 2
    
    // State variables
    @State private var isShowingAddExpense = false
    
    let expenses = [
        Expense(title: "Logo Design", date: "May 12, 2025", amount: "SAR 500", assetName: "PaintBrush"),
        Expense(title: "Marketing Ads", date: "May 10, 2025", amount: "SAR 2,000", assetName: "speakers"),
        Expense(title: "Domain & Hosting", date: "May 10, 2025", amount: "SAR 350", assetName: "World"),
        Expense(title: "Prototype Materials", date: "May 7, 2025", amount: "SAR 2,200", assetName: "Box")
    ]
    
    var body: some View {
        // Wrapped in NavigationStack to enable screen transitions
        NavigationStack {
            ZStack(alignment: .bottom) {
                Color("Background")
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        // MARK: Top Navigation Header
                        HStack {
                            Button(action: {}) {
                                Image(systemName: "chevron.left")
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(Color("priemary text"))
                            }
                            Spacer()
                            Text("Lena's coffee shop")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(Color("priemary text"))
                            Spacer()
                            Color.clear.frame(width: 18, height: 18)
                        }
                        .padding(.horizontal)
                        .padding(.top, 10)
                        
                        // MARK: Header Titles
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Budget Overview")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color("priemary text"))
                            Text("Track all project expenses in one place.")
                                .font(.system(size: 14))
                                .foregroundColor(Color("faded text"))
                        }
                        .padding(.horizontal)
                        
                        // MARK: Total Budget Summary Card
                        VStack(alignment: .leading, spacing: 16) {
                            HStack(alignment: .top) {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text("Total Budget")
                                        .font(.system(size: 14, weight: .medium))
                                        .foregroundColor(Color("faded text"))
                                    Text("SAR 15,000")
                                        .font(.system(size: 28, weight: .bold))
                                        .foregroundColor(Color("priemary text"))
                                }
                                Spacer()
                                Image("Wallet")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 48, height: 48)
                            }
                            
                            HStack(spacing: 0) {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Spent")
                                        .font(.system(size: 13, weight: .medium))
                                        .foregroundColor(Color("faded text"))
                                    Text("SAR 5,350")
                                        .font(.system(size: 15, weight: .bold))
                                        .foregroundColor(Color("appOrange"))
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Divider().frame(height: 30)
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Remaining")
                                        .font(.system(size: 13, weight: .medium))
                                        .foregroundColor(Color("faded text"))
                                    Text("SAR 9,650")
                                        .font(.system(size: 15, weight: .bold))
                                        .foregroundColor(Color("appGreen"))
                                }
                                .padding(.leading, 12)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Divider().frame(height: 30)
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Used")
                                        .font(.system(size: 13, weight: .medium))
                                        .foregroundColor(Color("faded text"))
                                    Text("36%")
                                        .font(.system(size: 15, weight: .bold))
                                        .foregroundColor(Color("priemary text"))
                                }
                                .padding(.leading, 12)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding(.top, 8)
                        }
                        .padding(20)
                        .background(Color("boxes"))
                        .cornerRadius(20)
                        .padding(.horizontal)
                        
                        // MARK: Recent Expenses Section
                        VStack(spacing: 12) {
                            HStack {
                                Text("Recent Expenses")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(Color("priemary text"))
                                
                                Spacer()
                                
                                NavigationLink(destination: AllExpensesView()) {
                                    Text("View All")
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundColor(Color("appGreen"))
                                }
                            }
                            .padding(.horizontal, 4)
                            
                            VStack(spacing: 0) {
                                ForEach(Array(expenses.enumerated()), id: \.element.id) { index, expense in
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
                                    
                                    if index < expenses.count - 1 {
                                        Divider().padding(.leading, 62)
                                    }
                                }
                            }
                            .background(Color("boxes"))
                            .cornerRadius(20)
                        }
                        .padding(.horizontal)
                        
                        // MARK: Add Expense Button
                        Button(action: {
                            isShowingAddExpense = true
                        }) {
                            HStack(spacing: 8) {
                                Image(systemName: "plus")
                                    .font(.system(size: 16, weight: .bold))
                                Text("Add Expense")
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 52)
                            .background(Color("appGreen"))
                            .cornerRadius(26)
                        }
                        .padding(.horizontal)
                        .padding(.top, 4)
                        
                        Spacer().frame(height: 80)
                    }
                }
                
                CustomTabBar(selectedTab: $selectedTab)
                    .padding(.bottom, 8)
            }
            .navigationBarHidden(true)
        }
        .sheet(isPresented: $isShowingAddExpense) {
            AddExpenseView()
        }
    }
}

#Preview {
    BudgetOverviewView()
}
