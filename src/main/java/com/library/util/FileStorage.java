package com.library.util;

import java.io.FileWriter;
import java.io.IOException;

public class FileStorage {

    private static final String FILE_PATH = "data/library-data.txt";

    public static synchronized void save(String record) {
        try (FileWriter fw = new FileWriter(FILE_PATH, true)) {
            fw.write(record + "\n");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
