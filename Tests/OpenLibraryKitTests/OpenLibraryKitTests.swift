import XCTest
@testable import OpenLibraryKit

final class OpenLibraryKitTests: XCTestCase {
    let kit: OpenLibraryKit = OpenLibraryKit()

    func testMyWantedBooks() async throws {
        let list = try await kit.myBooks.wanted(user: "smillernl")
        XCTAssertFalse(list.isEmpty)
    }

    func testMyReadingBooks() async throws {
        let list = try await kit.myBooks.reading(user: "smillernl")
        XCTAssertFalse(list.isEmpty)
    }

    func testMyReadBooks() async throws {
        let list = try await kit.myBooks.read(user: "smillernl")
        XCTAssertFalse(list.isEmpty)
    }

    func testProfile() async throws {
        let profile = try await kit.profile.get(user: "smillernl")
        XCTAssertFalse(profile.displayname.isEmpty)
    }

    func testAuthor() async throws {
        let author = try await kit.author.author(id: "OL272947A")
        XCTAssertFalse(author.alternateNames.isEmpty)
    }

    func testAuthorWorks() async throws {
        let list = try await kit.author.works(id: "OL272947A")
        XCTAssertFalse(list.isEmpty)
    }

    func testAuthorSearch() async throws {
        let list = try await kit.author.search("Douglas Adams")
        XCTAssertFalse(list.isEmpty)
        XCTAssertEqual(list.first?.key, "OL272947A")
    }

    func testAuthorCover() async throws {
        let cover = try await kit.author.image(id: "OL272947A")
        XCTAssertEqual(cover.olid, "OL272947A")
    }

    func testBookWork() async throws {
        let item = try await kit.books.work(id: "OL2163649W")
        XCTAssertEqual(item.key, "/works/OL2163649W")
        XCTAssertEqual(item.olid, "OL2163649W")
    }

    func testBookEditionByISBN() async throws {
        let item = try await kit.books.edition(isbn: "7532754685")
        XCTAssertEqual(item.key, "/books/OL27273349M")
        XCTAssertEqual(item.olid, "OL27273349M")
    }

    func testBookEditions() async throws {
        let list = try await kit.books.editions(id: "OL2163649W")
        XCTAssertFalse(list.isEmpty)
    }

    func testBookEdition() async throws {
        let item = try await kit.books.edition(id: "OL32832269M")
        XCTAssertEqual(item.key, "/books/OL32832269M")
        XCTAssertEqual(item.olid, "OL32832269M")
    }

    func testBookRating() async throws {
        let item = try await kit.books.ratings(id: "OL2163649W")
        XCTAssertNotNil(item.summary?.average)
        XCTAssertGreaterThan(item.summary?.average ?? 0.0, 1.0)
    }

    func testBookShelves() async throws {
        let item = try await kit.books.shelves(id: "OL2163649W")
        XCTAssertGreaterThan(item.counts.alreadyRead, 2)
    }

    func testBookCover() async throws {
        let item = try await kit.books.image(id: "OL27273349M")
        XCTAssertEqual(item.olid, "OL27273349M")
    }

    func testBookCoverISBN() async throws {
        let item = try await kit.books.image(isbn: "7532754685")
        XCTAssertEqual(item.olid, "OL27273349M")
    }

    func testLogin() async throws {
        let login = try await kit.auth.login(user: "sean", secret: "test")
        XCTAssertEqual(login, "sean")
    }

    func testListsForUser() async throws {
        let list = try await kit.lists.listFor(user: "george08")
        XCTAssertFalse(list.isEmpty)
        XCTAssertEqual(list.first?.name, "Museum in a Box")
    }

    func testListsForSubject() async throws {
        let list = try await kit.lists.listFor(subject: .works, id: "OL8721462W")
        XCTAssertFalse(list.isEmpty)
        XCTAssertEqual(list.first?.name, "picks")
    }

    func testList() async throws {
        let list = try await kit.lists.single(user: "george08", id: "OL97L")
        XCTAssertEqual(list.name, "Time Travel")
    }

    func testListsSearch() async throws {
        let list = try await kit.lists.search("book")
        XCTAssertFalse(list.isEmpty)
        XCTAssertEqual(list.first?.name, "book")
    }

    func testRecentChanges() async throws {
        let list = try await kit.recentChanges.changes(type: .addBook)
        XCTAssertFalse(list.isEmpty)
        XCTAssertEqual(list.first?.kind, ChangesType.addBook.rawValue)
    }

    func testSubject() async throws {
        let item = try await kit.subjects.subject("love")
        XCTAssertEqual(item.name, "love")
    }

    func testRead() async throws {
        let item = try await kit.read.fetch(id: "7532754685", type: .isbn)
        XCTAssertFalse(item.records.isEmpty)
        XCTAssertFalse(item.items.isEmpty)
    }

    func testSearch() async throws {
        let list = try await kit.search.search("Lord of the Rings")
        XCTAssertFalse(list.isEmpty)
    }

    func testSearchContent() async throws {
        throw XCTSkip("Not supported yet!")
        let search = try await OpenLibraryKit().searchContent.search("Test", itemId: "a", path: "/b")
        XCTAssertEqual(search.iaId, "love")
    }

}
