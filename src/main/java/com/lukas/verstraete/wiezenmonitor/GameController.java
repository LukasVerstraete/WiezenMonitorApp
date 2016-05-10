package com.lukas.verstraete.wiezenmonitor;

import com.lukas.verstraete.wiezendomain.domain.Game;
import com.lukas.verstraete.wiezendomain.domain.Player;
import com.lukas.verstraete.wiezendomain.domain.Round;
import com.lukas.verstraete.wiezendomain.domain.RoundFactory;
import com.lukas.verstraete.wiezendomain.service.ServiceFacade;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/games")
@SessionAttributes("roundObject")
public class GameController {
    
    public class RoundObject implements Serializable
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
    
    @RequestMapping(value="/endGame/{id}", method=RequestMethod.GET)
    public String endGame(@PathVariable long id)
    {
         services.endGame(id);
         return "redirect:/games/" + id + ".htm";
    }
    
    @RequestMapping(value="/delete/{id}", method=RequestMethod.POST)
    public String deleteGame(@PathVariable long id)
    {
        services.deleteGame(services.getGame(id));
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
    
    @RequestMapping(value="/createRound/{id}", method=RequestMethod.POST)
    public ModelAndView createRound(@PathVariable long id, @ModelAttribute("roundObject") RoundObject object)
    {
        List<Player> players = new ArrayList<>();
        List<Player> opponents = new ArrayList<>();
        for(long l : object.getPlayers())
        {
            players.add(services.getPlayer(l));
        }
        for(long l : object.getOpponents())
        {
            opponents.add(services.getPlayer(l));
        }
        RoundFactory factory = new RoundFactory();
        Round round = factory.createRound(object.getType(), services.getGame(id).getPlayers(), players, opponents);
        services.startRound(id, round);
        return new ModelAndView("game", "game", services.getGame(id));
    }
    
    @RequestMapping(value="/endRound/{id}", method=RequestMethod.POST)
    public ModelAndView endRound(@PathVariable long id, @ModelAttribute("wins") int wins) {
        services.endRound(id, wins);
        return new ModelAndView("game", "game", services.getGame(id));
    }
    
    @RequestMapping(value="delete/{gameId}/{roundId}", method=RequestMethod.POST)
    public String deleteRound(@PathVariable long gameId, @PathVariable long roundId)
    {
        services.deleteRound(gameId, roundId);
        return "redirect:/games/" + gameId + ".htm";
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
        return new long[game.getPlayers().size()];
    }
}
