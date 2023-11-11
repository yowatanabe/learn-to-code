package main

import (
	"bufio"
	"fmt"
	"os"
	"regexp"

	"github.com/slack-go/slack"
)

func readLogFile(filename string) ([]string, error) {
	file, err := os.Open(filename)
	if err != nil {
		return nil, err
	}
	defer file.Close()

	var lines []string
	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		line := scanner.Text()
		lines = append(lines, line)
	}

	if err := scanner.Err(); err != nil {
		return nil, err
	}

	return lines, nil
}

func detectAndNotifyErrors(logs []string) {
	errorPattern := "ERROR"

	for _, log := range logs {
		if match, _ := regexp.MatchString(errorPattern, log); match {
			fmt.Println("Error Log:", log)
			notifyError(log)
		}
	}
}

func notifyError(log string) {
	// YOUR_SLACK_API_KEY に Bot User OAuth Token を設定
	api := slack.New("YOUR_SLACK_API_KEY")

	attachment := slack.NewTextBlockObject("mrkdwn", fmt.Sprintf("*エラーが発生しました*\n```\n%s\n```", log), false, false)

	section := slack.NewSectionBlock(attachment, nil, nil)

	message := slack.MsgOptionBlocks(section)

	// YOUR_SLACK_CHANNEL_ID にチャンネルIDを入力
	channelID, timestamp, errPost := api.PostMessage("YOUR_SLACK_CHANNEL_ID", message)
	if errPost != nil {
		fmt.Printf("Error posting to Slack: %s\n", errPost)
		return
	}

	fmt.Printf("Message successfully sent to channel %s at %s\n", channelID, timestamp)
}

func main() {
	filename := "logs/app.log"
	logs, err := readLogFile(filename)
	if err != nil {
		fmt.Println("Error reading log file:", err)
		return
	}

	detectAndNotifyErrors(logs)
}
