package com.example.library.controller;

import com.example.library.model.Book;
import com.example.library.model.User; // <-- THIS LINE WAS MISSING
import com.example.library.service.BookService;
import com.example.library.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UserService userService;

    @Autowired
    private BookService bookService;

    @GetMapping("/dashboard")
    public String showDashboard(Model model) {
        model.addAttribute("pendingUsers", userService.getPendingUsers().size());
        model.addAttribute("totalBooks", bookService.findAllBooks().size());
        return "admin-dashboard";
    }

    @GetMapping("/users")
    public String manageUsers(Model model) {
        model.addAttribute("approvedUsers", userService.getAllUsers().stream().filter(User::isApproved).toList());
        model.addAttribute("pendingUsers", userService.getPendingUsers());
        return "admin-users";
    }

    @PostMapping("/users/approve/{id}")
    public String approveUser(@PathVariable("id") int id, RedirectAttributes redirectAttributes) {
        userService.approveUser(id);
        redirectAttributes.addFlashAttribute("message", "User approved successfully!");
        return "redirect:/admin/users";
    }

    @GetMapping("/books")
    public String manageBooks(Model model) {
        model.addAttribute("book", new Book());
        model.addAttribute("books", bookService.findAllBooks());
        return "admin-books";
    }

    @PostMapping("/books/add")
    public String addBook(@ModelAttribute("book") Book book, RedirectAttributes redirectAttributes) {
        bookService.addBook(book);
        redirectAttributes.addFlashAttribute("message", "Book added successfully!");
        return "redirect:/admin/books";
    }

    @PostMapping("/books/delete/{id}")
    public String deleteBook(@PathVariable("id") int id, RedirectAttributes redirectAttributes) {
        bookService.deleteBook(id);
        redirectAttributes.addFlashAttribute("message", "Book deleted successfully!");
        return "redirect:/admin/books";
    }

    // API Endpoint for Chart Data
    @GetMapping("/api/stats/book-categories")
    @ResponseBody
    public Map<String, Long> getBookCategoryStats() {
        return bookService.getBookStatsByCategory();
    }
}