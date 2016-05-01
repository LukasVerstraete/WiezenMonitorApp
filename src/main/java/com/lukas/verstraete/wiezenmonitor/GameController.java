package com.lukas.verstraete.wiezenmonitor;

import com.lukas.verstraete.wiezendomain.service.GameService;
import com.lukas.verstraete.wiezendomain.service.ServiceFacade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/games")
public class GameController {
    
    @Autowired
    public ServiceFacade services;
    
    public GameController() {}
    
    @RequestMapping(method=RequestMethod.GET)
    public ModelAndView getAllGames()
    {
        return new ModelAndView("games", "games", services.getAllGames());
    }
    
    @RequestMapping(value="/{id}", method=RequestMethod.GET)
    public ModelAndView getGame(@PathVariable long id)
    {
        return new ModelAndView("game", "game", services.getGame(id));
    }
    
    @RequestMapping(value="/new", method=RequestMethod.GET)
    public String createGame()
    {
        services.createGame();
        return "redirect:/games.htm";
    }
}
