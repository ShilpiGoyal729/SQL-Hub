CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author_id INT,
    publication_year INT,
    isbn VARCHAR(20),
    available BOOLEAN
);

INSERT INTO Books (book_id, title, author_id, publication_year, isbn, available)
VALUES
    (1, 'The Great Gatsby', 1, 1925, '9780743273565', true),
    (2, 'To Kill a Mockingbird', 2, 1960, '9780061120084', true),
    (3, '1984', 3, 1949, '9780451524935', true),
    (4, 'Pride and Prejudice', 4, 1813, '9780141439518', true),
    (5, 'The Catcher in the Rye', 5, 1951, '9780316769488', true);
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100)
);

INSERT INTO Authors (author_id, author_name)
VALUES
    (1, 'F. Scott Fitzgerald'),
    (2, 'Harper Lee'),
    (3, 'George Orwell'),
    (4, 'Jane Austen'),
    (5, 'J.D. Salinger');
CREATE TABLE Borrowers (
    borrower_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

INSERT INTO Borrowers (borrower_id, name, email)
VALUES
    (1, 'Alice Johnson', 'alice@example.com'),
    (2, 'Bob Smith', 'bob@example.com'),
    (3, 'Charlie Brown', 'charlie@example.com');
CREATE TABLE Borrowings (
    borrowing_id INT PRIMARY KEY,
    book_id INT,
    borrower_id INT,
    borrowed_date DATE,
    returned_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (borrower_id) REFERENCES Borrowers(borrower_id)
);

INSERT INTO Borrowings (borrowing_id, book_id, borrower_id, borrowed_date, returned_date)
VALUES
    (1, 1, 1, '2023-05-01', '2023-05-15'),
    (2, 2, 2, '2023-06-10', '2023-06-25'),
    (3, 3, 3, '2023-07-05', NULL);
SELECT b.title AS book_title, a.author_name, bo.name AS borrower_name, bo.email AS borrower_email
FROM Books b
JOIN Authors a ON b.author_id = a.author_id
JOIN Borrowings br ON b.book_id = br.book_id
JOIN Borrowers bo ON br.borrower_id = bo.borrower_id
WHERE br.returned_date IS NULL;