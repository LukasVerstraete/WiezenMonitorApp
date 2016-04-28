package com.lukas.verstraete.wiezenmonitor;

import com.lukas.verstraete.wiezendomain.service.GameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;

@Controller
@RequestMapping(value="/games")
public class GameController {
    
    @Autowired
    public GameService gameService;
    
    public GameController() {}
    
    @RequestMapping(method=RequestMethod.GET)
    public ModelAndView getGames()
    {
        return new ModelAndView("games", "games", gameService.getAllGames());
    }
}
