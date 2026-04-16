package com.example.bookmanager.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

@Data
@ConfigurationProperties(prefix = "app")
public class AppProperties {
    private String displayName = "Book Manager";
    private int itemsPerPage = 10;
}
