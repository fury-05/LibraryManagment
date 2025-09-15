package com.example.library.controller;

import com.example.library.model.BorrowRecord;
import com.example.library.model.User;
import com.example.library.service.BookService;
import com.example.library.service.UserService; // <-- Import UserService
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private BookService bookService;

    @Autowired
    private UserService userService; // <-- Use UserService instead of UserDao

    @GetMapping("/dashboard")
    public String listBooks(Model model) {
        model.addAttribute("books", bookService.findAllBooks());
        return "user-dashboard";
    }

    @GetMapping("/my-borrows")
    public String myBorrows(Model model, Principal principal) {
        String email = principal.getName();
        // Use the transactional service method
        User currentUser = userService.findByEmail(email);

        List<BorrowRecord> records = bookService.findBorrowsByUserId(currentUser.getId());
        model.addAttribute("records", records);
        return "my-borrows";
    }

    @PostMapping("/borrow")
    public String borrowBook(@RequestParam("bookId") int bookId, RedirectAttributes redirectAttributes, Principal principal) {
        String email = principal.getName();
        User currentUser = userService.findByEmail(email);

        String result = bookService.borrowBook(bookId, currentUser.getId());
        redirectAttributes.addFlashAttribute("message", result);
        return "redirect:/user/dashboard";
    }
}