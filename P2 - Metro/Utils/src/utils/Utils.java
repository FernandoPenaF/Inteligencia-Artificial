package utils;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

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
    
    public static Path minimunLen(ArrayList<Path> paths){
        int act, min = paths.get(0).getLen();
        Path resp = null;
        
        for (Path p : paths) {
            act = p.getLen();
            if(act < min){
                min = act;
                resp = p;
            }
        }
        return resp;
    }
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws FileNotFoundException, IOException {
        ArrayList<Path> s = Utils.readUniqueRoutes("file.txt");
        Path p = Utils.minimunLen(s);
        System.out.println("Caminos únicos: " + s.size());
        System.out.println("Camino más corto: " + p.toString());
    }   
}