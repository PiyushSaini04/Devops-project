package com.library.util;

import javax.servlet.ServletContext;
import java.io.*;
import java.util.*;

public class FileStorage {

    private static String getFilePath(ServletContext context) {
        return context.getRealPath("/WEB-INF/library-data.txt");
    }

    // READ ALL BOOKS
    public static List<Map<String, String>> getAllBooks(ServletContext context) {
        List<Map<String, String>> books = new ArrayList<>();

        try (BufferedReader br = new BufferedReader(
                new FileReader(getFilePath(context)))) {

            String line;
            while ((line = br.readLine()) != null) {

                if (line.startsWith("BOOK")) {
                    Map<String, String> book = new HashMap<>();
                    String[] parts = line.split("\\|");

                    for (String part : parts) {
                        if (part.contains("=")) {
                            String[] kv = part.trim().split("=");
                            book.put(kv[0].trim(), kv[1].trim());
                        }
                    }
                    books.add(book);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return books;
    }

    // UPDATE BOOK STATUS (CORE FIX)
    public static synchronized void updateBookStatus(
            ServletContext context,
            String bookId,
            String newStatus) {

        File file = new File(getFilePath(context));
        List<String> updatedLines = new ArrayList<>();

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {

            String line;
            while ((line = br.readLine()) != null) {

                if (line.startsWith("BOOK") && line.contains("id=" + bookId)) {
                    // Update only the status field
                    line = line.replaceAll(
                            "status=AVAILABLE|status=ISSUED",
                            "status=" + newStatus
                    );
                }
                updatedLines.add(line);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Rewrite file
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(file))) {
            for (String l : updatedLines) {
                bw.write(l);
                bw.newLine();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // SAVE RECORD (ISSUE / RETURN)
    public static synchronized void save(
            ServletContext context,
            String record) {

        try (BufferedWriter bw = new BufferedWriter(
                new FileWriter(getFilePath(context), true))) {

            bw.write(record);
            bw.newLine();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
