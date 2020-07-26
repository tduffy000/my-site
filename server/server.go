package main

import (
	"github.com/gin-gonic/gin"
)

const (
	assetsPath = "/srv/site/public" // see ../Dockerfile
)

func main() {
	router := gin.Default()
	router.Static("/", assetsPath)
	router.Run(":8080")
}
