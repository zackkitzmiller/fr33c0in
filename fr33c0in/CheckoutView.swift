//
//  CheckoutView.swift
//  fr33c0in
//
//  Created by Zack Kitzmiller on 11/15/20.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    static let paymentTypes = ["Cash", "Debit", "iDine Points"]
    static let tipAmounts = [10, 15, 20, 25, 0]
    
    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1
    @State private var showingPaymentAlert = false
    
    
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    
    var body: some View {
        Form {
            Section {
                Picker("Pay Me", selection: $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
                
                Toggle(isOn: $addLoyaltyDetails.animation()) {
                    Text("Add Loyalty")
                }
                
                if addLoyaltyDetails {
                    TextField("z19r.id", text: $loyaltyNumber)
                }
            }
            
            Section(header: Text("Tip The Fucks?")) {
                Picker("%", selection: $tipAmount) {
                    ForEach(0 ..< Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }

            Section(header: Text("u 0we me : $\(totalPrice, specifier: "%.2f")")
                        .font(.largeTitle)) {
                Button("order.") {
                    self.showingPaymentAlert.toggle()
                }
            }
        }.navigationBarTitle(Text("Payment"), displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert, content: {
            Alert(title: Text("confirmed"),
                  message: Text("you paid $\(totalPrice, specifier: "%.2f"), loser"),
                  dismissButton: .default(Text("'k")))
        })
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
