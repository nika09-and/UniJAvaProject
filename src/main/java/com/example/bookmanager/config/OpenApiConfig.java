package com.example.bookmanager.config;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;
import org.springframework.context.annotation.Configuration;

@Configuration
@OpenAPIDefinition(
        info = @Info(title = "Book Manager API", version = "v1", description = "REST API for managing books")
)
public class OpenApiConfig {
}
