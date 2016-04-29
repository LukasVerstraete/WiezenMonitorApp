package com.lukas.verstraete.wiezenmonitor;

import com.lukas.verstraete.wiezendomain.service.GameService;
import com.lukas.verstraete.wiezendomain.service.ServiceFacade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;

@Controller
@RequestMapping(value="/games")
public class GameController {
    
    @Autowired
    public ServiceFacade services;
    
    public GameController() {}
    
    @RequestMapping(method=RequestMethod.GET)
    public ModelAndView getGames()
    {
        return new ModelAndView("games", "games", services.getAllGames());
    }
    
    @RequestMapping(value="/new", method=RequestMethod.GET)
    public ModelAndView createGame()
    {
        long id = services.createGame();
        return new ModelAndView("game", "game", services.getGame(id));
    }
}
