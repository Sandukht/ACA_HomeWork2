-- create library database
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_database WHERE datname = 'library') THEN
        CREATE DATABASE library;
    END IF;
END $$;

--------------------------------------------------------------------------------------------------------------------------------------------------------


-- table Authors
CREATE TABLE IF NOT EXISTS Authors (
    id  serial PRIMARY KEY not null,
    first_name char(50) not null,
    last_name char(50) not null
);

-- table Books
CREATE TABLE IF NOT EXISTS Books (
    id  serial PRIMARY KEY not null,
    title char(100) not null,
    year_first_published integer
);

-- table BookAuthors
CREATE TABLE IF NOT EXISTS BookAuthors (
    author_id integer unique ,
    foreign key (author_id) REFERENCES Authors(id),
    book_id integer unique,
    FOREIGN KEY  (book_id) REFERENCES Books(id)

);
------------------------------------------------------------------------------^ OK-----------------------------------------------------------------------
------------------------------------------------------------------------------| -------------------------------------------------------------------------

--Students
CREATE TABLE IF NOT EXISTS Students (
    id  serial PRIMARY KEY ,
    first_name varchar(255) not null,
    last_name varchar(255) not null
);

--BookCopies
CREATE TABLE IF NOT EXISTS BookCopies (
    id  serial PRIMARY KEY not null,
    book_id integer ,
    FOREIGN KEY  (book_id) REFERENCES Books(id),
    ISBN varchar(255) not null,
    year_published date not null
);

-- table BookAuthors
CREATE TABLE IF NOT EXISTS Borrow (
    id  serial PRIMARY KEY not null,
    book_copy_id integer unique ,
    FOREIGN KEY  (book_copy_id) REFERENCES BookCopies(id),
    student_id integer unique not null ,
    FOREIGN KEY  (student_id) REFERENCES Students(id),
    borrow_date date NOT NULL ,
    return_date date not null

);

------------------------------------------------------------------------------^ OK-----------------------------------------------------------------------
------------------------------------------------------------------------------| -------------------------------------------------------------------------
