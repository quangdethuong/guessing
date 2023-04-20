import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Scanner;

public class GuessingGame {

    private static final int MIN_NUMBER = 1;
    private static final int MAX_NUMBER = 1000;

    private int answer;
    private List<Player> players;

    public GuessingGame() {
        answer = (int) (Math.random() * (MAX_NUMBER - MIN_NUMBER + 1)) + MIN_NUMBER;
        players = new ArrayList<>();
    }

    public void play() {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Guess the number between " + MIN_NUMBER + " and " + MAX_NUMBER + ".");
        boolean gameover = false;
        while (!gameover) {
            System.out.print("Your guess: ");
            int guess = scanner.nextInt();
            Player player = new Player(guess);
            players.add(player);
            if (guess < answer) {
                System.out.println("The number is higher.");
            } else if (guess > answer) {
                System.out.println("The number is lower.");
            } else {
                System.out.println("You got it! The number was " + answer + ".");
                gameover = true;
            }
        }
        Collections.sort(players);
        System.out.println("Top players:");
        for (int i = 0; i < players.size(); i++) {
            Player player = players.get(i);
            System.out.println((i + 1) + ". " + player.getName() + " - " + player.getGuesses() + " guesses");
        }
    }

    public static void main(String[] args) {
        GuessingGame game = new GuessingGame();
        game.play();
    }
}

class Player implements Comparable<Player> {

    private String name;
    private int guesses;

    public Player(int guess) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter your name: ");
        name = scanner.nextLine();
        guesses = 1;
    }

    public String getName() {
        return name;
    }

    public int getGuesses() {
        return guesses;
    }

    public void incrementGuesses() {
        guesses++;
    }

    public int compareTo(Player other) {
        return Integer.compare(guesses, other.guesses);
    }
}
