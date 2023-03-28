//
//  BarcodeScanView.swift
//  ppigcycle
//
//  Created by Jinhee on 2023/03/28.
//

import SwiftUI

struct BarcodeScanView: View {

    @StateObject var barcode = RestAPI()
    @Binding var barcodeNumber: String
    
    var body: some View {
        NavigationView {
            List {
                ForEach(barcode.posts, id: \.self) { result in
                    Text(result.goods_name)
                    Text(result.how)
                    Text(result.method)
                }
            }.navigationTitle("분리수거하는 방법")
                .listStyle(PlainListStyle())
        }.onAppear(perform: {
            let parameter: [String: Any] = ["barcodeNumber" : barcodeNumber]
            barcode.fetch(parameters: parameter)
        })
    }
}

//struct Test_Previews: PreviewProvider {
//    static var previews: some View {
//        Test()
//    }
//}
