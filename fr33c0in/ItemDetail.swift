//
//  ItemDetail.swift
//  fr33c0in
//
//  Created by Zack Kitzmiller on 11/14/20.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order
    
    var item: MenuItem
    
    var body: some View {
        VStack{
            ZStack(alignment:
                .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()
            
            Button("0rd3r") {
                self.order.add(item: self.item)
            }.font(.headline)
            
            Spacer()
        }.navigationBarTitle(Text(item.name),
                             displayMode: .inline)
            
    }
}


struct ItemDetail_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        NavigationView {
            ItemDetail(item:
                MenuItem.example).environmentObject(order)
        }
    }
}
