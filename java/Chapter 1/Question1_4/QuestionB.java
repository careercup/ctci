package Question1_4;

public class QuestionB {
    public static void main(String[] args) {
        char[] text = "abc d e f      ".toCharArray();

        replaceSpaces(text);

        System.out.println(text);
    }

    static void replaceSpaces(char[] letters) {
        int dest = letters.length - 1;
        boolean inBuffer = true;

        for (int src = letters.length - 1; src >= 0; src--) {
            if (inBuffer) {
                if (letters[src] == ' ') {
                    continue;
                }
                inBuffer = false;
            }

            if (letters[src] != ' ') {
                letters[dest] = letters[src];
                letters[src] = ' ';
                dest--;
            } else {
                letters[dest--] = '0';
                letters[dest--] = '2';
                letters[dest--] = '%';
                if (src == dest + 1) {
                    break;
                }
            }
        }
    }
}
