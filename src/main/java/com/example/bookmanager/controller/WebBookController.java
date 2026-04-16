package com.example.bookmanager.controller;

import com.example.bookmanager.dto.BookForm;
import com.example.bookmanager.model.Book;
import com.example.bookmanager.model.Category;
import com.example.bookmanager.service.BookService;
import com.example.bookmanager.service.CategoryService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import java.io.IOException;

@Slf4j
@Controller
@RequestMapping("/books")
@RequiredArgsConstructor
public class WebBookController {

    private final BookService bookService;
    private final CategoryService categoryService;

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("bookForm", new BookForm());
        model.addAttribute("categories", categoryService.findAll());
        return "book-form";
    }

    @PostMapping("/add")
    public String saveBook(@Valid @ModelAttribute("bookForm") BookForm bookForm,
                           BindingResult bindingResult,
                           Model model) throws IOException {

        if (bindingResult.hasErrors()) {
            model.addAttribute("categories", categoryService.findAll());
            return "book-form";
        }

        Category category = categoryService.findById(bookForm.getCategoryId())
                .orElseThrow(() -> new IllegalArgumentException("Invalid category"));

        Book book = Book.builder()
                .title(bookForm.getTitle())
                .author(bookForm.getAuthor())
                .description(bookForm.getDescription())
                .category(category)
                .build();

        MultipartFile coverImage = bookForm.getCoverImage();
        if (coverImage != null && !coverImage.isEmpty()) {
            book.setCoverImage(coverImage.getBytes());
        }

        bookService.save(book);

        return "redirect:/books/add?success";
    }

    @GetMapping
    public String listBooks(Model model) {
        model.addAttribute("books", bookService.findAll());
        return "book-list";
    }
}