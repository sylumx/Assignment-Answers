public class Q3 {
    public static void main(String[] args) {
        int totalShortJumps = 21; // Number of 1 foot jumps from beginning to end of the river
        int longJump = 2; // maximum jump length (2 feets) from one stone to the next one
        int shortJump = 1; // minimum jump lenght (1 foot) from one stone to the next one
        System.out.print("Different ways the mouse can jump from beginning to end of the river = "
                + differentWays(totalShortJumps, longJump, shortJump) + " ways");
    }

    public static int differentWays(int totalShortJumps, int longJump, int shortJump) {
        int[] jump = new int[totalShortJumps];  
        jump[shortJump - 1] = 1;
        for (int i = shortJump; i < totalShortJumps; i++) {
            int counts = Math.max(shortJump - 1, i - longJump);
            for (int j = counts; j < i; j++) {
                jump[i] += jump[j];
            }
        }
        return jump[totalShortJumps - 1];
    }
}
