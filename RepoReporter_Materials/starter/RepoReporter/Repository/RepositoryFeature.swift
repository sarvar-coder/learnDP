
import Combine
import ComposableArchitecture

struct RepositoryState: Equatable {
  
  var repositories = [RepositoryModel]()
  
  var favoriteRepositories = [RepositoryModel]()
}


enum RepositoryAction: Equatable {
  
  case onAppear  // send request API
  
  case dataLoad(Result<[RepositoryModel], APIError>)  // finish the request Load either with Data or Error
  
  case favoriteButtonTapped(RepositoryModel) // save repository to favorites.
}

struct RepositoryEnvironment {
  
  var repositoryRequest: (JSONDecoder) -> Effect<[RepositoryModel], APIError>
}

let repositoryReducer = Reducer<
  RepositoryState,
  RepositoryAction,
  SystemEnvironment<RepositoryEnvironment>
> { state, action, enviroment in
  switch action {
  case .onAppear:
    return enviroment.repositoryRequest(enviroment.decoder())
      .receive(on: enviroment.mainQueue())
      .catchToEffect()
      .map(RepositoryAction.dataLoad)
  case let .dataLoad(result):
    switch result {
    case.success(let repositories):
      state.repositories = repositories
    case .failure(let apiError):
      print(apiError.localizedDescription)
    }
    return Effect.none
  case .favoriteButtonTapped(let repository):
    if state.favoriteRepositories.contains(repository) {
      state.favoriteRepositories.removeAll { $0 == repository }
    } else {
      state.favoriteRepositories.append(repository)
    }
    return Effect.none
  }
}
