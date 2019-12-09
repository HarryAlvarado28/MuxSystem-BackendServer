package main

import (
	"database/sql"
	"fmt"
	"io/ioutil"
	"net/http"
	"strconv"
	"time"

	"github.com/labstack/echo"
	"github.com/labstack/echo/middleware"
	_ "gopkg.in/goracle.v2"
)

//e.GET("/show", show)
func show(c echo.Context) error {
	// Get team and member from the query string
	team := c.QueryParam("team")
	member := c.QueryParam("member")
	return c.String(http.StatusOK, "team:"+team+", member:"+member)
}

// --- USER ROUTES -------------------------------

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
	println("Este es el usuario Name: ", u.Name)
	return c.JSON(http.StatusCreated, u)
}

type (
	rol struct {
		ID                 int       `json:"id"`
		Nombre             string    `json:"nombre"`
		Descripcion        string    `json:"descripcion"`
		Activo             string    `json:"activo"`
		IDBitacora         int       `json:"idBitacora"`
		FechaInsertada     time.Time `json:"fechaInsertada"`
		IDUsuarioInsercion int       `json:"idUsuarioInsercion"`
		FechaUltMod        time.Time `json:"fechaUltMod"`
		IDUsuarioUltMod    int       `json:"idUsuarioUltMod"`
	}
)

type (
	Mensaje struct {
		ID      int    `json:"id"`
		Mensaje string `json:"nombre"`
		Error   error  `json:"error"`
	}
)

func rolAll(c echo.Context) error {
	m := &Mensaje{
		ID:      02,
		Mensaje: "Elemento no encontrado",
	}
	r := &rol{}
	if err := c.Bind(r); err != nil {
		return err
	}
	rAll := make([]rol, 0)

	db, err := sql.Open("goracle", "HARRY/123456@localhost/xe")
	wid, _ := strconv.Atoi(c.Param("id"))
	if wid != 0 {
		row := db.QueryRow("SELECT ID, NOMBRE, DESCRIPCION,	ACTIVO,	ID_BITACORA, FECHA_INSERCION, ID_USUARIO_INSERCION, FECHA_ULT_MOD, ID_USUARIO_ULT_MOD FROM vrol WHERE id = :1", wid)
		err = row.Scan(&r.ID, &r.Nombre, &r.Descripcion, &r.Activo, &r.IDBitacora, &r.FechaInsertada, &r.IDUsuarioInsercion, &r.FechaUltMod, &r.IDUsuarioUltMod)
		println("El nombre: ", r)
		if err != nil {
			// panic(err)
			m.Error = err
			return c.JSON(http.StatusNotFound, m)
		}
		return c.JSON(http.StatusOK, r)
	} else {
		rows, err := db.Query("SELECT ID, NOMBRE, DESCRIPCION,	ACTIVO,	ID_BITACORA, FECHA_INSERCION, ID_USUARIO_INSERCION, FECHA_ULT_MOD, ID_USUARIO_ULT_MOD FROM vrol")

		if err != nil {
			panic(err)
		}
		defer rows.Close()

		for rows.Next() {
			err := rows.Scan(&r.ID, &r.Nombre, &r.Descripcion, &r.Activo, &r.IDBitacora, &r.FechaInsertada, &r.IDUsuarioInsercion, &r.FechaUltMod, &r.IDUsuarioUltMod)
			if err != nil {
				panic(err)
			}
			is := rol{r.ID, r.Nombre, r.Descripcion, r.Activo, r.IDBitacora, r.FechaInsertada, r.IDUsuarioInsercion, r.FechaUltMod, r.IDUsuarioUltMod}
			rAll = append(rAll, is)
			fmt.Printf("\nIndex: %d - Nombre: %s ", r.ID, r.Nombre)
		}
		err = rows.Err()
		if err != nil {
			panic(err)
		}
		return c.JSON(http.StatusOK, rAll)
	}

	return c.JSON(http.StatusOK, wid)
}

func rolCreate(c echo.Context) error {
	r := &rol{
		ID: 1,
	}
	if err := c.Bind(r); err != nil {
		return err
	}

	db, err := sql.Open("goracle", "HARRY/123456@localhost/xe")
	var tid int
	// _, err = db.Exec("INSERT INTO roles (nombre, descripcion, activo, fecha_insertada, id_usuario_insercion, fecha_ulti_mod) VALUES (:Nombre, sysdate) returning id INTO :Tid",
	_, err = db.Exec(
		"INSERT INTO roles ("+
			"nombre, descripcion, activo, fecha_insertada, id_usuario_insercion "+
			" ) VALUES ( "+
			":Nombre, :Descripcion, :Activo, sysdate, :IDUsuarioInsercion "+
			") returning id INTO :Tid",
		sql.Named("Nombre", r.Nombre),
		sql.Named("Descripcion", r.Descripcion),
		sql.Named("Activo", r.Activo),
		sql.Named("IDUsuarioInsercion", r.IDUsuarioInsercion),
		sql.Named("Tid", sql.Out{Dest: &tid}))
	r.ID = tid
	if err != nil {
		panic(err)
	}
	fmt.Printf("\nID del valor insertado %v\n", tid)

	println("Nombre del ROL: ", r.Nombre)
	return c.JSON(http.StatusCreated, r)
}

func rolUpdate(c echo.Context) error {
	r := &rol{
		ID: 1,
	}
	if err := c.Bind(r); err != nil {
		return err
	}
	wid, _ := strconv.Atoi(c.Param("id"))
	println("Este es el wid: ", wid)
	db, err := sql.Open("goracle", "HARRY/123456@localhost/xe")
	// var tid int
	_, err = db.Exec(
		"UPDATE roles SET "+
			"nombre = :Nombre, "+
			"descripcion = :Descripcion, "+
			"activo = :Activo "+
			"FECHA_ULT_MOD = sysdate "+
			"WHERE id = :wid",
		sql.Named("Nombre", r.Nombre),
		sql.Named("Descripcion", r.Descripcion),
		sql.Named("Activo", r.Activo),
		sql.Named("Wid", wid))
	// var name string
	row := db.QueryRow("SELECT ID, NOMBRE, DESCRIPCION,	ACTIVO,	FECHA_INSERTADA, ID_USUARIO_INSERCION, FECHA_ULT_MOD, ID_USUARIO_ULT_MOD FROM roles WHERE id = :1", wid)
	err = row.Scan(&r.ID, &r.Nombre, &r.Descripcion, &r.Activo, &r.FechaInsertada, &r.IDUsuarioInsercion, &r.FechaUltMod, &r.IDUsuarioUltMod)
	println("El nombre: ", r)
	if err != nil {
		panic(err)
	}
	return c.JSON(http.StatusOK, r)
}

func main() {
	e := echo.New()
	e.Use(middleware.Logger())
	e.Use(middleware.Recover())
	// CORS restricted
	// Allows requests from any `https://labstack.com` or `https://labstack.net` origin
	// wth GET, PUT, POST or DELETE method.
	e.Use(middleware.CORSWithConfig(middleware.CORSConfig{
		AllowOrigins: []string{"*"},
		AllowMethods: []string{http.MethodGet, http.MethodPut, http.MethodPost, http.MethodDelete},
	}))

	db, err := sql.Open("goracle", "HARRY/123456@localhost/xe")

	// var new_user string
	// var tid int
	// new_user := "Harry Alvarado"
	// _, err = db.Exec("INSERT INTO usuarios (nombre, fecha_insertada) VALUES (:Nombre, sysdate) returning id INTO :Tid",
	// 	sql.Named("Nombre", new_user),
	// 	sql.Named("Tid", sql.Out{Dest: &tid}))
	// if err != nil {
	// 	panic(err)
	// }
	// fmt.Printf("\nId del valor ingresado %v\n", tid)

	// -------------------------------------
	rows, err := db.Query("SELECT nombre FROM usuarios")
	if err != nil {
		panic(err)
	}
	defer rows.Close()
	var name string
	for rows.Next() {
		err := rows.Scan(&name)
		if err != nil {
			panic(err)
		}
		fmt.Printf("\nNombre: %s ", name)
	}
	err = rows.Err()
	if err != nil {
		panic(err)
	}
	// -------------------------------------

	if err != nil {
		panic(err)
	}
	defer db.Close()

	err = db.Ping()
	if err != nil {
		panic(err)
	}

	// Read index.html
	index_html, err := ioutil.ReadFile("index.html")
	if err != nil {
		panic(err)
	}
	if index_html == nil {
		index_html = []byte(`Esta deberia ser la página principal, el archivo '<i>index.html</i>' no ha sido encontrado.`)
	}
	// fmt.Println("The file contains: " + string(index_html))
	e.GET("/show", show)
	e.GET("/", func(c echo.Context) error {

		return c.HTML(http.StatusOK, string(index_html))
		// return c.String(http.StatusOK, "Hello, World! "+hello)
	})

	// Routes Users
	e.POST("/users", createUser)

	// Routes Rols
	e.POST("/rols", rolCreate)
	e.GET("/rols", rolAll)
	e.GET("/rols/:id", rolAll)
	e.PUT("/rols/:id", rolUpdate)

	// Routes Items

	fmt.Println("Hello World!!")
	e.Logger.Fatal(e.Start(":2828"))
}
