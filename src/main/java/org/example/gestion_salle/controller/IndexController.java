package org.example.gestion_salle.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class IndexController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirection interne vers index.jsp
        request.getRequestDispatcher("/index.jsp").forward(request, response);
        // OU (moins recommandé ici) :
        // response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
}