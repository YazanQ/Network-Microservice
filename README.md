# Network Microservice 

<p align="justify">
    <img src="https://img.shields.io/badge/Swift-5-orange.svg" />
    <img src="https://img.shields.io/badge/Platforms-iOS%20%7C%20watchOS-blue.svg?style=flat" />
</p>

Protocol oriented networking layer built natively with Swift

## Used Libraries

* No Library Used, Built from scratch with Latest Swift Language

## Examples

**1. Entities:**

* `Responses`

```swift
struct Person: Decodable {
    var id: String
    var name: String
    var username: String
    var email: String
    var age: Date?
}

struct VoidResponse: Decodable {
    // Some endpoints might return: 204 No Content
}
```

* `Parameters`

```swift
struct AddPersonParameters: Encodable {
    var name: String
    var username: String
    var email: String
    var age: Date
}
```

* `Base Response`

```swift
struct BaseResponse<T: Decodable>: Decodable {
    public let data: T?
    public let error: CoreError?
    public let statusCode: Int?
    public let message: String?
    public let timestamp: String?
    public let isNext: Bool?
    public let currentPage: Int?
    public let pageSize: Int?
    public var totalItems: Int?
    public var previous: Int?

    @discardableResult
    public func unwrap() throws -> T {
        try error.throwIfSome()

        return try data.unwrap(throwing: CoreError(message: message, code: statusCode))
    }
}
```

**2. UseCase:**

```swift
protocol PersonUseCase {
    func loadPersons() async throws -> [Book]
    func addPerson(_ parameters: AddPersonParameters) async throws -> Person
    func deletePerson(_ person: Person) async throws -> VoidResponse
}

final class APIPersonUseCase {
    
    private let apiClient: APIClient
    
    // Automatic configurations
    init(apiClient: APIClient = DefaultAPIClient()) {
        self.apiClient = apiClient
    }
}

extension APIPersonUseCase: PersonUseCase {
    func loadPerson() async throws -> [Person] {
        let request = RequestBuilder<[Person]>()
            .path("persons")
            .method(.get)
            .build()
        
        return try await apiClient.execute(request).value.unwrap()
    }
    
    func addPerson(_ parameters: AddPersonParameters) async throws -> Person {
        let request = RequestBuilder<Person>()
            .path("persons")
            .method(.post)
            .encode(parameters, bodyEncoding: .jsonEncoding)
            .build()
        
        return try await apiClient.execute(request).value.unwrap()
    }
    
    func deletePerson(_ book: Book) async throws -> VoidResponse {
        let request = RequestBuilder<VoidResponse>()
            .path("persons/\(person.id)")
            .method(.delete)
            .build()
        
        return try await apiClient.execute(request).value.unwrap()
    }
}
```
## Installation

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler.

Once you have your Swift package set up, adding Network Micro Service as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

#### Swift 4

```swift
dependencies: [ 
    .package(url: "https://github.com/YazanQ/Network-Microservice", from: "v1.0.0")
]
```

## Author

Yazan Qaisi

[![Twitter Follow](https://img.shields.io/twitter/follow/yazan_qaisi.svg?label=Yazan%20Qaisi&style=social)](https://twitter.com/yazan_qaisi)
