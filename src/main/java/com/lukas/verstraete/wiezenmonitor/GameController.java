package com.lukas.verstraete.wiezenmonitor;

import com.lukas.verstraete.wiezendomain.domain.Game;
import com.lukas.verstraete.wiezendomain.domain.Player;
import com.lukas.verstraete.wiezendomain.domain.RoundFactory;
import com.lukas.verstraete.wiezendomain.service.GameService;
import com.lukas.verstraete.wiezendomain.service.ServiceFacade;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/games")
public class GameController {
    
    public class RoundObject
    {
        
        private long[] players;
        private long[] opponents;
        private RoundFactory.Type type;
        
        public long[] getPlayers() {
            return players;
        }

        public void setPlayers(long[] players) {
            this.players = players;
        }

        public long[] getOpponents() {
            return opponents;
        }

        public void setOpponents(long[] opponents) {
            this.opponents = opponents;
        }

        public RoundFactory.Type getType() {
            return type;
        }

        public void setType(RoundFactory.Type type) {
            this.type = type;
        }
    }
    
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
    
    @RequestMapping(value="/add/{id}", method=RequestMethod.POST)
    public String addPlayerToGame(@ModelAttribute("name") String playerName, @PathVariable long id)
    {
        Player player = new Player();
        player.setUsername(playerName);
        services.addPlayer(player);
        services.addPlayerToGame(id, player);
        return "redirect:/games/" + id + ".htm";
    }
    
    @RequestMapping(value="/newRound/{id}", method=RequestMethod.GET)
    public ModelAndView requestCreateRound(@PathVariable long id)
    {
        ModelAndView view = new ModelAndView("createRound");
        view.addObject("game", services.getGame(id));
        view.addObject("gameTypes", RoundFactory.Type.values());
        view.addObject("roundObject", createRoundObject(services.getGame(id)));
        return view;
    }
    
    @RequestMapping(value="/createRound", method=RequestMethod.POST)
    public String createRound(@ModelAttribute("game") Game game, @ModelAttribute("type") RoundFactory.Type type, @ModelAttribute("playersMap") Map<Player, Boolean> players, @ModelAttribute("opponentsMap") Map<Player, Boolean> opponents)
    {
        
        return "";
    }
    
    private RoundObject createRoundObject(Game game)
    {
        RoundObject object = new RoundObject();
        object.setPlayers(createBooleanList(game));
        object.setOpponents(createBooleanList(game));
        object.setType(RoundFactory.Type.SOLO_6);
        return object;
    }
    
    private long[] createBooleanList(Game game)
    {
        long[] list = new long[game.getPlayers().size()];
        int i = 0;
//        for(Player p : game.getPlayers())
//        {
//            list[i++] = p.getId();
//        }
        return list;
    }
}
