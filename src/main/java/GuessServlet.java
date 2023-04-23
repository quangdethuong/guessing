import model.Player;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Random;

@WebServlet(name = "guessServlet", urlPatterns = {"/guessgame"})
public class GuessServlet extends HttpServlet {
    ArrayList<Player> PlayerList = new ArrayList<>();
    Random random = new Random();
    int randomnumber = random.nextInt(1000) + 1;
    int count = 1;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("guessgame.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        String name = req.getParameter("name");
        System.out.println("name: " + name);
        String strNumber = req.getParameter("number");
        String message = null;
        boolean isfinish = false;

        System.out.println("randomnumber: " + randomnumber);
        System.out.println("isfinish: " + isfinish);

        System.out.println("count: " + count);
        int number = 0;
        if (!strNumber.isEmpty()) {
            number = Integer.parseInt(strNumber);
            if (number > 1000) {
                message = "Vui lòng nhập số từ 1 đến 1000";
                req.setAttribute("message", message);
                req.getRequestDispatcher("welcome.jsp").forward(req, resp);
                return;
            };
        }
        if (number == randomnumber) {
            message = "Xin chúc mừng bạn đã đoán trúng";
            Player player = new Player();
            player.setName(name);
            player.setAnswer(number);
            player.setCount(count);
            player.setGuess(randomnumber);
            PlayerList.add(player);
            sort(PlayerList);
            isfinish = true;
            randomnumber = random.nextInt(1000) + 1;
            count = 1;
            name = null;
        } else if (number > randomnumber) {
            message = "Số bạn đoán lớn hơn số hệ thống";
            count++;
            req.setAttribute("name", name);
        } else {
            message = "Số bạn đoán nhỏ hơn số hệ thống";
            count++;
            System.out.println("name: " + name);
            req.setAttribute("name", name);
        }
        req.setAttribute("message", message);
        req.setAttribute("PlayerList", PlayerList);
        req.getRequestDispatcher("guessgame.jsp").forward(req, resp);
    }

    public void sort(ArrayList<Player> usersList) {
        Collections.sort(usersList, new Comparator<Player>() {
            @Override
            public int compare(Player u1, Player u2) {
                return u1.getGuess() - u2.getGuess();
            }
        });
    }
}
