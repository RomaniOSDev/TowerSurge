//
//  TowerFactsView.swift
//  TowerSurge
//
//  Created by Роман Главацкий on 31.10.2025.
//

import SwiftUI

struct TowerFactsView: View {
    var body: some View {
        ZStack{
            Image(.qizBack)
                .resizable().ignoresSafeArea()
            VStack{
                ScrollView {
                    ForEach(FactsTower.allCases , id: \.self) { fact in
                        NavigationLink {
                            SimpleFactview(fact: fact)
                        } label: {
                            Image(fact.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }

                    }
                }
            }.padding()
        }
    }
}

#Preview {
    NavigationView { TowerFactsView() }
}


enum FactsTower: CaseIterable {
    case burj
    case shnghai
    case clock
    case ping
    case lotte
    case one
    case taipep
    case guangzhou
    
    var image: ImageResource {
        switch self {
            
        case .burj:
            return .burg1
        case .shnghai:
            return .shanhai2
        case .clock:
            return .clock
        case .ping:
            return .ping
        case .lotte:
            return .lott1
        case .one:
            return .one1E
        case .taipep:
            return .taipe1
        case .guangzhou:
            return .guango1
        }
    }
    
    var discriptImage: ImageResource {
        switch self {
            
            
        case .burj:
            return .burg2
        case .shnghai:
            return .shanhai1
        case .clock:
            return .clock2
        case .ping:
            return .ping2
        case .lotte:
            return .lot2
        case .one:
            return .one2
        case .taipep:
            return .taipe2
        case .guangzhou:
            return .guango2
        }
    }
}
