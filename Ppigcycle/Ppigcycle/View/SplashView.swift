//
//  SplashView.swift
//  Ppigcycle
//
//  Created by 왕서희 on 2023/02/27.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive: Bool = false

    
    var body: some View {
                
        ZStack {
            Color(r:254, g: 251, b: 233).ignoresSafeArea()
            if self.isActive {
                MainView()
            } else {
                Image("logo").resizable().scaledToFit().frame(width: 120, height: 100)
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation{self.isActive = true}
            }
        }
        
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
