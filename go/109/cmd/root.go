package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

// ルートコマンドの作成
var rootCmd = &cobra.Command{
	Use:   "app",
	Short: "サンプルCLIアプリ",
	Long:  "これはGo Modulesを学習するためのCLIツールです。",
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("CLIアプリを実行しました！")
	},
}

// コマンドのエントリポイント
func Execute() {
	cobra.CheckErr(rootCmd.Execute())
}
