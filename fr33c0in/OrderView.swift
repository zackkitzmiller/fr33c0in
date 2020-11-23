//
//  OrderView.swift
//  fr33c0in
//
//  Created by Zack Kitzmiller on 11/14/20.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }.onDelete(perform: deleteItems)
                }
                
                Section {
                    NavigationLink(destination: CheckoutView()) {
                        Text("place order")
                    }
                }.disabled(order.items.isEmpty)
            }.navigationBarTitle("order")
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        OrderView().environmentObject(order)
    }
}
