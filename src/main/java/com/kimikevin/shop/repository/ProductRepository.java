package com.kimikevin.shop.repository;

import com.kimikevin.shop.models.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Long> {
}
