import Foundation
import ComposableArchitecture

func repositoryEffect(decoder: JSONDecoder) -> Effect<[RepositoryModel], APIError> {
  guard let url = URL(string: "https://api.github.com/users/raywenderlich/repos?sort=updated&per_page=10") else {
    fatalError("Error on creating url")
  }
  return URLSession.shared.dataTaskPublisher(for: url)
    .mapError { _ in APIError.downloadError }
    .map { data, _ in data }
    .decode(type: [RepositoryModel].self, decoder: decoder)
    .mapError { _ in APIError.decodingError }
    .eraseToEffect()
}

func dummyRepositoryEffect(decoder: JSONDecoder) -> Effect<[RepositoryModel], APIError> {
  let dummyRepositories = [
    RepositoryModel(
      name: "Repo 1",
      description: "This is the first repo. It has a long descriptive text which spans many lines.",
      stars: 5,
      forks: 5,
      language: "Swift"),
    RepositoryModel(
      name: "Repo 2",
      description: "This is another repo.",
      stars: 0,
      forks: 5,
      language: "Python"),
    RepositoryModel(
      name: "Repo 3",
      description: "This is the last repo.",
      stars: 5,
      forks: 0,
      language: "Rust")
  ]
  return Effect(value: dummyRepositories)
}
