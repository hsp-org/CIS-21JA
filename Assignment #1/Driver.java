/**
 * @author Hari Prakash
 * Assignment 1, Part 2
 * CIS 21JA
 */

public class Driver {
	
	// converting string to 16-bit binary int
	public int problem1(String binString) {
        int output = 0;
        int power = 1; 
        for (int i = binString.length() - 1; i >= 0; i--) { 
            char bits = binString.charAt(i);
            if (bits != '0' && bits != '1') {
                throw new IllegalArgumentException("Invalid binary string: " + binString);
            }
            if (bits == '1') {
            	output += power; 
            }
            power *= 2; 
        }
        return output;
    }
	
	// converting string to 32-bit hexdecmial int
	public long problem2(String hexString) {
        long output = 0;
        long power = 1; 
        for (int i = hexString.length() - 1; i >= 0; i--) { 
            char digits = hexString.charAt(i);
            long digitValue;
            
            if(digits >= '0' && digits <= '9') {
                digitValue = digits - '0';
            }else if (digits >= 'a' && digits <= 'f') {
                digitValue = digits - 'a' + 10;
            }else if (digits >= 'A' && digits <= 'F') {
                digitValue = digits - 'A' + 10;
            }else {
                throw new IllegalArgumentException("not in hexdecimal format: " + hexString);
            }
            output += digitValue * power;
            power *= 16; 
        }
        return output;
    }
	
	public static void main(String args[]) {
		Driver driver = new Driver();
	
		
		// test-case for problem #1
        System.out.print(driver.problem1("0000000000000000") + "\n"); // 0
        System.out.print(driver.problem1("1011010111100101") + "\n"); // 46565
        System.out.print(driver.problem1("1111111111111111") + "\n"); // 65535
        
        // test-case for problem #2
        System.out.print(driver.problem2("A") + "\n"); // 10
        System.out.print(driver.problem2("DEAF") + "\n"); // 57007
        System.out.print(driver.problem2("FFFFFFFF") + "\n"); // 4294967295
	}
	
}
