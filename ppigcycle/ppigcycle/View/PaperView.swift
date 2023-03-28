//
//  PaperView.swift
//  ppigcycle
//
//  Created by Jinhee on 2023/03/26.
//

import SwiftUI

struct PaperView: View {
    var body: some View {
        ZStack {
            Color(r:254, g: 251, b: 233).ignoresSafeArea()
            VStack{
                Text("종이 분리수거 과정")
                    .bold()
                    .padding()
                    .font(.system(size: 18))
                Text(" 해당하는 분리수거 방법이 없습니다.")
            }
        }
    }
}

struct PaperView_Previews: PreviewProvider {
    static var previews: some View {
        PaperView()
    }
}
