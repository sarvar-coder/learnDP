/// Copyright (c) 2021 Razeware LLC


import SwiftUI
import ComposableArchitecture

struct RootView: View {
  let store: Store<RootState, RootAction>
  var body: some View {
    WithViewStore(self.store.stateless) { _ in
      TabView {
        RepositoryListView(
          store: store.scope(
            state: \.repositoryState,
            action: RootAction.repositoryAction))
          .tabItem {
            Image(systemName: "list.bullet")
            Text("Repositories")
          }

        FavoritesListView(
          store: store.scope(
            state: \.repositoryState,
            action: RootAction.repositoryAction))
          .tabItem {
            Image(systemName: "heart.fill")
            Text("Favorites")
          }

        UserView(
          store: store.scope(
            state: \.userState,
            action: RootAction.userAction))
        .tabItem {
          Image(systemName: "person.fill")
          Text("User")
        }
      }
      .accentColor(Color("rw-green"))
    }
  }
}

struct RootView_Previews: PreviewProvider {
  static var previews: some View {
    let rootView = RootView(
      store: Store(
        initialState: RootState(),
        reducer: rootReducer,
        environment: .dev(environment: RootEnvironment())))
    return rootView
  }
}
