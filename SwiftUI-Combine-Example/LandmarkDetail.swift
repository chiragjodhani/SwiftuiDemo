/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing the details for a landmark.
*/

import SwiftUI

struct LandmarkDetail: View {
    
    @ObservedObject var viewModel: SearchUserViewModel
    @State var user: User
    
    var body: some View {
        VStack {
            viewModel.userImages[user].map { image in
                CircleImage(image: Image(uiImage: image))
                    .offset(x: 0, y: 0)
                    .padding(.bottom, 20)
            }
            VStack(alignment: .leading) {
                HStack {
                    Text(verbatim: user.login)
                        .font(.title)
                }
                
                HStack(alignment: .top) {
                    Text(verbatim: "\(user.id)")
                        .font(.subheadline)
                    Spacer()
                    Text(verbatim: user.login)
                        .font(.subheadline)
                }
            }
            .padding()
            
            Spacer()
        }
    }
}
