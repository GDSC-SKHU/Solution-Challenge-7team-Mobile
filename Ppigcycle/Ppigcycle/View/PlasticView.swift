//
//  plastic.swift
//  Ppigcycle
//
//  Created by 왕서희 on 2023/03/16.
//

import SwiftUI

struct PlasticView: View {
    var body: some View {
        Text(" - 재활용공장에서 재활용 회수 업체 선별장에서 운송되어 온 폐PET병을 투입합니다.\n\n - 금속류, 일반플라스틱, 기타 쓰레기, 알루미늄 병뚜껑 등 비PET을 선별 및 수거합니다.\n\n  - PET병의 색상에 따라 무색과 유색, 복합으로 분류합니다. \n\n - 분류한 pet병을 플레이크 형태로 잘게 부숩니다. \n\n - 살균 및 세척 과정을 통해 약품 세척 탱크 바닥에 비중이 큰 PET는 가라앉으며, 상대적으로 비중이 작은 라벨과 PE, PP재질의 병뚜껑은 수면에 떠오르게 되어 이물질이 제거 됩니다.\n\n - 세척분의 수분을 탈수 및 건조하여 작은 알갱이 형태의 재생원료가 완성됩니다.\n\n - 출고 전 최종 색상 선별 까지 완료된 재생원료를 색상 별로 포장해 출고합니다.\n\n - 이렇게 출고된 재생원료는 솜, 건축단열재, 티셔츠, 페트와이어, 부직포 등 다양한 제품의 원료로 사용됩니다.")
    }
}

struct PlasticView_Previews: PreviewProvider {
    static var previews: some View {
        PlasticView()
    }
}
