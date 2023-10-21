package main

import "fmt"

type Player struct {
	Name     string
	Position string
}

func countPlayers(players []Player) int {
	if len(players) == 0 {
		return 0
	}
	return 1 + countPlayers(players[1:])
}

func main() {
	// 選手の情報
	players := []Player{
		{Name: "Player1", Position: "Forward"},
		{Name: "Player2", Position: "Midfielder"},
		{Name: "Player3", Position: "Defender"},
		{Name: "Player4", Position: "GoalKeeper"},
	}

	// 選手の評価
	playerStats := make(map[string]int)
	playerStats["Player1"] = 6
	playerStats["Player2"] = 8
	playerStats["Player3"] = 7
	playerStats["Player4"] = 10

	for _, player := range players {
		fmt.Printf("%s plays as a %s\n", player.Name, player.Position)
		if playerStats[player.Name] > 7 {
			fmt.Printf("%s is Star player!\n", player.Name)
		} else {
			fmt.Printf("%s is Average player.\n", player.Name)
		}
	}

	fmt.Printf("Total number of players: %d\n", countPlayers(players))
}
