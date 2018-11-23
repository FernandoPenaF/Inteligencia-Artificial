package utils;

import java.util.Objects;

public class Path {
    private double len;
    private String path;

    public Path(double len, String path) {
        this.len = len;
        this.path = path;
    }

    public double getLen() {
        return len;
    }

    public void setLen(double len) {
        this.len = len;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 59 * hash + (int) (Double.doubleToLongBits(this.len) ^ (Double.doubleToLongBits(this.len) >>> 32));
        hash = 59 * hash + Objects.hashCode(this.path);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Path other = (Path) obj;
        if (Double.doubleToLongBits(this.len) != Double.doubleToLongBits(other.len)) {
            return false;
        }
        if (!Objects.equals(this.path, other.path)) {
            return false;
        }
        return true;
    }
    
    public int compareTo(Path p2){
        if(this.len < p2.getLen())
            return -1;
        else if(this.len > p2.getLen())
            return 1;
        else
            return 0;
    }
    
    @Override
    public String toString() {
        return "Len = " + len + "\npath = " + path;
    }
}