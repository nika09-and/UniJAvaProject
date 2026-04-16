package com.example.bookmanager.config;

import com.example.bookmanager.model.Category;
import com.example.bookmanager.repository.CategoryRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Slf4j
@Configuration
@RequiredArgsConstructor
public class DataInitializer {

    private final CategoryRepository categoryRepository;

    @Bean
    public CommandLineRunner initData() {
        return args -> {
            if (categoryRepository.count() == 0) {
                categoryRepository.save(new Category(null, "Technology"));
                categoryRepository.save(new Category(null, "Fiction"));
                categoryRepository.save(new Category(null, "History"));
                log.debug("Initialized default categories.");
            }
        };
    }
}
