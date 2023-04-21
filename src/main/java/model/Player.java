package model;

public class Player {
    private String name;

    private int guess;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getGuess() {
        return guess;
    }

    public void setGuess(int guess) {
        this.guess = guess;
    }

    public int incrementGuesses() {
        return  guess++;

    }
}
