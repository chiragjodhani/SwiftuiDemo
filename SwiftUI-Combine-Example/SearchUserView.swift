import SwiftUI

struct SearchUserView: View {
    @ObservedObject var viewModel = SearchUserViewModel()
    @State var showDetail = false
    var body: some View {
        NavigationView {
            VStack {
                SearchUserBar(text: $viewModel.name) {
                    self.viewModel.search()
                }
                
                List(viewModel.users) { user in
                    NavigationLink(destination: LandmarkDetail(viewModel: self.viewModel, user: user)) {
                        SearchUserRow(viewModel: self.viewModel, user: user)
                            .onAppear { self.viewModel.fetchImage(for: user) }
                    }
                }
            }
            .navigationBarTitle(Text("Users"))
        }
    }
}
