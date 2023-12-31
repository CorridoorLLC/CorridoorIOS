import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    var body: some View {
        VStack{
            Text("This is where you can login in case you need to access private maps, etc.")
            Button(action: viewModel.signIn){
                Text ("Sign in with Google")
                .frame (maxWidth: . infinity)
                .padding (.vertical, 8)
                .background(alignment: .leading){
                    Image ("Google")
                        .frame(width:30,alignment: .center)
                }
                .buttonStyle(.bordered)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel()) // Fixed here, passing the viewModel
    }
}
