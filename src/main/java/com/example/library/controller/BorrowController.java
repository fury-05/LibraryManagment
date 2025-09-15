package com.example.library.controller;

import com.example.library.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class BorrowController {

    @Autowired
    private BookService bookService;

    @PostMapping("/return")
    public String returnBook(@RequestParam("recordId") int recordId, RedirectAttributes redirectAttributes) {
        String result = bookService.returnBook(recordId);
        redirectAttributes.addFlashAttribute("message", result);
        return "redirect:/user/my-borrows";
    }
}