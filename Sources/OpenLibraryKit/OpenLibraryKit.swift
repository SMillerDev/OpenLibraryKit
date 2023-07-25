import Foundation

public struct OpenLibraryKit {
    fileprivate let apiLib: Api

    public init() {
        apiLib = Api()
    }

    public var auth: AuthAPI {
        get { return AuthAPI(apiLib) }
    }

    public var myBooks: MyBooksAPI {
        get { return MyBooksAPI(apiLib) }
    }

    public var profile: ProfileAPI {
        get { return ProfileAPI(apiLib) }
    }

    public var author: AuthorsAPI {
        get { return AuthorsAPI(apiLib) }
    }

    public var books: BooksAPI {
        get { return BooksAPI(apiLib) }
    }

    public var lists: ListsAPI {
        get { return ListsAPI(apiLib) }
    }

    public var read: ReadAPI {
        get { return ReadAPI(apiLib) }
    }

    public var recentChanges: RecentChangesAPI {
        get { return RecentChangesAPI(apiLib) }
    }

    public var search: SearchAPI {
        get { return SearchAPI(apiLib) }
    }

    public var searchContent: SearchContentAPI {
        get { return SearchContentAPI(apiLib) }
    }

    public var subjects: SubjectsAPI {
        get { return SubjectsAPI(apiLib) }
    }

    public var trending: TrendingAPI {
        get { return TrendingAPI(apiLib) }
    }
}
