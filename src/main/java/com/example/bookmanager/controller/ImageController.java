package com.example.bookmanager.controller;

import com.example.bookmanager.model.Book;
import com.example.bookmanager.repository.BookRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
public class ImageController {

    private final BookRepository bookRepository;

    @GetMapping("/books/{id}/image")
    public ResponseEntity<byte[]> getImage(@PathVariable Long id) {

        Book book = bookRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Book not found"));

        if (book.getCoverImage() == null) {
            return ResponseEntity.notFound().build();
        }

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_TYPE, book.getCoverContentType())
                .body(book.getCoverImage());
    }
}