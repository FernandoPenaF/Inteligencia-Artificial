package utils;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;

public class Utils {

    /*
    Se representan las conexiones como:
        conexion(pino_suarez,merced, 0.79).%rosa
        conexion(merced, candelaria,0.70).%rosa
        conexion(candelaria, san_lazaro,0.59).%rosa
    */
    public static void readStations(String filename) throws FileNotFoundException, IOException{
        FileReader fr = new FileReader(filename);
        BufferedReader br = new BufferedReader(fr);
        
        ArrayList<ArrayList<String>> stations = new ArrayList<>();
        HashSet <String> s = new HashSet<>();
        String line, primera, segunda;
        String[] ans;
        int linea = -1;
        
        while ((line = br.readLine()) != null) {
            if(line.startsWith("%")){
                linea++;
                stations.add(new ArrayList<>());
                continue;
            }
            line = line.substring(9, line.length());
            ans = line.split(",");
            primera = ans[0].trim();
            segunda = ans[1].trim();
            
            if(!s.contains(primera)){
                s.add(primera);
                stations.get(linea).add(primera);
            }
            if(!s.contains(segunda)){
                s.add(segunda);
                stations.get(linea).add(segunda);
            }
	}
        
        for (int i = 0; i < stations.size(); i++) {
            ArrayList<String> ar = stations.get(i);
            System.out.println("%Línea " + (i + 1));
            for (int j = 0; j < ar.size(); j++) {
                System.out.println("estacion(" + ar.get(j) + ", 1, 1).");
            }
            System.out.println("");
        }
    }
    
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
            p = new Path(Double.valueOf(ans[1]),ans[0]);
            if(!routes.contains(p))
                routes.add(p);
	}
        System.out.println("Líneas leidas: " + i);
        return routes;
    }
    
    public static ArrayList<Path> sortList(ArrayList<Path> paths){
        Collections.sort(paths, (Path p1, Path p2) -> {
            return p1.compareTo(p2);
        });
        return paths;
    }
    
    public static void eliminarEstaciones(String filename) throws FileNotFoundException, IOException{
        FileReader fr = new FileReader(filename);
        BufferedReader br = new BufferedReader(fr);
        
        ArrayList<ArrayList<String>> stations = new ArrayList<>();
        HashSet <String> s = new HashSet<>();
        String line;
        int linea = -1;
        
        while ((line = br.readLine()) != null) {
            if(line.startsWith("%")){
                linea++;
                stations.add(new ArrayList<>());
                continue;
            }
            
            if(!s.contains(line)){
                s.add(line);
                stations.get(linea).add(line);
            }
	}
        
        for (int i = 0; i < stations.size(); i++) {
            ArrayList<String> ar = stations.get(i);
            System.out.println("%Línea " + (i + 1));
            for (int j = 0; j < ar.size(); j++) {
                System.out.println(ar.get(j));
            }
            System.out.println("");
        }
    }
    
    
    /**
     * @param args the command line arguments
     * @throws java.io.FileNotFoundException
     */
    public static void main(String[] args) throws FileNotFoundException, IOException {
        ArrayList<Path> s = Utils.readUniqueRoutes("file.txt");
        ArrayList<Path> sort = Utils.sortList(s);
        System.out.println("Caminos únicos: " + s.size() + "\n");
        System.out.println("Camino más corto:\n" + sort.get(0).toString() + "\n");
        System.out.println("Camino más largo:\n" + sort.get(sort.size() - 1).toString() + "\n");
//        Utils.readStations("conexiones.txt");
    }   
}