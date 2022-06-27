//
//  GroupsView.swift
//  VKWithSwiftUI
//
//  Created by Карим Руабхи on 24.06.2022.
//

import SwiftUI

struct GroupsView: View {
    @ObservedObject var viewModel: GroupViewModel

    init(viewModel: GroupViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List(viewModel.groups.sorted(by: { $0.name < $1.name })) { group in
            GroupCell(name: group.name, avatar: group.avatar)
        }
        .onAppear(perform: viewModel.fetch)
    }
}

struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView(viewModel: GroupViewModel())
    }
}
