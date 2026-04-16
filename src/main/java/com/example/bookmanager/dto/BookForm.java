package com.example.bookmanager.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class BookForm {

    @NotBlank(message = "Title is required")
    @Size(min = 3, max = 100, message = "Title must contain between 3 and 100 characters")
    private String title;

    @NotBlank(message = "Author is required")
    @Size(min = 3, max = 100, message = "Author must contain between 3 and 100 characters")
    private String author;

    @Size(max = 1000, message = "Description must not exceed 1000 characters")
    private String description;

    @NotNull(message = "Please choose a category")
    private Long categoryId;

    private MultipartFile coverImage;
}
