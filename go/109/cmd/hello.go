package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

// "hello" コマンドの作成
var helloCmd = &cobra.Command{
	Use:   "hello",
	Short: "挨拶を表示する",
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("こんにちは！Go Modules の学習中です。")
	},
}

func init() {
	rootCmd.AddCommand(helloCmd)
}
