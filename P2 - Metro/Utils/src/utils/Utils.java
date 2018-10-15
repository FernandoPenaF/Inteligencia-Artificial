package utils;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class Utils {
    
    public static ArrayList<String> uniqueRoutes(String filename) throws FileNotFoundException, IOException{
        FileReader fr = new FileReader(filename);
        BufferedReader br = new BufferedReader(fr);
        
        ArrayList<String> routes = new ArrayList<>();
        String line;
        int i = 0;
        
        while ((line = br.readLine()) != null) {
            i++;
            if(!routes.contains(line))
                routes.add(line);
	}
        System.out.println("Líneas leidas: " + i);
        return routes;
    }
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws FileNotFoundException, IOException {
        ArrayList<String> s = Utils.uniqueRoutes("file.txt");
        System.out.println("Caminos únicos: " + s.size());
    }
    
}
