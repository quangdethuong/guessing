import model.Player;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@WebServlet(name = "GuessServlet", value = "/guessgame")
public class GuessServlet extends HttpServlet {
    private int num = 0;

    private static final int MIN_NUMBER = 1;
    private static final int MAX_NUMBER = 10;

    private static int answer;
    private static List<Player> players = new ArrayList<>();
    private static int currentPlayerIndex = 0;

    @Override
    public void init() throws ServletException {
        super.init();
        answer = (int) (Math.random() * (MAX_NUMBER - MIN_NUMBER + 1)) + MIN_NUMBER;
        players.clear();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("guessgame.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int guess = Integer.parseInt(request.getParameter("guess"));
        System.out.println(guess);
        System.out.println(answer);
        String name = request.getParameter("name");


        Player player = new Player();
        if (guess == answer) {
            String congra = "Chuc mung ban da doan trung";
            request.setAttribute("messsage", congra);
            Comparator<Player> comp = new Comparator<Player>() {
                @Override
                public int compare(Player o1, Player o2) {
                    if (o1.getGuess() == o2.getGuess())
                        return 0;
                    if (o1.getGuess() > o2.getGuess())
                        return 1;
                    else
                        return -1;
                }
            };
            Collections.sort(players, comp);

        } else {
//            num = player.incrementGuesses();
            String hint = (guess < answer) ? "Số vừa đoán nhỏ hơn đáp án!" : "Số vừa đoán lớn hơn đáp án!";
            request.setAttribute("hint", hint);

        }



        request.setAttribute("players", players);
        request.getRequestDispatcher("guessgame.jsp").forward(request, response);
    }


}
