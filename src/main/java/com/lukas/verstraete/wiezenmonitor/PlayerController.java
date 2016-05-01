package com.lukas.verstraete.wiezenmonitor;

import com.lukas.verstraete.wiezendomain.domain.Player;
import com.lukas.verstraete.wiezendomain.service.ServiceFacade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/players")
@SessionAttributes("updatePlayer")
public class PlayerController {
    
    @Autowired
    public ServiceFacade services;
    
    @RequestMapping(method=RequestMethod.GET)
    public ModelAndView getAllPlayers()
    {
        return new ModelAndView("players", "players", services.getAllPlayers());
    }
    
    @RequestMapping(value="/new", method=RequestMethod.GET)
    public ModelAndView newPlayerRequest()
    {
        return new ModelAndView("createPlayer", "player", new Player());
    }
    
    @RequestMapping(value="/create", method=RequestMethod.POST)
    public String createPlayer(@ModelAttribute("player") Player player, BindingResult result)
    {
        services.addPlayer(player);
        if(result.hasErrors())
            return "createPlayer";
        return "redirect:/players.htm";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ModelAndView requestEdit(@PathVariable long id)
    {
        return new ModelAndView("playerEdit", "updatePlayer", services.getPlayer(id));
    }
    
    @RequestMapping(value="/update", method = RequestMethod.POST)
    public String updatePlayer(@ModelAttribute ("updatePlayer") Player player, BindingResult result)
    {
        if(result.hasErrors())
            return "playerEdit";
        
        services.updatePlayer(player);
        return "redirect:/players.htm";
    }
    
    @RequestMapping(value="/delete/{id}", method=RequestMethod.POST)
    public String delete(@PathVariable long id)
    {
        services.deletePlayer(services.getPlayer(id));
        return "redirect:/players.htm";
    }
}
