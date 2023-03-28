//
//  GlassView.swift
//  ppigcycle
//
//  Created by Jinhee on 2023/03/26.
//

import SwiftUI

struct GlassView: View {
    var body: some View {
        ZStack {
            Color(r:254, g: 251, b: 233).ignoresSafeArea()
            VStack {
                Text("유리 분리수거 과정")
                    .bold()
                    .padding()
                    .font(.system(size: 18))
                Text(" - 분리배출 후 회수된 혼합 폐유리병은 색상 선별 라인 투입구에 투입됩니다. \n\n - 폐유리병 색상에 따라 백색, 갈색, 녹색으로 선별합니다. \n\n - 선별된 폐유리병을 파쇄합니다. 파쇄된 유리에서 나온 이물질을 선별합니다. \n\n - 이때 도자기류 등 재활이 불가능한 이물질도 이때 선별됩니다. \n\n - 마그넷을 이용하여 뚜껑 등과 같은 금속류를 선별합니다. \n\n - 파쇄된 유리병을 가공하여 유리 재생원료를 생산합니다. \n\n - 이렇게 생산된 재생원료는 용융해 새로운 유리병을 생산하는데 쓰이거나 글라스비드, 글라스타일, 유리블록 등 다양한 제품의 원료로 사용됩니다.")
            }
        }
    }
}

struct GlassView_Previews: PreviewProvider {
    static var previews: some View {
        GlassView()
    }
}
