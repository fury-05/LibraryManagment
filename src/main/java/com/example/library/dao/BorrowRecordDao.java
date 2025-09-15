package com.example.library.dao;

import com.example.library.model.BorrowRecord;
import java.util.List;

public interface BorrowRecordDao {
    void save(BorrowRecord record);
    BorrowRecord findById(int id);
    List<BorrowRecord> findByUserId(int userId);
    void update(BorrowRecord record);
}