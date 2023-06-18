import XCTest
@testable import OpenLibraryKit

final class OpenLibraryKitTests: XCTestCase {
    func testMyWantedBooks() async throws {
        let list = try await OpenLibraryKit().myBooks().wanted(user: "smillernl")
        XCTAssertFalse(list.isEmpty)
    }

    func testMyReadingBooks() async throws {
        let list = try await OpenLibraryKit().myBooks().reading(user: "smillernl")
        XCTAssertFalse(list.isEmpty)
    }

    func testMyReadBooks() async throws {
        let list = try await OpenLibraryKit().myBooks().read(user: "smillernl")
        XCTAssertFalse(list.isEmpty)
    }

    func testProfile() async throws {
        let profile = try await OpenLibraryKit().profile().get(user: "smillernl")
        XCTAssertFalse(profile.displayname.isEmpty)
    }

    func testAuthor() async throws {
        let author = try await OpenLibraryKit().author().author(id: "OL272947A")
        XCTAssertFalse(author.alternateNames.isEmpty)
    }

    func testAuthorWorks() async throws {
        let list = try await OpenLibraryKit().author().works(id: "OL272947A")
        XCTAssertFalse(list.isEmpty)
    }

    func testAuthorSearch() async throws {
        let list = try await OpenLibraryKit().author().search(query: "Douglas Adams")
        XCTAssertFalse(list.isEmpty)
        XCTAssertEqual(list.first?.key, "OL272947A")
    }

    func testAuthorCover() async throws {
        let cover = try await OpenLibraryKit().author().image(id: "OL272947A")
        XCTAssertEqual(cover.olid, "OL272947A")
    }

    func testBookWork() async throws {
        let item = try await OpenLibraryKit().books().work(id: "OL2163649W")
        XCTAssertEqual(item.key, "/works/OL2163649W")
    }

    func testBookEditionByISBN() async throws {
        let item = try await OpenLibraryKit().books().edition(isbn: "7532754685")
        XCTAssertEqual(item.key, "/books/OL27273349M")
    }

    func testBookEditions() async throws {
        let list = try await OpenLibraryKit().books().editions(id: "OL2163649W")
        XCTAssertFalse(list.isEmpty)
    }

    func testBookEdition() async throws {
        let item = try await OpenLibraryKit().books().edition(id: "OL32832269M")
        XCTAssertEqual(item.key, "/books/OL32832269M")
    }

    func testBookRating() async throws {
        let item = try await OpenLibraryKit().books().ratings(id: "OL2163649W")
        XCTAssertGreaterThan(item.summary.average, 1.0)
    }

    func testBookShelves() async throws {
        let item = try await OpenLibraryKit().books().shelves(id: "OL2163649W")
        XCTAssertGreaterThan(item.counts.alreadyRead, 2)
    }

    func testBookCover() async throws {
        let item = try await OpenLibraryKit().books().image(id: "OL27273349M")
        XCTAssertEqual(item.olid, "OL27273349M")
    }

    func testBookCoverISBN() async throws {
        let item = try await OpenLibraryKit().books().image(isbn: "7532754685")
        XCTAssertEqual(item.olid, "OL27273349M")
    }

    func testLogin() async throws {
        let login = try await OpenLibraryKit().auth().login(user: "sean", secret: "test")
        XCTAssertEqual(login, "sean")
    }
}
