package main

import (
	"context"
	"fmt"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/service/ec2"
	"github.com/aws/aws-sdk-go-v2/service/ec2/types"
)

func main() {
	cfg, err := config.LoadDefaultConfig(context.TODO())
	if err != nil {
		panic("コンフィグエラー")
	}

	client := ec2.NewFromConfig(cfg)

	input := &ec2.RunInstancesInput{
		ImageId:      aws.String("ami-098940df4d3292e9a"),
		InstanceType: types.InstanceTypeT2Micro,
		MinCount:     aws.Int32(1),
		MaxCount:     aws.Int32(1),
	}

	result, err := client.RunInstances(context.TODO(), input)

	if err != nil {
		fmt.Println("インスタンスを作成できませんでした", err)
		return
	}

	fmt.Println("インスタンスを作成しました。", *result.Instances[0].InstanceId)
}
