//
//  TestView.swift
//  SF6FrameData
//
//  Created by Rafael Plinio on 29/07/23.
//

import SwiftUI
import StoreKit

struct TestView: View {
  @State private var myProduct: Product?
  
    var body: some View {
      VStack {
        Text(myProduct?.displayName ?? "")
        Text(myProduct?.description ?? "")
        Text(myProduct?.displayPrice ?? "")
        Text(myProduct?.price.description ?? "")
      }
      .task {
        myProduct = try? await Product.products(for: ["com.rafaelplinio.SF6FrameData.LargeTip"]).last
      }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
