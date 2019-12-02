package rutas

import (
	"net/http"

	"github.com/labstack/echo"
)

type (
	user struct {
		ID   int    `json:"id"`
		Name string `json:"name"`
	}
)

func createUser(c echo.Context) error {
	u := &user{
		ID: 1,
	}
	if err := c.Bind(u); err != nil {
		return err
	}
	// users[u.ID] = u
	// seq++

	return c.JSON(http.StatusCreated, u)
}
