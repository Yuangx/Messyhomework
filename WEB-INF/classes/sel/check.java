
package sel;
public class check {
    public static int rand(int lo, int hi) {
    	return (int)(Math.random() * (hi - lo) + lo);
    }
    
    public static int num62() {
    	return rand(0, 62);
    }
    
    public static int randNum() {
    	int num62 = num62();
    	if (num62 < 10)
    		return num62 + (int)('0');
    	else
    		if (num62 < 10 + 26)
    			return num62 - 10 + (int)('A');
    		else
    			return num62 - (10 + 26) + (int)('a');
    }
    public static char toChar() {
    	return (char)randNum();
    }
    public static String checkNum() {
    	String str = "";
    	for (int i = 0; i < 4; i++) {
    		str = str + toChar();
    	}
    	return str;
    }
    
    public static void main(String[] args) {
        System.out.print(checkNum());
    }
}
