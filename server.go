package main

import (
	"database/sql"
	"fmt"
	"io/ioutil"
	"net/http"
	"strconv"
	"strings"
	"time"

	"github.com/labstack/echo"
	"github.com/labstack/echo/middleware"
	_ "gopkg.in/goracle.v2"
)

//e.GET("/show", show)
func show(c echo.Context) error {
	// Get team and member from the query string
	// team := c.QueryParam("team")
	// member := c.QueryParam("member")
	u := &usuario{}

	db, err := sql.Open("goracle", "HARRY/123456@localhost/xe")
	rows, err := db.Query("SELECT id, nombre, apellido, fecha_nacimiento, genero, telefono, email,id_rol, rol_nombre, id_bitacora, fecha_insercion, id_usuario_insercion, fecha_ult_mod, id_usuario_ult_mod FROM vusuario")
	// rows, err := db.Query("SELECT id, nombre FROM vusuario")

	if err != nil {
		panic(err)
	}
	defer rows.Close()

	for rows.Next() {
		err := rows.Scan(&u.ID, &u.Nombre, &u.Apellido, &u.FechaNacimiento, &u.Genero, &u.Telefono, &u.Email, &u.IDRol, &u.NombreRol, &u.IDBitacora, &u.FechaInsercion, &u.IDUsuarioInsercion, &u.FechaUltMod, &u.IDUsuarioUltMod)
		// err := rows.Scan(&u.ID, &u.Nombre)
		if err != nil {
			panic(err)
		}
		fmt.Printf("\n ####->>>> ID: %d - Nombre: %s <<<<<<<----------- \n", u.ID, u.Nombre)
		// is := rol{r.ID, r.Nombre, r.Descripcion, r.Activo, r.IDBitacora, r.FechaInsertada, r.IDUsuarioInsercion, r.FechaUltMod, r.IDUsuarioUltMod}
		// rAll = append(rAll, is)
	}
	err = rows.Err()
	if err != nil {
		panic(err)
	}
	// return c.JSON(http.StatusOK, rAll)

	// return c.String(http.StatusOK, "team:"+team+", member:"+member)
	// return c.String(http.StatusOK, "ID:: "+string(u.ID)+", Nombre: "+u.Nombre+" Apellido: "+u.Apellido)
	return c.JSON(http.StatusOK, u)
}

// --- USER ROUTES -------------------------------

type (
	user struct {
		ID   int    `json:"id"`
		Name string `json:"name"`
	}
)
type (
	usuario struct {
		ID                 int       `json:"id"`
		Nombre             string    `json:"nombre"`
		Apellido           string    `json:"apellido"`
		FechaNacimiento    time.Time `json:"fechaNacimiento"`
		Genero             string    `json:"genero"`
		Telefono           string    `json:"telefono"`
		Email              string    `json:"email"`
		Username           string    `json:"username"`
		Password           string    `json:"password"`
		Activo             string    `json:"activo"`
		IDRol              int       `json:"idRol"`
		NombreRol          string    `json:"nombreRol"`
		IDBitacora         int       `json:"idBitacora"`
		FechaInsercion     time.Time `json:"fechaInsercion"`
		IDUsuarioInsercion int       `json:"idUsuarioInsercion"`
		FechaUltMod        time.Time `json:"fechaUltMod"`
		IDUsuarioUltMod    int       `json:"idUsuarioUltMod"`
	}
)

func userAll(c echo.Context) error {
	m := &mensaje{
		ID:      02,
		Mensaje: "Elemento no encontrado",
	}
	u := &usuario{}
	if err := c.Bind(u); err != nil {
		return err
	}
	uAll := make([]usuario, 0)

	db, err := sql.Open("goracle", "HARRY/123456@localhost/xe")
	wid, _ := strconv.Atoi(c.Param("id"))
	if wid != 0 {
		row := db.QueryRow("SELECT id, nombre, apellido, fecha_nacimiento, genero, telefono, email,id_rol, rol_nombre, id_bitacora, fecha_insercion, id_usuario_insercion, fecha_ult_mod, id_usuario_ult_mod FROM vusuario WHERE id = :1", wid)
		err = row.Scan(&u.ID, &u.Nombre, &u.Apellido, &u.FechaNacimiento, &u.Genero, &u.Telefono, &u.Email, &u.IDRol, &u.NombreRol, &u.IDBitacora, &u.FechaInsercion, &u.IDUsuarioInsercion, &u.FechaUltMod, &u.IDUsuarioUltMod)
		println("El nombre: ", u.Nombre)

		row = db.QueryRow("SELECT username, password, activo FROM tuserlogin WHERE	id_tusuario = :1", wid)
		err = row.Scan(&u.Username, &u.Password, &u.Activo)
		println("El Username: ", u.Username)
		if err != nil {
			// panic(err)
			m.Error = err
			return c.JSON(http.StatusNotFound, m)
		}
		return c.JSON(http.StatusOK, u)
	} else {
		rows, err := db.Query("SELECT id, nombre, apellido, fecha_nacimiento, genero, telefono, email,id_rol, rol_nombre, id_bitacora, fecha_insercion, id_usuario_insercion, fecha_ult_mod, id_usuario_ult_mod FROM vusuario")

		if err != nil {
			panic(err)
		}
		defer rows.Close()

		for rows.Next() {
			err := rows.Scan(&u.ID, &u.Nombre, &u.Apellido, &u.FechaNacimiento, &u.Genero, &u.Telefono, &u.Email, &u.IDRol, &u.NombreRol, &u.IDBitacora, &u.FechaInsercion, &u.IDUsuarioInsercion, &u.FechaUltMod, &u.IDUsuarioUltMod)
			row1 := db.QueryRow("SELECT username, password, activo FROM tuserlogin WHERE	id_tusuario = :1", u.ID)
			err = row1.Scan(&u.Username, &u.Password, &u.Activo)
			println("El Username: ", u.Username)
			if err != nil {
				panic(err)
			}
			// is := usuario{u.ID, u.Nombre, u.Apellido, u.FechaNacimiento, u.Genero, u.Telefono, u.Email}
			uAll = append(uAll, *u)
			fmt.Printf("\nIndex: %d - Nombre: %s ", u.ID, u.Nombre)
		}
		err = rows.Err()
		if err != nil {
			panic(err)
		}
		return c.JSON(http.StatusOK, uAll)
	}

	// return c.JSON(http.StatusOK, wid)
}

func userCreate(c echo.Context) error {
	u := &usuario{}
	if err := c.Bind(u); err != nil {
		return err
	}
	db, err := sql.Open("goracle", "HARRY/123456@localhost/xe")
	var idTb, idTu int
	_, err = db.Exec("BEGIN pkg_usuario.crear(vi_nombre => :1, vi_apellido => :2, vi_fecha_nacimiento => :3, vi_genero => :4, vi_telefono => :5, vi_email => :6, vi_id_trol => :7, vi_username => :8, vi_password => :9, vi_activo => :10, vi_id_usuario_insercion => :11, id_tu => :12, id_tb => :13); END;", u.Nombre, u.Apellido, u.FechaNacimiento, u.Genero, u.Telefono, strings.ToLower(u.Email), u.IDRol, strings.ToLower(u.Username), u.Password, u.Activo, u.IDUsuarioInsercion, sql.Out{Dest: &idTu}, sql.Out{Dest: &idTb})
	u.ID = idTu

	row := db.QueryRow("SELECT id, nombre, apellido, fecha_nacimiento, genero, telefono, email,id_rol, rol_nombre, id_bitacora, fecha_insercion, id_usuario_insercion, fecha_ult_mod, id_usuario_ult_mod FROM vusuario WHERE id = :1", idTu)
	err = row.Scan(&u.ID, &u.Nombre, &u.Apellido, &u.FechaNacimiento, &u.Genero, &u.Telefono, &u.Email, &u.IDRol, &u.NombreRol, &u.IDBitacora, &u.FechaInsercion, &u.IDUsuarioInsercion, &u.FechaUltMod, &u.IDUsuarioUltMod)

	println("El nombre: ", u)
	if err != nil {
		panic(err)
	}
	fmt.Printf("\nID [%d] del USUARIO [%s] insertado\n", idTu, u.Nombre)
	// return c.JSON(http.StatusOK, u)

	// println("Nombre del ROL: ", u.Nombre)
	return c.JSON(http.StatusCreated, u)
}

func userUpdate(c echo.Context) error {
	u := &usuario{}
	if err := c.Bind(u); err != nil {
		return err
	}
	wid, _ := strconv.Atoi(c.Param("id"))
	println("Este es el PUT-USER wid: ", wid)
	db, err := sql.Open("goracle", "HARRY/123456@localhost/xe")
	println("Apellido en: ", u.Apellido)
	_, err = db.Exec("BEGIN pkg_usuario.actualizar(vi_id => :1, vi_nombre => :2, vi_apellido => :3, vi_fecha_nacimiento => :4, vi_genero => :5, vi_telefono => :6, vi_email => :7, vi_id_trol => :8, vi_username => :9, vi_password => :10, vi_activo => :11, vi_id_usuario => :12); commit; END;", wid, u.Nombre, u.Apellido, u.FechaNacimiento, u.Genero, u.Telefono, strings.ToLower(u.Email), u.IDRol, strings.ToLower(u.Username), u.Password, u.Activo, u.IDUsuarioInsercion)
	if err != nil {
		panic(err)
	}
	row := db.QueryRow("SELECT id, nombre, apellido, fecha_nacimiento, genero, telefono, email,id_rol, rol_nombre, id_bitacora, fecha_insercion, id_usuario_insercion, fecha_ult_mod, id_usuario_ult_mod FROM vusuario WHERE id = :1", wid)
	err = row.Scan(&u.ID, &u.Nombre, &u.Apellido, &u.FechaNacimiento, &u.Genero, &u.Telefono, &u.Email, &u.IDRol, &u.NombreRol, &u.IDBitacora, &u.FechaInsercion, &u.IDUsuarioInsercion, &u.FechaUltMod, &u.IDUsuarioUltMod)
	println("El nombre: ", u.Nombre)

	if err != nil {
		panic(err)
	}
	return c.JSON(http.StatusOK, u)
}

// --- ROL ROUTES -------------------------------

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
	mensaje struct {
		ID      int    `json:"id"`
		Mensaje string `json:"nombre"`
		Error   error  `json:"error"`
	}
)

func rolAll(c echo.Context) error {
	m := &mensaje{
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
	var idTb, idTr int
	_, err = db.Exec("BEGIN pkg_rol.crear(vi_nombre => :1, vi_descripcion => :2, vi_activo => :3, vi_id_usuario => :4, id_tb => :5, id_tr => :6); END;", r.Nombre, r.Descripcion, r.Activo, r.IDUsuarioInsercion, sql.Out{Dest: &idTb}, sql.Out{Dest: &idTr})
	r.ID = idTb
	if err != nil {
		panic(err)
	}
	fmt.Printf("\nID del valor insertado %v\n", idTb)

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
	println("Este es el PUT-ROL wid: ", wid)
	db, err := sql.Open("goracle", "HARRY/123456@localhost/xe")

	_, err = db.Exec("BEGIN pkg_rol.actualizar(vi_id => :1, vi_nombre => :2, vi_descripcion => :3, vi_activo => :4, vi_id_usuario => :5, vi_id_tbitacora => :6); END;", wid, r.Nombre, r.Descripcion, r.Activo, r.IDUsuarioInsercion, r.IDBitacora)

	row := db.QueryRow("SELECT ID, NOMBRE, DESCRIPCION,	ACTIVO,	ID_BITACORA, FECHA_INSERCION, ID_USUARIO_INSERCION, FECHA_ULT_MOD, ID_USUARIO_ULT_MOD FROM vrol WHERE id = :1", wid)
	err = row.Scan(&r.ID, &r.Nombre, &r.Descripcion, &r.Activo, &r.IDBitacora, &r.FechaInsertada, &r.IDUsuarioInsercion, &r.FechaUltMod, &r.IDUsuarioUltMod)

	println("El nombre: ", r)
	if err != nil {
		panic(err)
	}
	return c.JSON(http.StatusOK, r)
}

// --- LOGIN ROUTES -------------------------------

type (
	userlogin struct {
		Username string `json:"username"`
		Password string `json:"password"`
	}
)

func userLogin(c echo.Context) error {
	ul := &userlogin{}
	u := &usuario{}
	if err := c.Bind(ul); err != nil {
		return err
	}
	fmt.Printf("->>> - Username [%s] - Password [%s]\n", ul.Username, ul.Password)
	db, err := sql.Open("goracle", "HARRY/123456@localhost/xe")
	rows, err := db.Query("SELECT id, username, password, id_tusuario, activo  FROM tuserlogin")
	if err != nil {
		panic(err)
	}
	defer rows.Close()
	var outID, outIDUsuario int
	var outUsername, outPassword, outActivo string
	auth := false
	for rows.Next() {
		err := rows.Scan(&outID, &outUsername, &outPassword, &outIDUsuario, &outActivo)
		if err != nil {
			panic(err)
		}
		if strings.ToLower(ul.Username) == outUsername && ul.Password == outPassword {

			fmt.Printf("¡¡Las credenciales coindicen!! IDUSER: [%d] - Username [%s] - Password [%s]\n", outIDUsuario, outUsername, outPassword)
			row := db.QueryRow("SELECT id, nombre, apellido, fecha_nacimiento, genero, telefono, email,id_rol, rol_nombre, id_bitacora, fecha_insercion, id_usuario_insercion, fecha_ult_mod, id_usuario_ult_mod FROM vusuario WHERE id = :1", outIDUsuario)
			err = row.Scan(&u.ID, &u.Nombre, &u.Apellido, &u.FechaNacimiento, &u.Genero, &u.Telefono, &u.Email, &u.IDRol, &u.NombreRol, &u.IDBitacora, &u.FechaInsercion, &u.IDUsuarioInsercion, &u.FechaUltMod, &u.IDUsuarioUltMod)
			u.Username = outUsername
			u.Password = outPassword
			u.Activo = outActivo
			println("El nombre: ", u.Nombre)
			if err != nil {
				panic(err)
			}
			auth = true
			break
		}
		fmt.Printf("ID: [%d] - Username [%s] - Password [%s]\n", outIDUsuario, outUsername, outPassword)
	}
	err = rows.Err()
	if err != nil {
		panic(err)
	}
	if auth {
		return c.JSON(http.StatusOK, u)
	} else {
		return c.JSON(http.StatusOK, ul)
	}
}

// --- AREA ROUTES -------------------------------

type (
	area struct {
		ID                 int       `json:"id"`
		Nombre             string    `json:"nombre"`
		Descripcion        string    `json:"descripcion"`
		IDBitacora         int       `json:"idBitacora"`
		FechaInsertada     time.Time `json:"fechaInsertada"`
		IDUsuarioInsercion int       `json:"idUsuarioInsercion"`
		FechaUltMod        time.Time `json:"fechaUltMod"`
		IDUsuarioUltMod    int       `json:"idUsuarioUltMod"`
	}
)

func areaAll(c echo.Context) error {
	m := &mensaje{
		ID:      02,
		Mensaje: "Elemento no encontrado",
	}
	a := &area{}
	if err := c.Bind(a); err != nil {
		return err
	}
	aAll := make([]area, 0)

	db, err := sql.Open("goracle", "HARRY/123456@localhost/xe")
	wid, _ := strconv.Atoi(c.Param("id"))
	if wid != 0 {
		row := db.QueryRow("SELECT ID, NOMBRE, DESCRIPCION,	ID_BITACORA, FECHA_INSERCION, ID_USUARIO_INSERCION, FECHA_ULT_MOD, ID_USUARIO_ULT_MOD FROM varea WHERE id = :1", wid)
		err = row.Scan(&a.ID, &a.Nombre, &a.Descripcion, &a.IDBitacora, &a.FechaInsertada, &a.IDUsuarioInsercion, &a.FechaUltMod, &a.IDUsuarioUltMod)
		println("El nombre: ", a)
		if err != nil {
			// panic(err)
			m.Error = err
			return c.JSON(http.StatusNotFound, m)
		}
		return c.JSON(http.StatusOK, a)
	} else {
		rows, err := db.Query("SELECT ID, NOMBRE, DESCRIPCION,	ID_BITACORA, FECHA_INSERCION, ID_USUARIO_INSERCION, FECHA_ULT_MOD, ID_USUARIO_ULT_MOD FROM varea")

		if err != nil {
			panic(err)
		}
		defer rows.Close()

		for rows.Next() {
			err := rows.Scan(&a.ID, &a.Nombre, &a.Descripcion, &a.IDBitacora, &a.FechaInsertada, &a.IDUsuarioInsercion, &a.FechaUltMod, &a.IDUsuarioUltMod)
			if err != nil {
				panic(err)
			}
			is := area{a.ID, a.Nombre, a.Descripcion, a.IDBitacora, a.FechaInsertada, a.IDUsuarioInsercion, a.FechaUltMod, a.IDUsuarioUltMod}
			aAll = append(aAll, is)
			fmt.Printf("\nIndex: %d - Nombre: %s ", a.ID, a.Nombre)
		}
		err = rows.Err()
		if err != nil {
			panic(err)
		}
		return c.JSON(http.StatusOK, aAll)
	}

	return c.JSON(http.StatusOK, wid)
}

func areaCreate(c echo.Context) error {
	a := &area{
		ID: 1,
	}
	if err := c.Bind(a); err != nil {
		return err
	}

	db, err := sql.Open("goracle", "HARRY/123456@localhost/xe")
	var voIDTa, voIDTb int
	_, err = db.Exec("BEGIN pkg_area.crear(vi_nombre => :1, vi_descripcion => :2, vi_id_usuario_insercion => :3, vo_id_ta => :4, vo_id_tb => :5); END;", a.Nombre, a.Descripcion, a.IDUsuarioInsercion, sql.Out{Dest: &voIDTa}, sql.Out{Dest: &voIDTb})
	a.ID = voIDTa
	if err != nil {
		panic(err)
	}
	fmt.Printf("\nID del valor insertado %v\n", voIDTa)
	row := db.QueryRow("SELECT ID, NOMBRE, DESCRIPCION,	ID_BITACORA, FECHA_INSERCION, ID_USUARIO_INSERCION, FECHA_ULT_MOD, ID_USUARIO_ULT_MOD FROM varea WHERE id = :1", voIDTa)
	err = row.Scan(&a.ID, &a.Nombre, &a.Descripcion, &a.IDBitacora, &a.FechaInsertada, &a.IDUsuarioInsercion, &a.FechaUltMod, &a.IDUsuarioUltMod)
	println("El nombre: ", a)
	if err != nil {
		panic(err)
	}
	println("Nombre del AREA: ", a.Nombre)
	return c.JSON(http.StatusCreated, a)
}

func areaUpdate(c echo.Context) error {
	a := &area{
		ID: 1,
	}
	if err := c.Bind(a); err != nil {
		return err
	}
	wid, _ := strconv.Atoi(c.Param("id"))
	println("Este es el PUT-AREA wid: ", wid)
	db, err := sql.Open("goracle", "HARRY/123456@localhost/xe")
	var voIDTa, voIDTb int
	_, err = db.Exec("BEGIN pkg_area.actualizar(vi_id => :1, vi_nombre => :2, vi_descripcion => :3, vi_id_usuario_insercion => :4, vo_id_ta => :5, vo_id_tb => :6); END;", wid, a.Nombre, a.Descripcion, a.IDUsuarioInsercion, voIDTa, voIDTb)

	row := db.QueryRow("SELECT ID, NOMBRE, DESCRIPCION,	ID_BITACORA, FECHA_INSERCION, ID_USUARIO_INSERCION, FECHA_ULT_MOD, ID_USUARIO_ULT_MOD FROM varea WHERE id = :1", wid)
	err = row.Scan(&a.ID, &a.Nombre, &a.Descripcion, &a.IDBitacora, &a.FechaInsertada, &a.IDUsuarioInsercion, &a.FechaUltMod, &a.IDUsuarioUltMod)

	println("El nombre: ", a)
	if err != nil {
		panic(err)
	}
	return c.JSON(http.StatusOK, a)
}

// --- COLECCION ROUTES -------------------------------

type (
	coleccion struct {
		ID                 int       `json:"id"`
		Nombre             string    `json:"nombre"`
		Descripcion        string    `json:"descripcion"`
		DescripcionL       string    `json:"descripcionL"`
		URLImg             string    `json:"urlImg"`
		IDArea             int       `json:"idArea"`
		NombreArea         string    `json:"nombreArea"`
		IDBitacora         int       `json:"idBitacora"`
		FechaInsertada     time.Time `json:"fechaInsertada"`
		IDUsuarioInsercion int       `json:"idUsuarioInsercion"`
		FechaUltMod        time.Time `json:"fechaUltMod"`
		IDUsuarioUltMod    int       `json:"idUsuarioUltMod"`
	}
)

func coleccionAll(c echo.Context) error {
	m := &mensaje{
		ID:      02,
		Mensaje: "Elemento no encontrado",
	}
	co := &coleccion{}
	if err := c.Bind(co); err != nil {
		return err
	}
	coAll := make([]coleccion, 0)

	db, err := sql.Open("goracle", "HARRY/123456@localhost/xe")
	wid, _ := strconv.Atoi(c.Param("id"))
	if wid != 0 {
		row := db.QueryRow("SELECT ID, NOMBRE, DESCRIPCION, DESCRIPCION_L, URL_IMG, ID_AREA, NOMBRE_AREA, ID_BITACORA, FECHA_INSERCION, ID_USUARIO_INSERCION, FECHA_ULT_MOD, ID_USUARIO_ULT_MOD FROM vcoleccion WHERE id = :1", wid)
		err = row.Scan(&co.ID, &co.Nombre, &co.Descripcion, &co.DescripcionL, &co.URLImg, &co.IDArea, &co.NombreArea, &co.IDBitacora, &co.FechaInsertada, &co.IDUsuarioInsercion, &co.FechaUltMod, &co.IDUsuarioUltMod)
		println("El nombre: ", co.Nombre)
		if err != nil {
			// panic(err)
			m.Error = err
			return c.JSON(http.StatusNotFound, m)
		}
		return c.JSON(http.StatusOK, co)
	} else {
		rows, err := db.Query("SELECT ID, NOMBRE, DESCRIPCION, DESCRIPCION_L, URL_IMG, ID_AREA, NOMBRE_AREA, ID_BITACORA, FECHA_INSERCION, ID_USUARIO_INSERCION, FECHA_ULT_MOD, ID_USUARIO_ULT_MOD FROM vcoleccion")

		if err != nil {
			panic(err)
		}
		defer rows.Close()

		for rows.Next() {
			err := rows.Scan(&co.ID, &co.Nombre, &co.Descripcion, &co.DescripcionL, &co.URLImg, &co.IDArea, &co.NombreArea, &co.IDBitacora, &co.FechaInsertada, &co.IDUsuarioInsercion, &co.FechaUltMod, &co.IDUsuarioUltMod)
			if err != nil {
				panic(err)
			}
			is := coleccion{co.ID, co.Nombre, co.Descripcion, co.DescripcionL, co.URLImg, co.IDArea, co.NombreArea, co.IDBitacora, co.FechaInsertada, co.IDUsuarioInsercion, co.FechaUltMod, co.IDUsuarioUltMod}
			coAll = append(coAll, is)
			fmt.Printf("\nIndex: %d - Nombre: %s ", co.ID, co.Nombre)
		}
		err = rows.Err()
		if err != nil {
			panic(err)
		}
		return c.JSON(http.StatusOK, coAll)
	}

	return c.JSON(http.StatusOK, wid)
}

func coleccionCreate(c echo.Context) error {
	co := &coleccion{
		ID: 1,
	}
	if err := c.Bind(co); err != nil {
		return err
	}

	db, err := sql.Open("goracle", "HARRY/123456@localhost/xe")
	var voIDTc, voIDTb int
	_, err = db.Exec("BEGIN pkg_coleccion.crear(vi_nombre => :1, vi_descripcion => :2,vi_descripcion_l => :3, vi_url_img => :4, vi_id_usuario_insercion => :5, vi_id_ta => :6, vo_id_tc => :7,vo_id_tb => :8); END;", co.Nombre, co.Descripcion, co.DescripcionL, co.URLImg, co.IDUsuarioInsercion, co.IDArea, sql.Out{Dest: &voIDTc}, sql.Out{Dest: &voIDTb})
	co.ID = voIDTc
	if err != nil {
		panic(err)
	}
	fmt.Printf("\nID del valor insertado %v\n", voIDTc)
	row := db.QueryRow("SELECT ID, NOMBRE, DESCRIPCION, DESCRIPCION_L, URL_IMG, ID_AREA, NOMBRE_AREA, ID_BITACORA, FECHA_INSERCION, ID_USUARIO_INSERCION, FECHA_ULT_MOD, ID_USUARIO_ULT_MOD FROM vcoleccion WHERE id = :1", voIDTc)
	err = row.Scan(&co.ID, &co.Nombre, &co.Descripcion, &co.DescripcionL, &co.URLImg, &co.IDArea, &co.NombreArea, &co.IDBitacora, &co.FechaInsertada, &co.IDUsuarioInsercion, &co.FechaUltMod, &co.IDUsuarioUltMod)
	println("CREATE - - El nombre: ", co.Nombre)
	if err != nil {
		panic(err)
	}
	println("Nombre del COLECCION: ", co.Nombre)
	return c.JSON(http.StatusCreated, co)
}

func coleccionUpdate(c echo.Context) error {
	co := &coleccion{
		ID: 1,
	}
	if err := c.Bind(co); err != nil {
		return err
	}
	wid, _ := strconv.Atoi(c.Param("id"))
	println("Este es el PUT-AREA wid: ", wid)
	db, err := sql.Open("goracle", "HARRY/123456@localhost/xe")
	var voIDTb int
	_, err = db.Exec("BEGIN pkg_coleccion.actualizar(vi_id=>:1, vi_nombre=>:2, vi_descripcion=>:3, vi_descripcion_l=>:4, vi_url_img=>:5, vi_id_usuario_insercion=>:6, vi_id_ta=>:7, vo_id_tb=>:8); END;", wid, co.Nombre, co.Descripcion, co.DescripcionL, co.URLImg, co.IDUsuarioInsercion, co.IDArea, voIDTb)

	row := db.QueryRow("SELECT ID, NOMBRE, DESCRIPCION, DESCRIPCION_L, URL_IMG, ID_AREA, NOMBRE_AREA, ID_BITACORA, FECHA_INSERCION, ID_USUARIO_INSERCION, FECHA_ULT_MOD, ID_USUARIO_ULT_MOD FROM vcoleccion WHERE id = :1", wid)
	err = row.Scan(&co.ID, &co.Nombre, &co.Descripcion, &co.DescripcionL, &co.URLImg, &co.IDArea, &co.NombreArea, &co.IDBitacora, &co.FechaInsertada, &co.IDUsuarioInsercion, &co.FechaUltMod, &co.IDUsuarioUltMod)
	println("El nombre: ", co.Nombre)

	if err != nil {
		panic(err)
	}
	return c.JSON(http.StatusOK, co)
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
	indexHTML, err := ioutil.ReadFile("index.html")
	if err != nil {
		panic(err)
	}
	if indexHTML == nil {
		indexHTML = []byte(`Esta deberia ser la página principal, el archivo '<i>index.html</i>' no ha sido encontrado.`)
	}
	// fmt.Println("The file contains: " + string(indexHTML))
	e.GET("/show", show)
	e.GET("/", func(c echo.Context) error {
		return c.HTML(http.StatusOK, string(indexHTML))
		// return c.String(http.StatusOK, "Hello, World! "+hello)
	})

	// Routes UserLogin
	e.POST("/ul", userLogin)

	// Routes Users
	e.POST("/users", userCreate)
	e.GET("/users", userAll)
	e.GET("/users/:id", userAll)
	e.PUT("/users/:id", userUpdate)

	// Routes Rols
	e.POST("/rols", rolCreate)
	e.GET("/rols", rolAll)
	e.GET("/rols/:id", rolAll)
	e.PUT("/rols/:id", rolUpdate)

	// Routes Area
	e.POST("/areas", areaCreate)
	e.GET("/areas", areaAll)
	e.GET("/areas/:id", areaAll)
	e.PUT("/areas/:id", areaUpdate)

	// Routes Coleccion
	e.POST("/colecciones", coleccionCreate)
	e.GET("/colecciones", coleccionAll)
	e.GET("/colecciones/:id", coleccionAll)
	e.PUT("/colecciones/:id", coleccionUpdate)

	fmt.Println("Hello World!!")
	e.Logger.Fatal(e.Start(":2828"))
}
