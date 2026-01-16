package com.joinmessage;

import org.bukkit.ChatColor;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.player.PlayerJoinEvent;
import org.bukkit.event.player.PlayerQuitEvent;
import org.bukkit.plugin.java.JavaPlugin;

public class JoinMessage extends JavaPlugin implements Listener {

    @Override
    public void onEnable() {
        saveDefaultConfig();
        getServer().getPluginManager().registerEvents(this, this);
        getLogger().info("JoinMessage enabled!");
    }

    @Override
    public void onDisable() {
        getLogger().info("JoinMessage disabled!");
    }

    @EventHandler
    public void onPlayerJoin(PlayerJoinEvent event) {
        Player player = event.getPlayer();
        String joinMsg = getConfig().getString("messages.join", "&a{player} joined the server!");
        joinMsg = joinMsg.replace("{player}", player.getName());
        joinMsg = ChatColor.translateAlternateColorCodes('&', joinMsg);
        event.setJoinMessage(joinMsg);
    }

    @EventHandler
    public void onPlayerQuit(PlayerQuitEvent event) {
        Player player = event.getPlayer();
        String quitMsg = getConfig().getString("messages.quit", "&c{player} left the server.");
        quitMsg = quitMsg.replace("{player}", player.getName());
        quitMsg = ChatColor.translateAlternateColorCodes('&', quitMsg);
        event.setQuitMessage(quitMsg);
    }
}
