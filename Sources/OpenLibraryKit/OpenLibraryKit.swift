import Foundation

public struct OpenLibraryKit {
    let apiLib: Api
    public init() {
        apiLib = Api()
    }

    public func auth() -> AuthAPI {
        return AuthAPI(apiLib)
    }

    public func myBooks() -> MyBooksAPI {
        return MyBooksAPI(apiLib)
    }

    public func profile() -> ProfileAPI {
        return ProfileAPI(apiLib)
    }

    public func author() -> AuthorsAPI {
        return AuthorsAPI(apiLib)
    }

    public func books() -> BooksAPI {
        return BooksAPI(apiLib)
    }

    public func lists() -> ListsAPI {
        return ListsAPI(apiLib)
    }

    public func read() -> ReadAPI {
        return ReadAPI(apiLib)
    }

    public func recentChanges() -> RecentChangesAPI {
        return RecentChangesAPI(apiLib)
    }

    public func search() -> SearchAPI {
        return SearchAPI(apiLib)
    }

    public func searchContent() -> SearchContentAPI {
        return SearchContentAPI(apiLib)
    }

    public func subjects() -> SubjectsAPI {
        return SubjectsAPI(apiLib)
    }
}
