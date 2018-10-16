package utils;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

public class Utils {
    
    public static ArrayList<Path> readUniqueRoutes(String filename) throws FileNotFoundException, IOException{
        FileReader fr = new FileReader(filename);
        BufferedReader br = new BufferedReader(fr);
        
        ArrayList<Path> routes = new ArrayList<>();
        String line;
        String[] ans;
        Path p;
        int i = 0;
        
        while ((line = br.readLine()) != null) {
            i++;
            ans = line.split(" ");
            p = new Path(Integer.valueOf(ans[1]),ans[0]);
            if(!routes.contains(p))
                routes.add(p);
	}
        System.out.println("Líneas leidas: " + i);
        return routes;
    }
    
    public static ArrayList<Path> sortList(ArrayList<Path> paths){
        Collections.sort(paths, (Path p1, Path p2) -> p1.getLen() - p2.getLen());
        return paths;
    }
    
    /**
     * @param args the command line arguments
     * @throws java.io.FileNotFoundException
     */
    public static void main(String[] args) throws FileNotFoundException, IOException {
        ArrayList<Path> s = Utils.readUniqueRoutes("file.txt");
        ArrayList<Path> sort = Utils.sortList(s);
        System.out.println("Caminos únicos: " + s.size());
        System.out.println("Camino más corto: " + sort.get(0).toString());
        System.out.println("Camino más largo: " + sort.get(sort.size() - 1).toString());
    }   
}