package com.example.bookmanager.service;

import com.example.bookmanager.model.Book;
import com.example.bookmanager.repository.BookRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class BookService {

    private final BookRepository bookRepository;

    // Create / Update
    public Book save(Book book) {
        return bookRepository.save(book);
    }

    // Get all books
    public List<Book> findAll() {
        return bookRepository.findAll();
    }

    // Get book by id (FIX for your error)
    public Optional<Book> findById(Long id) {
        return bookRepository.findById(id);
    }

    // Delete book by id (FIX for your error)
    public void deleteById(Long id) {
        bookRepository.deleteById(id);
    }
}