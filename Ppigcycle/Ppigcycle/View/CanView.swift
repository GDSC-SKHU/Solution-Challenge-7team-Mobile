//
//  CanView.swift
//  Ppigcycle
//
//  Created by 왕서희 on 2023/03/14.
//

import SwiftUI

struct CanView: View {
    var body: some View {
        Text("-분리배출된 캔들은 수거되어 재활용사업장 선별시설에 투입됩니다.\n\n - 투입된 캔들은 철캔과 알루미늄캔으로 선별합니다.\n\n - 선별된 철캔과 알루미늄캔을 각각 압축하여 압축물로 만듭니다.\n\n - 만들어진 압축물은 제철소 및 합금업체 등으로 이송됩니다.\n\n - 이송된 압축물들은 용광로 등에서 철, 알루미늄으로 생산됩니다.\n\n - 생산된 철과 알루미늄은 다시 제품생산 공장으로 돌아가 강판, 철근, 금속캔, 자동차부품 등으로 다시 사용됩니다.")
    }
}

struct CanView_Previews: PreviewProvider {
    static var previews: some View {
        CanView()
    }
}
