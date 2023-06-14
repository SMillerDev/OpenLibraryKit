import XCTest
@testable import OpenLibraryKit

final class OpenLibraryKitTests: XCTestCase {
    func testMyWantedBooks() throws {
        let expectation = expectation(description: "MyBooks.wanted fetches books and returns in a callback")

        OpenLibraryKit().myBooks().wanted(user: "smillernl", completion: { result in
            XCTAssertNotNil(result)
            XCTAssertFalse(result!.isEmpty)
            expectation.fulfill()
        })

        waitForExpectations(timeout: 10) { error in
          if let error = error {
            XCTFail("waitForExpectationsWithTimeout errored: \(error)")
          }
        }
    }

    func testMyReadingBooks() throws {
        let expectation = expectation(description: "MyBooks.read fetches books and returns in a callback")

        OpenLibraryKit().myBooks().reading(user: "smillernl", completion: { result in
            XCTAssertNotNil(result)
            XCTAssertFalse(result!.isEmpty)
            expectation.fulfill()
        })

        waitForExpectations(timeout: 10) { error in
          if let error = error {
            XCTFail("waitForExpectationsWithTimeout errored: \(error)")
          }
        }
    }

    func testMyReadBooks() throws {
        let expectation = expectation(description: "MyBooks.read fetches books and returns in a callback")

        OpenLibraryKit().myBooks().read(user: "smillernl", completion: { result in
            XCTAssertNotNil(result)
            XCTAssertFalse(result?.isEmpty ?? true)
            expectation.fulfill()
        })

        waitForExpectations(timeout: 15) { error in
          if let error = error {
            XCTFail("waitForExpectationsWithTimeout errored: \(error)")
          }
        }
    }


    func testProfile() throws {
        let expectation = expectation(description: "Profile.get fetches profile and returns in a callback")

        OpenLibraryKit().profile().get(user: "smillernl", completion: { result in
            XCTAssertNotNil(result)
            expectation.fulfill()
        })

        waitForExpectations(timeout: 15) { error in
          if let error = error {
            XCTFail("waitForExpectationsWithTimeout errored: \(error)")
          }
        }
    }


    func testAuthor() throws {
        let expectation = expectation(description: "Authors.author fetches author and returns in a callback")

        OpenLibraryKit().author().author(id: "OL272947A", completion: { result in
            XCTAssertNotNil(result)
            expectation.fulfill()
        })

        waitForExpectations(timeout: 15) { error in
          if let error = error {
            XCTFail("waitForExpectationsWithTimeout errored: \(error)")
          }
        }
    }


    func testAuthorWorks() throws {
        let expectation = expectation(description: "Authors.works fetches author and returns in a callback")

        OpenLibraryKit().author().works(id: "OL272947A", completion: { result in
            XCTAssertNotNil(result)
            expectation.fulfill()
        })

        waitForExpectations(timeout: 15) { error in
          if let error = error {
            XCTFail("waitForExpectationsWithTimeout errored: \(error)")
          }
        }
    }


    func testAuthorSearch() throws {
        let expectation = expectation(description: "Authors.search fetches author and returns in a callback")

        OpenLibraryKit().author().search(query: "Douglas Adams", completion: { result in
            XCTAssertFalse(result.isEmpty)
            XCTAssertEqual(result.first?.key, "OL272947A")
            expectation.fulfill()
        })

        waitForExpectations(timeout: 15) { error in
          if let error = error {
            XCTFail("waitForExpectationsWithTimeout errored: \(error)")
          }
        }
    }


    func testAuthorCover() throws {
        let expectation = expectation(description: "Authors.image fetches cover image info and returns in a callback")

        OpenLibraryKit().author().image(id: "OL272947A", completion: { result in
            XCTAssertNotNil(result)
            XCTAssertEqual(result!.olid, "OL272947A")
            expectation.fulfill()
        })

        waitForExpectations(timeout: 15) { error in
          if let error = error {
            XCTFail("waitForExpectationsWithTimeout errored: \(error)")
          }
        }
    }



    func testBookWork() throws {
        let expectation = expectation(description: "Book.work fetches info and returns in a callback")

        OpenLibraryKit().books().work(id: "OL2163649W", completion: { result in
            XCTAssertNotNil(result)
            XCTAssertEqual(result!.key, "/works/OL2163649W")
            expectation.fulfill()
        })

        waitForExpectations(timeout: 15) { error in
          if let error = error {
            XCTFail("waitForExpectationsWithTimeout errored: \(error)")
          }
        }
    }



    func testBookEditionByISBN() throws {
        let expectation = expectation(description: "Book.work fetches info and returns in a callback")

        OpenLibraryKit().books().edition(isbn: "7532754685", completion: { result in
            XCTAssertNotNil(result)
            XCTAssertEqual(result!.key, "/books/OL27273349M")
            expectation.fulfill()
        })

        waitForExpectations(timeout: 15) { error in
          if let error = error {
            XCTFail("waitForExpectationsWithTimeout errored: \(error)")
          }
        }
    }



    func testBookEditions() throws {
        let expectation = expectation(description: "Book.editions fetches info and returns in a callback")

        OpenLibraryKit().books().editions(id: "OL2163649W", completion: { result in
            XCTAssertNotNil(result)
            XCTAssertFalse(result!.isEmpty)
            expectation.fulfill()
        })

        waitForExpectations(timeout: 15) { error in
          if let error = error {
            XCTFail("waitForExpectationsWithTimeout errored: \(error)")
          }
        }
    }



    func testBookEdition() throws {
        let expectation = expectation(description: "Book.edition fetches info and returns in a callback")

        OpenLibraryKit().books().edition(id: "OL32832269M", completion: { result in
            XCTAssertNotNil(result)
            XCTAssertEqual(result!.key, "/books/OL32832269M")
            expectation.fulfill()
        })

        waitForExpectations(timeout: 15) { error in
          if let error = error {
            XCTFail("waitForExpectationsWithTimeout errored: \(error)")
          }
        }
    }



    func testBookRating() throws {
        let expectation = expectation(description: "Book.rating fetches info and returns in a callback")

        OpenLibraryKit().books().ratings(id: "OL2163649W", completion: { result in
            XCTAssertNotNil(result)
            XCTAssertGreaterThan(result!.summary.average , 1.0)
            expectation.fulfill()
        })

        waitForExpectations(timeout: 15) { error in
          if let error = error {
            XCTFail("waitForExpectationsWithTimeout errored: \(error)")
          }
        }
    }



    func testBookShelves() throws {
        let expectation = expectation(description: "Book.shelves fetches info and returns in a callback")

        OpenLibraryKit().books().shelves(id: "OL2163649W", completion: { result in
            XCTAssertNotNil(result)
            XCTAssertGreaterThan(result!.counts.alreadyRead, 2)
            expectation.fulfill()
        })

        waitForExpectations(timeout: 15) { error in
          if let error = error {
            XCTFail("waitForExpectationsWithTimeout errored: \(error)")
          }
        }
    }



    func testBookCover() throws {
        let expectation = expectation(description: "Book.image fetches cover info and returns in a callback")

        OpenLibraryKit().books().image(id: "OL27273349M", completion: { result in
            XCTAssertNotNil(result)
            XCTAssertEqual(result!.olid, "OL27273349M")
            expectation.fulfill()
        })

        waitForExpectations(timeout: 15) { error in
          if let error = error {
            XCTFail("waitForExpectationsWithTimeout errored: \(error)")
          }
        }
    }


    func testBookCoverISBN() throws {
        let expectation = expectation(description: "Book.image fetches cover info and returns in a callback")

        OpenLibraryKit().books().image(isbn: "7532754685", completion: { result in
            XCTAssertNotNil(result)
            XCTAssertEqual(result!.olid, "OL27273349M")
            expectation.fulfill()
        })

        waitForExpectations(timeout: 15) { error in
          if let error = error {
            XCTFail("waitForExpectationsWithTimeout errored: \(error)")
          }
        }
    }

    func testLogin() throws {
        throw XCTSkip("Not implemented yet!")
        let expectation = expectation(description: "Login logs in in a callback")

        OpenLibraryKit().auth().login(user: "sean", secret: "test")

        waitForExpectations(timeout: 15) { error in
          if let error = error {
            XCTFail("waitForExpectationsWithTimeout errored: \(error)")
          }
        }
    }
}
