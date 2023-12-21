//
//  Custom_Tab_View.swift
//  myserviceAppV1
//
//  Created by Hiarina Rakotoarivelo on 12/12/2023.
//

import SwiftUI

struct Custom_Tab_View: View {
    @Binding var tabSelection: Int
    @Namespace private var animationNamespace
    
    let tabBarItem: [(image: String, title: String)] = [
        ("house", "Home"),
        ("hands.clap", "MyServices"),
        ("ellipsis.message","Chat"),
        ("person", "Profile")
    ]
    var body: some View {
        ZStack {
            Capsule()
                .frame(height: 80)
                .foregroundColor(Color(.secondarySystemBackground))
                .shadow(radius: 2)
            HStack {
                ForEach(0..<4) {index in
                    Button {
                        tabSelection = index + 1
                    } label: {
                        VStack(spacing: 8) {
                            Spacer()
                            Image(systemName: tabBarItem[index].image)
                                .accentColor(.purple)
                            Text(tabBarItem[index].title)
                                .accentColor(.purple)
                                .font(.caption)
                            
                            if index + 1 == tabSelection {
                                Capsule()
                                    .frame(height: 8)
                                    .matchedGeometryEffect(id: "SelectedTabid", in: animationNamespace)
                                    .offset(y: 3)
                                
                            } else {
                                Capsule()
                                    .frame(height: 8)
                                    .foregroundColor(.clear)
                                    .offset(y: 3)
                            }
                        }
                        .foregroundColor(index + 1  == tabSelection ? .pink : .gray)
                    }

                }
            }
            .frame(height: 80)
            .clipShape(Capsule())
        }
        .padding(.horizontal)
    }
}

#Preview {
    Custom_Tab_View(tabSelection: .constant(1))
        .previewLayout(.sizeThatFits)
        .padding(.vertical)
}
