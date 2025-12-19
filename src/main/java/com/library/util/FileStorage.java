package com.library.util;

import javax.servlet.ServletContext;
import java.io.*;
import java.util.*;

public class FileStorage {

    // Read all BOOK records
    public static List<Map<String, String>> getAllBooks(ServletContext context) {

        List<Map<String, String>> books = new ArrayList<>();

        try {
            String filePath = context.getRealPath("/WEB-INF/library-data.txt");
            BufferedReader br = new BufferedReader(new FileReader(filePath));

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
            br.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return books;
    }

    // Save new record
    public static synchronized void save(ServletContext context, String record) {

        try {
            String filePath = context.getRealPath("/WEB-INF/library-data.txt");
            FileWriter fw = new FileWriter(filePath, true);
            fw.write(record + "\n");
            fw.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
