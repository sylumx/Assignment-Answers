/**
 * zeraki assignment question one
 */
public class Q1 {
    public static void main(String[] args) {
        int[] K = new int[] { 3, 5, 4, 1 };
        int N = K.length;
        int missing = missingInteger(K, N);
        System.out.println(missing);
    }
    
    // Function that returns missing interger
    public static int missingInteger(int K[], int N) {
        int i, total;
        total = (N + 1) * (N + 2) / 2;
        for (i = 0; i < N; i++)
            total -= K[i];
        return total;
    }
}