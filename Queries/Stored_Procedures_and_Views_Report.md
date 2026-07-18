# Stored Procedures

## Overview

Precompiled SQL statements stored in the database which are used to
execute a specific task when called with parameters are stored
procedures. They help to centralize database operations, promote code
reuse, and enhance performance by keeping business logic separate from
the database. In this project, stored procedures for searching,
reporting, updating XML data, and generating XML output were created and
used to show how to use parameters, joins, grouping, and custom
functions.

## Stored Procedures Implemented

### 1. `sp_SearchBooksByKeyword`

This procedure returns books by key word from the XML book description
and restricts the results to a certain language. It is joined to the
**Books**, **Languages**, **BookGenres** and **Publishers** tables and
the results are ordered by ascending book title.

### 2. `sp_PublisherBookCount`

This procedure produces a report which lists the number of books
published by publishers. It can be used to show a report of publishers
with a minimum number of books, which can be useful for management
purposes and the use of `COUNT()`, `GROUP BY`, and `HAVING`.

### 3. `sp_UpdateBookDescription`

This is an update of the XML description of a selected book using the
SQL Server XML `.modify()` method. It shows how to alter the contents of
XML data without changing the structure of the XML document.

### 4. `sp_BookAuthorXML`

The following procedure creates an XML document that includes book
information, authors, publisher information, and language. Contains a
custom user-defined function, `fn_FullAuthorName()`, to provide the full
name of the author and includes a demonstration of how to generate XML
with `FOR XML PATH`.

## User-Defined Function

### `fn_FullAuthorName`

A user-defined function was created to return an author's full name by
combining the first name and last name. The function is part of the
`sp_BookAuthorXML` stored procedure to facilitate code reusability and
to illustrate how to implement a custom SQL function.

------------------------------------------------------------------------

# Views

## Overview

Views are virtual tables that display data from one or more tables in a
database without actually storing the data in the database. They
streamline complicated queries, enhance security by offering just the
details required, and deliver tailored information for various sorts of
users. For this project, two views were developed for a simplified
access to the information of the library.

## Views Implemented

### 1. `vw_BookCatalogue`

This view is based on the **Books**, **Authors**, **Publishers**,
**Languages**, and **BookGenres** tables to give a full catalogue of
books. It also pulls out the Description from the XML field and serves
it up alongside the XML data, so that users can see both XML and
relational data in the same view. This perspective would be utilized
mostly by librarians and library assistants in looking up the details of
a book.

### 2. `vw_PublisherBookSummary`

This perspective gives an overview of the overall number of books
offered by each publisher. Managers and administrators in a library will
find it useful for reporting and statistical information, which can be
done with `GROUP BY` and `COUNT()`, as needed for decision making.
