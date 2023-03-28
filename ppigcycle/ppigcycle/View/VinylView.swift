//
//  VinylView.swift
//  ppigcycle
//
//  Created by Jinhee on 2023/03/26.
//

import SwiftUI

struct VinylView: View {
    var body: some View {
        ZStack {
            Color(r:254, g: 251, b: 233).ignoresSafeArea()
            VStack {
                Text("비닐 분리수거 과정")
                    .bold()
                    .padding()
                    .font(.system(size: 18))
                Text(" - 가정에서 배출된 재활용 폐기물은 지자체나 사업자가 운영하는 선별센터로 수집되어 폐기물의 상태나 재질에 따라 선별됩니다. 이때 깨끗한 것들은 재활용이 되고, 오염된 플라스틱, 비닐과 같은 불에 타는 쓰레기, 가연성 폐기물은 압축되어 수도권매립지로 운송됩니다.\n\n - 반입된 폐기물은 크레인을 이용해 자동투입장치로 이동하며 파봉파쇄기를 통해 파쇄가 이루어집니다.\n\n - 파쇄가 완료된 폐기물은 컨베이어를 통해 입자의 크기, 무게, 재질에 따른 분리, 선별 등의 과정을 거칩니다. \n\n - 선별된 폐기물을 재질에 따라 용융압출, 용융성형, 압출성형, 열분해 및 냉각 등의 공정을 거쳐 재생원료, 재생제품, 재생 유류, 고형원료 등 을 생산합니다.")
            }
        }
    }
}

struct VinylView_Previews: PreviewProvider {
    static var previews: some View {
        VinylView()
    }
}
