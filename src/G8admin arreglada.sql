--Esta es la base de datos para el proyecto de lenguaje de base de datos SC-504

-- Creada por Josué García Rojas, Luis David Miranda Villalta y 


----------------------- CREACION DE USUARIO----------------------------
--Autor: Luis David Miranda Villalta
--fecha: 19/7/2024
--crear usuario G8admin con grants
CREATE USER G8admin IDENTIFIED BY "1234" ; -- se crea el user con la contraseña 1234
GRANT DBA TO G8admin;
GRANT CONNECT TO G8admin;
GRANT RESOURCE TO G8admin;

SET SERVEROUTPUT ON;

----------------------- CREACION DE TABLAS ----------------------------


--Autor Luis David Miranda Villalta
--fecha: 19/7/2024
--crear tabla rol
CREATE TABLE G8admin.FIDE_rol_TB(
    id_rol number,
    nombre_rol varchar2(64),
    Created_by VARCHAR2(100),
    Creation_date DATE,
    Last_update_by VARCHAR2(100),
    Last_update_date DATE,
    Acción VARCHAR2(100),
    Estado VARCHAR2(100),
    CONSTRAINT FIDE_rol_TB_id_rol_pk PRIMARY KEY (id_rol)
);


--Autor Luis David Miranda Villalta
--fecha: 19/7/2024
--crear tabla usuario
CREATE TABLE G8admin.FIDE_usuario_TB(
    id_usuario number,
    primer_nombre varchar2(30),
    apellido varchar2(30),
    username varchar2(64),
    contraseña varchar2(128),
    email varchar2(256),
    id_rol number,
    nacionalidad varchar2(30),
    ruta_imagen varchar2(1024),
    Created_by VARCHAR2(100),
    Creation_date DATE,
    Last_update_by VARCHAR2(100),
    Last_update_date DATE,
    Acción VARCHAR2(100),
    Estado VARCHAR2(100),
    CONSTRAINT FIDE_usuario_TB_id_usuario_pk PRIMARY KEY (id_usuario),
    CONSTRAINT FIDE_usuario_TB_id_rol_fk FOREIGN KEY (id_rol) REFERENCES G8admin.FIDE_rol_TB(id_rol)
);

--Autor Luis David Miranda Villalta
--fecha: 19/7/2024
--crear tabla categoria para producto
CREATE TABLE G8admin.FIDE_categoria_TB(
    id_categoria number,
    nombre_categoria varchar2(64),
    Created_by VARCHAR2(100),
    Creation_date DATE,
    Last_update_by VARCHAR2(100),
    Last_update_date DATE,
    Acción VARCHAR2(100),
    Estado VARCHAR2(100),
    CONSTRAINT FIDE_categoria_TB_id_categoria_pk PRIMARY KEY (id_categoria)
);

--Autor Luis David Miranda Villalta
--fecha: 19/7/2024
--crear tabla detalle del producto
CREATE TABLE G8admin.FIDE_detalle_TB(
    id_detalle number(8,0),
    color varchar2(30),
    tamaño varchar2(64),
    Created_by VARCHAR2(100),
    Creation_date DATE,
    Last_update_by VARCHAR2(100),
    Last_update_date DATE,
    Acción VARCHAR2(100),
    Estado VARCHAR2(100),
    CONSTRAINT FIDE_detalle_TB_id_detalle_pk PRIMARY KEY (id_detalle)
);

--Autor Luis David Miranda Villalta
--fecha: 19/7/2024
--crear tabla producto
CREATE TABLE G8admin.FIDE_producto_TB(
    id_producto number,
    id_categoria number,
    descripcion varchar2(500),
    precio number(7,2),
    id_detalle number,
    ruta_imagen varchar2(1024),
    Created_by VARCHAR2(100),
    Creation_date DATE,
    Last_update_by VARCHAR2(100),
    Last_update_date DATE,
    Acción VARCHAR2(100),
    Estado VARCHAR2(100),
    CONSTRAINT FIDE_producto_TB_id_producto_pk PRIMARY KEY (id_producto),
    CONSTRAINT FIDE_producto_TB_id_detalle_fk  FOREIGN KEY (id_detalle) REFERENCES G8admin.FIDE_detalle_TB(id_detalle),
    CONSTRAINT FIDE_producto_TB_id_categoria_fk FOREIGN KEY (id_categoria) REFERENCES G8admin.FIDE_categoria_TB(id_categoria)
);



--Autor Luis David Miranda Villalta
--fecha: 19/7/2024
--crear tabla para mostrar la disponibilidad de los productos
CREATE TABLE G8admin.FIDE_inventario_TB(
    id_inventario number,
    ubicacion varchar2(30),
    cantidad number(8,0),
    id_producto number,
    Created_by VARCHAR2(100),
    Creation_date DATE,
    Last_update_by VARCHAR2(100),
    Last_update_date DATE,
    Acción VARCHAR2(100),
    Estado VARCHAR2(100),
    CONSTRAINT FIDE_inventario_TB_id_inventario_pk PRIMARY KEY (id_inventario),
    CONSTRAINT FIDE_inventario_TB_id_producto_fk FOREIGN KEY (id_producto) REFERENCES G8admin.FIDE_producto_TB(id_producto)
);

--Autor Luis David Miranda Villalta
--fecha: 19/7/2024
--crear tabla almacen
CREATE TABLE G8admin.FIDE_almacen_TB(
    id_almacen number,
    tipo_almacen varchar2(64),
    Created_by VARCHAR2(100),
    Creation_date DATE,
    Last_update_by VARCHAR2(100),
    Last_update_date DATE,
    Acción VARCHAR2(100),
    Estado VARCHAR2(100),
    CONSTRAINT FIDE_almacen_TB_id_almacen_pk PRIMARY KEY (id_almacen)
);

--Autor Luis David Miranda Villalta
--fecha: 19/7/2024
--crear tabla pais
CREATE TABLE G8admin.FIDE_pais_TB(
    id_pais number,
    nombre_pais varchar2(60),
    Created_by VARCHAR2(100),
    Creation_date DATE,
    Last_update_by VARCHAR2(100),
    Last_update_date DATE,
    Acción VARCHAR2(100),
    Estado VARCHAR2(100),
    CONSTRAINT FIDE_pais_TB_id_pais_pk PRIMARY KEY (id_pais)
);

--Autor Luis David Miranda Villalta
--fecha: 19/7/2024
--crear tabla empleado
CREATE TABLE G8admin.FIDE_empleado_TB(
    id_empleado number,
    nombre varchar2(60),
    Created_by VARCHAR2(100),
    Creation_date DATE,
    Last_update_by VARCHAR2(100),
    Last_update_date DATE,
    Acción VARCHAR2(100),
    Estado VARCHAR2(100),
    CONSTRAINT FIDE_empleado_TB_id_empleado_pk PRIMARY KEY (id_empleado)
);

--Autor Luis David Miranda Villalta
--fecha: 19/7/2024
--crear tabla capitan
CREATE TABLE G8admin.FIDE_capitan_TB(
    id_capitan number,
    nombre_capitan varchar2(50),
    edad_capitan number(2,1),
    fecha_nacimiento date,
    años_experiencia number(2,1),
    fecha_inicio_cargo date,
    id_pais number,
    Created_by VARCHAR2(100),
    Creation_date DATE,
    Last_update_by VARCHAR2(100),
    Last_update_date DATE,
    Acción VARCHAR2(100),
    Estado VARCHAR2(100),
    CONSTRAINT FIDE_capitan_TB_id_capitan_pk PRIMARY KEY (id_capitan),
    CONSTRAINT FIDE_capitan_TB_id_pais_fk FOREIGN KEY (id_pais) REFERENCES G8admin.FIDE_pais_TB(id_pais)
);



--Autor Luis David Miranda Villalta
--fecha: 19/7/2024
--crear tabla buque
CREATE TABLE G8admin.FIDE_buque_TB(
    id_buque number,
    nombre_barco varchar2(20),
    estado_buque varchar2(20),
    capacidad_maxima number(7,5), -- peso en libras
    id_empleado number,
    id_capitan number,
    Created_by VARCHAR2(100),
    Creation_date DATE,
    Last_update_by VARCHAR2(100),
    Last_update_date DATE,
    Acción VARCHAR2(100),
    Estado VARCHAR2(100),
    CONSTRAINT FIDE_buque_TB_id_buque_pk PRIMARY KEY (id_buque),
    CONSTRAINT FIDE_buque_TB_id_empleado_fk FOREIGN KEY (id_empleado) REFERENCES G8admin.FIDE_empleado_TB(id_empleado),
    CONSTRAINT FIDE_buque_TB_id_capitan_fk FOREIGN KEY (id_capitan) REFERENCES G8admin.FIDE_capitan_TB(id_capitan)
);

--Autor Luis David Miranda Villalta
--fecha: 19/7/2024
--crear tabla destino
CREATE TABLE G8admin.FIDE_destino_TB(
    id_destino number,
    nombre_puerto varchar2(40),
    fecha_partida date,
    fecha_llegada date,
    ubicacion varchar2(40),
    id_pais number,
    id_buque number,
    Created_by VARCHAR2(100),
    Creation_date DATE,
    Last_update_by VARCHAR2(100),
    Last_update_date DATE,
    Acción VARCHAR2(100),
    Estado VARCHAR2(100),
    CONSTRAINT FIDE_destino_TB_id_destino_pk  PRIMARY KEY (id_destino),
    CONSTRAINT FIDE_destino_TB_id_pais_fk FOREIGN KEY (id_pais) REFERENCES G8admin.FIDE_pais_TB(id_pais),
    CONSTRAINT FIDE_destino_TB_id_buque_fk FOREIGN KEY (id_buque) REFERENCES G8admin.FIDE_buque_TB(id_buque)
);



--Autor Luis David Miranda Villalta
--fecha: 19/7/2024
--crear tabla contenedor
CREATE TABLE G8admin.FIDE_contenedor_TB(
    id_contenedor number,
    peso_neto number, 
    estado_contenedor varchar2(20),
    peso_maximo number,
    valor_neto number(7,4), 
    id_buque number,
    id_producto number,
    id_almacen number,
    Created_by VARCHAR2(100),
    Creation_date DATE,
    Last_update_by VARCHAR2(100),
    Last_update_date DATE,
    Acción VARCHAR2(100),
    Estado VARCHAR2(100),
    CONSTRAINT FIDE_contenedor_TB_id_contenedor_pk PRIMARY KEY (id_contenedor),
    CONSTRAINT FIDE_contenedor_TB_id_buque_fk FOREIGN KEY (id_buque) REFERENCES G8admin.FIDE_buque_TB(id_buque),
    CONSTRAINT FIDE_contenedor_TB_id_producto_fk FOREIGN KEY (id_producto) REFERENCES G8admin.FIDE_producto_TB(id_producto),
    CONSTRAINT FIDE_contenedor_TB_id_almacen_fk FOREIGN KEY (id_almacen) REFERENCES G8admin.FIDE_almacen_TB(id_almacen)
);



--Autor Luis David Miranda Villalta
--fecha: 19/7/2024
--crear tabla para relacionar contenedor con producto
CREATE TABLE G8admin.FIDE_contenedor_producto_TB(
    id_contenedor_producto number,
    id_contenedor number,
    id_producto number,
    cantidad_producto number(8,0),
    Created_by VARCHAR2(100),
    Creation_date DATE,
    Last_update_by VARCHAR2(100),
    Last_update_date DATE,
    Acción VARCHAR2(100),
    Estado VARCHAR2(100),
    CONSTRAINT FIDE_contenedor_producto_TB_id_contenedor_producto_pk PRIMARY KEY (id_contenedor_producto),
    CONSTRAINT FIDE_contenedor_producto_TB_id_contenedor_fk FOREIGN KEY (id_contenedor) REFERENCES G8admin.FIDE_contenedor_TB(id_contenedor),
    CONSTRAINT FIDE_contenedor_producto_TB_id_producto_fk FOREIGN KEY (id_producto) REFERENCES G8admin.FIDE_producto_TB(id_producto)
);

--------------------------------------------TRIGGERS DE ACCION, CREATE_BY, DATE------------------------------------------------------------

-- Autor: Josué García Rojas
-- Fecha: 9/08/2024
-- TRIGGERS DE ACCION, CREATE_BY, DATE ETC DE ROL
CREATE OR REPLACE TRIGGER G8admin.FIDE_rol_CREACION_TRG
BEFORE INSERT ON G8admin.FIDE_rol_TB
FOR EACH ROW
BEGIN
    :NEW.CREATED_BY:=USER;
    :NEW.CREATION_DATE:=SYSTIMESTAMP;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_rol_UPDATE_TRG
BEFORE UPDATE ON G8admin.FIDE_rol_TB
FOR EACH ROW
BEGIN
    :NEW.LAST_UPDATE_BY:=USER;
    :NEW.LAST_UPDATE_DATE:=SYSTIMESTAMP;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_rol_ACTION_TRG
BEFORE INSERT ON G8admin.FIDE_rol_TB
FOR EACH ROW
BEGIN
   IF INSERTING THEN
      :NEW.Acción:='INSERT';
    ELSIF UPDATING THEN
        :NEW.Acción:='UPDATE';
    END IF;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_rol_STATUS_TRG
BEFORE INSERT ON G8admin.FIDE_rol_TB
FOR EACH ROW
BEGIN
:NEW.ESTADO:='Activo';
END;


-- Autor: Josué García Rojas
-- Fecha: 9/08/2024
-- TRIGGERS DE ACCION, CREATE_BY, DATE ETC DE USUARIO
CREATE OR REPLACE TRIGGER G8admin.FIDE_usuario_CREACION_TRG
BEFORE INSERT ON G8admin.FIDE_usuario_TB
FOR EACH ROW
BEGIN
    :NEW.Created_by := USER;
    :NEW.Creation_date := SYSTIMESTAMP;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_usuario_UPDATE_TRG
BEFORE UPDATE ON G8admin.FIDE_usuario_TB
FOR EACH ROW
BEGIN
    :NEW.Last_update_by := USER;
    :NEW.Last_update_date := SYSTIMESTAMP;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_usuario_ACTION_TRG
BEFORE INSERT OR UPDATE ON G8admin.FIDE_usuario_TB
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.Acción := 'INSERT';
    ELSIF UPDATING THEN
        :NEW.Acción := 'UPDATE';
    END IF;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_usuario_STATUS_TRG
BEFORE INSERT ON G8admin.FIDE_usuario_TB
FOR EACH ROW
BEGIN
    :NEW.Estado := 'Activo';
END;

-- Autor: Josué García Rojas
-- Fecha: 9/08/2024
-- TRIGGERS DE ACCION, CREATE_BY, DATE ETC DE CATEGORIA
CREATE OR REPLACE TRIGGER G8admin.FIDE_categoria_CREACION_TRG
BEFORE INSERT ON G8admin.FIDE_categoria_TB
FOR EACH ROW
BEGIN
    :NEW.Created_by := USER;
    :NEW.Creation_date := SYSTIMESTAMP;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_categoria_UPDATE_TRG
BEFORE UPDATE ON G8admin.FIDE_categoria_TB
FOR EACH ROW
BEGIN
    :NEW.Last_update_by := USER;
    :NEW.Last_update_date := SYSTIMESTAMP;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_categoria_ACTION_TRG
BEFORE INSERT OR UPDATE ON G8admin.FIDE_categoria_TB
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.Acción := 'INSERT';
    ELSIF UPDATING THEN
        :NEW.Acción := 'UPDATE';
    END IF;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_categoria_STATUS_TRG
BEFORE INSERT ON G8admin.FIDE_categoria_TB
FOR EACH ROW
BEGIN
    :NEW.Estado := 'Activo';
END;

-- Autor: Josué García Rojas
-- Fecha: 9/08/2024
-- TRIGGERS DE ACCION, CREATE_BY, DATE ETC DE DETALLE
CREATE OR REPLACE TRIGGER G8admin.FIDE_detalle_CREACION_TRG
BEFORE INSERT ON G8admin.FIDE_detalle_TB
FOR EACH ROW
BEGIN
    :NEW.Created_by := USER;
    :NEW.Creation_date := SYSTIMESTAMP;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_detalle_UPDATE_TRG
BEFORE UPDATE ON G8admin.FIDE_detalle_TB
FOR EACH ROW
BEGIN
    :NEW.Last_update_by := USER;
    :NEW.Last_update_date := SYSTIMESTAMP;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_detalle_ACTION_TRG
BEFORE INSERT OR UPDATE ON G8admin.FIDE_detalle_TB
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.Acción := 'INSERT';
    ELSIF UPDATING THEN
        :NEW.Acción := 'UPDATE';
    END IF;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_detalle_STATUS_TRG
BEFORE INSERT ON G8admin.FIDE_detalle_TB
FOR EACH ROW
BEGIN
    :NEW.Estado := 'Activo';
END;

-- Autor: Josué García Rojas
-- Fecha: 9/08/2024
-- TRIGGERS DE ACCION, CREATE_BY, DATE ETC DE PRODUCTO
CREATE OR REPLACE TRIGGER G8admin.FIDE_producto_CREACION_TRG
BEFORE INSERT ON G8admin.FIDE_producto_TB
FOR EACH ROW
BEGIN
    :NEW.Created_by := USER;
    :NEW.Creation_date := SYSTIMESTAMP;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_producto_UPDATE_TRG
BEFORE UPDATE ON G8admin.FIDE_producto_TB
FOR EACH ROW
BEGIN
    :NEW.Last_update_by := USER;
    :NEW.Last_update_date := SYSTIMESTAMP;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_producto_ACTION_TRG
BEFORE INSERT OR UPDATE ON G8admin.FIDE_producto_TB
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.Acción := 'INSERT';
    ELSIF UPDATING THEN
        :NEW.Acción := 'UPDATE';
    END IF;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_producto_STATUS_TRG
BEFORE INSERT ON G8admin.FIDE_producto_TB
FOR EACH ROW
BEGIN
    :NEW.Estado := 'Activo';
END;

-- Autor: Josué García Rojas
-- Fecha: 9/08/2024
-- TRIGGERS DE ACCION, CREATE_BY, DATE ETC DE INVENTARIO
CREATE OR REPLACE TRIGGER G8admin.FIDE_inventario_CREACION_TRG
BEFORE INSERT ON G8admin.FIDE_inventario_TB
FOR EACH ROW
BEGIN
    :NEW.Created_by := USER;
    :NEW.Creation_date := SYSTIMESTAMP;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_inventario_UPDATE_TRG
BEFORE UPDATE ON G8admin.FIDE_inventario_TB
FOR EACH ROW
BEGIN
    :NEW.Last_update_by := USER;
    :NEW.Last_update_date := SYSTIMESTAMP;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_inventario_ACTION_TRG
BEFORE INSERT OR UPDATE ON G8admin.FIDE_inventario_TB
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.Acción := 'INSERT';
    ELSIF UPDATING THEN
        :NEW.Acción := 'UPDATE';
    END IF;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_inventario_STATUS_TRG
BEFORE INSERT ON G8admin.FIDE_inventario_TB
FOR EACH ROW
BEGIN
    :NEW.Estado := 'Activo';
END;

-- Autor: Josué García Rojas
-- Fecha: 9/08/2024
-- TRIGGERS DE ACCION, CREATE_BY, DATE ETC DE ALMACEN
CREATE OR REPLACE TRIGGER G8admin.FIDE_almacen_CREACION_TRG
BEFORE INSERT ON G8admin.FIDE_almacen_TB
FOR EACH ROW
BEGIN
    :NEW.Created_by := USER;
    :NEW.Creation_date := SYSTIMESTAMP;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_almacen_UPDATE_TRG
BEFORE UPDATE ON G8admin.FIDE_almacen_TB
FOR EACH ROW
BEGIN
    :NEW.Last_update_by := USER;
    :NEW.Last_update_date := SYSTIMESTAMP;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_almacen_ACTION_TRG
BEFORE INSERT OR UPDATE ON G8admin.FIDE_almacen_TB
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.Acción := 'INSERT';
    ELSIF UPDATING THEN
        :NEW.Acción := 'UPDATE';
    END IF;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_almacen_STATUS_TRG
BEFORE INSERT ON G8admin.FIDE_almacen_TB
FOR EACH ROW
BEGIN
    :NEW.Estado := 'Activo';
END;

-- Autor: Josué García Rojas
-- Fecha: 9/08/2024
-- TRIGGERS DE ACCION, CREATE_BY, DATE ETC DE PAIS
CREATE OR REPLACE TRIGGER G8admin.FIDE_pais_CREACION_TRG
BEFORE INSERT ON G8admin.FIDE_pais_TB
FOR EACH ROW
BEGIN
    :NEW.Created_by := USER;
    :NEW.Creation_date := SYSTIMESTAMP;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_pais_UPDATE_TRG
BEFORE UPDATE ON G8admin.FIDE_pais_TB
FOR EACH ROW
BEGIN
    :NEW.Last_update_by := USER;
    :NEW.Last_update_date := SYSTIMESTAMP;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_pais_ACTION_TRG
BEFORE INSERT OR UPDATE ON G8admin.FIDE_pais_TB
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.Acción := 'INSERT';
    ELSIF UPDATING THEN
        :NEW.Acción := 'UPDATE';
    END IF;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_pais_STATUS_TRG
BEFORE INSERT ON G8admin.FIDE_pais_TB
FOR EACH ROW
BEGIN
    :NEW.Estado := 'Activo';
END;

-- Autor: Josué García Rojas
-- Fecha: 9/08/2024
-- TRIGGERS DE ACCION, CREATE_BY, DATE ETC DE EMPLEADO
CREATE OR REPLACE TRIGGER G8admin.FIDE_empleado_CREACION_TRG
BEFORE INSERT ON G8admin.FIDE_empleado_TB
FOR EACH ROW
BEGIN
    :NEW.Created_by := USER;
    :NEW.Creation_date := SYSTIMESTAMP;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_empleado_UPDATE_TRG
BEFORE UPDATE ON G8admin.FIDE_empleado_TB
FOR EACH ROW
BEGIN
    :NEW.Last_update_by := USER;
    :NEW.Last_update_date := SYSTIMESTAMP;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_empleado_ACTION_TRG
BEFORE INSERT OR UPDATE ON G8admin.FIDE_empleado_TB
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.Acción := 'INSERT';
    ELSIF UPDATING THEN
        :NEW.Acción := 'UPDATE';
    END IF;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_empleado_STATUS_TRG
BEFORE INSERT ON G8admin.FIDE_empleado_TB
FOR EACH ROW
BEGIN
    :NEW.Estado := 'Activo';
END;

-- Autor: Josué García Rojas
-- Fecha: 9/08/2024
-- TRIGGERS DE ACCION, CREATE_BY, DATE ETC DE CAPITAN
CREATE OR REPLACE TRIGGER G8admin.FIDE_capitan_CREACION_TRG
BEFORE INSERT ON G8admin.FIDE_capitan_TB
FOR EACH ROW
BEGIN
    :NEW.Created_by := USER;
    :NEW.Creation_date := SYSTIMESTAMP;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_capitan_UPDATE_TRG
BEFORE UPDATE ON G8admin.FIDE_capitan_TB
FOR EACH ROW
BEGIN
    :NEW.Last_update_by := USER;
    :NEW.Last_update_date := SYSTIMESTAMP;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_capitan_ACTION_TRG
BEFORE INSERT OR UPDATE ON G8admin.FIDE_capitan_TB
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.Acción := 'INSERT';
    ELSIF UPDATING THEN
        :NEW.Acción := 'UPDATE';
    END IF;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_capitan_STATUS_TRG
BEFORE INSERT ON G8admin.FIDE_capitan_TB
FOR EACH ROW
BEGIN
    :NEW.Estado := 'Activo';
END;

-- Autor: Josué García Rojas
-- Fecha: 9/08/2024
-- TRIGGERS DE ACCION, CREATE_BY, DATE ETC DE BUQUE
CREATE OR REPLACE TRIGGER G8admin.FIDE_buque_CREACION_TRG
BEFORE INSERT ON G8admin.FIDE_buque_TB
FOR EACH ROW
BEGIN
    :NEW.Created_by := USER;
    :NEW.Creation_date := SYSTIMESTAMP;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_buque_UPDATE_TRG
BEFORE UPDATE ON G8admin.FIDE_buque_TB
FOR EACH ROW
BEGIN
    :NEW.Last_update_by := USER;
    :NEW.Last_update_date := SYSTIMESTAMP;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_buque_ACTION_TRG
BEFORE INSERT OR UPDATE ON G8admin.FIDE_buque_TB
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.Acción := 'INSERT';
    ELSIF UPDATING THEN
        :NEW.Acción := 'UPDATE';
    END IF;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_buque_STATUS_TRG
BEFORE INSERT ON G8admin.FIDE_buque_TB
FOR EACH ROW
BEGIN
    :NEW.Estado := 'Activo';
END;


-- Autor: Josué García Rojas
-- Fecha: 9/08/2024
-- TRIGGERS DE ACCION, CREATE_BY, DATE ETC DE DESTINO
CREATE OR REPLACE TRIGGER G8admin.FIDE_destino_CREACION_TRG
BEFORE INSERT ON G8admin.FIDE_destino_TB
FOR EACH ROW
BEGIN
    :NEW.Created_by := USER;
    :NEW.Creation_date := SYSTIMESTAMP;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_destino_UPDATE_TRG
BEFORE UPDATE ON G8admin.FIDE_destino_TB
FOR EACH ROW
BEGIN
    :NEW.Last_update_by := USER;
    :NEW.Last_update_date := SYSTIMESTAMP;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_destino_ACTION_TRG
BEFORE INSERT OR UPDATE ON G8admin.FIDE_destino_TB
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.Acción := 'INSERT';
    ELSIF UPDATING THEN
        :NEW.Acción := 'UPDATE';
    END IF;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_destino_STATUS_TRG
BEFORE INSERT ON G8admin.FIDE_destino_TB
FOR EACH ROW
BEGIN
    :NEW.Estado := 'Activo';
END;

-- Autor: Josué García Rojas
-- Fecha: 9/08/2024
-- TRIGGERS DE ACCION, CREATE_BY, DATE ETC DE CONTENEDOR
CREATE OR REPLACE TRIGGER G8admin.FIDE_contenedor_CREACION_TRG
BEFORE INSERT ON G8admin.FIDE_contenedor_TB
FOR EACH ROW
BEGIN
    :NEW.Created_by := USER;
    :NEW.Creation_date := SYSTIMESTAMP;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_contenedor_UPDATE_TRG
BEFORE UPDATE ON G8admin.FIDE_contenedor_TB
FOR EACH ROW
BEGIN
    :NEW.Last_update_by := USER;
    :NEW.Last_update_date := SYSTIMESTAMP;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_contenedor_ACTION_TRG
BEFORE INSERT OR UPDATE ON G8admin.FIDE_contenedor_TB
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.Acción := 'INSERT';
    ELSIF UPDATING THEN
        :NEW.Acción := 'UPDATE';
    END IF;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_contenedor_STATUS_TRG
BEFORE INSERT ON G8admin.FIDE_contenedor_TB
FOR EACH ROW
BEGIN
    :NEW.Estado := 'Activo';
END;


-- Autor: Josué García Rojas
-- Fecha: 9/08/2024
-- TRIGGERS DE ACCION, CREATE_BY, DATE ETC DE CONTENEDOR_PRODUCTO
CREATE OR REPLACE TRIGGER G8admin.FIDE_contenedor_producto_CREACION_TRG
BEFORE INSERT ON G8admin.FIDE_contenedor_producto_TB
FOR EACH ROW
BEGIN
    :NEW.Created_by := USER;
    :NEW.Creation_date := SYSTIMESTAMP;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_contenedor_producto_UPDATE_TRG
BEFORE UPDATE ON G8admin.FIDE_contenedor_producto_TB
FOR EACH ROW
BEGIN
    :NEW.Last_update_by := USER;
    :NEW.Last_update_date := SYSTIMESTAMP;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_contenedor_producto_ACTION_TRG
BEFORE INSERT OR UPDATE ON G8admin.FIDE_contenedor_producto_TB
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.Acción := 'INSERT';
    ELSIF UPDATING THEN
        :NEW.Acción := 'UPDATE';
    END IF;
END;

CREATE OR REPLACE TRIGGER G8admin.FIDE_contenedor_producto_STATUS_TRG
BEFORE INSERT ON G8admin.FIDE_contenedor_producto_TB
FOR EACH ROW
BEGIN
    :NEW.Estado := 'Activo';
END;


----------------------------------------------SEQUENCIAS-----------------------------------------------------------------------------


-- Autor: Josué García Rojas
-- Fecha: 4/08/2024
-- Secuencia para id_rol

CREATE SEQUENCE id_rol_SEQ
START WITH 1
INCREMENT by 1;

-- Autor: Josué García Rojas
-- Fecha: 4/08/2024
-- Secuencia para id_usuario

CREATE SEQUENCE id_usuario_SEQ
START WITH 1
INCREMENT by 1;


-- Autor: Josué García Rojas
-- Fecha: 4/08/2024
-- Secuencia para id_categoria

CREATE SEQUENCE id_categoria_SEQ
START WITH 1
INCREMENT by 1;


-- Autor: Josué García Rojas
-- Fecha: 4/08/2024
-- Secuencia para id_detalle

CREATE SEQUENCE id_detalle_SEQ
START WITH 1
INCREMENT by 1;


-- Autor: Josué García Rojas
-- Fecha: 4/08/2024
-- Secuencia para id_producto

CREATE SEQUENCE id_producto_SEQ
START WITH 1
INCREMENT by 1;


-- Autor: Josué García Rojas
-- Fecha: 4/08/2024
-- Secuencia para id_inventario

CREATE SEQUENCE id_inventario_SEQ
START WITH 1
INCREMENT by 1;

-- Autor: Josué García Rojas
-- Fecha: 4/08/2024
-- Secuencia para id_almacen

CREATE SEQUENCE id_almacen_SEQ
START WITH 1
INCREMENT by 1;

-- Autor: Josué García Rojas
-- Fecha: 4/08/2024
-- Secuencia para id_pais

CREATE SEQUENCE id_pais_SEQ
START WITH 1
INCREMENT by 1;


-- Autor: Josué García Rojas
-- Fecha: 4/08/2024
-- Secuencia para id_empleado

CREATE SEQUENCE id_empleado_SEQ
START WITH 1
INCREMENT by 1;


-- Autor: Josué García Rojas
-- Fecha: 4/08/2024
-- Secuencia para id_capitan

CREATE SEQUENCE id_capitan_SEQ
START WITH 1
INCREMENT by 1;


-- Autor: Josué García Rojas
-- Fecha: 4/08/2024
-- Secuencia para id_buque

CREATE SEQUENCE id_buque_SEQ
START WITH 1
INCREMENT by 1;

-- Autor: Josué García Rojas
-- Fecha: 4/08/2024
-- Secuencia para id_destino

CREATE SEQUENCE id_destino_SEQ
START WITH 1
INCREMENT by 1;


-- Autor: Josué García Rojas
-- Fecha: 4/08/2024
-- Secuencia para id_contenedor

CREATE SEQUENCE id_contenedor_SEQ
START WITH 1
INCREMENT by 1;


--------------------------------------------TRIGGERS PARA LAS SECUENCIAS---------------------------------------------------------

-- Autor: Josué García Rojas
-- Fecha: 4/08/2024
-- Ejecutar secuencia con trigger id_rol

CREATE OR REPLACE TRIGGER G8admin.FIDE_id_rol_GENERAR_ID_TRG
BEFORE INSERT ON G8admin.FIDE_rol_TB
FOR EACH ROW
BEGIN
:NEW.id_rol:=id_rol_SEQ.NEXTVAL;
END;
    
    
-- Autor: Josué García Rojas
-- Fecha: 4/08/2024
-- Ejecutar secuencia con trigger id_usuario

CREATE OR REPLACE TRIGGER G8admin.FIDE_id_usuario_GENERAR_ID_TRG
BEFORE INSERT ON G8admin.FIDE_usuario_TB
FOR EACH ROW
BEGIN
:NEW.id_usuario:=id_usuario_SEQ.NEXTVAL;
END;
    

-- Autor: Josué García Rojas
-- Fecha: 4/08/2024
-- Ejecutar secuencia con trigger id_categoria

CREATE OR REPLACE TRIGGER G8admin.FIDE_id_categoria_GENERAR_ID_TRG
BEFORE INSERT ON G8admin.FIDE_categoria_TB
FOR EACH ROW
BEGIN
:NEW.id_categoria:=id_categoria_SEQ.NEXTVAL;
END;
    

-- Autor: Josué García Rojas
-- Fecha: 4/08/2024
-- Ejecutar secuencia con trigger id_detalle

CREATE OR REPLACE TRIGGER G8admin.FIDE_id_detalle_GENERAR_ID_TRG
BEFORE INSERT ON G8admin.FIDE_detalle_TB
FOR EACH ROW
BEGIN
:NEW.id_detalle:=id_detalle_SEQ.NEXTVAL;
END;


-- Autor: Josué García Rojas
-- Fecha: 4/08/2024
-- Ejecutar secuencia con trigger id_producto

CREATE OR REPLACE TRIGGER G8admin.FIDE_id_producto_GENERAR_ID_TRG
BEFORE INSERT ON G8admin.FIDE_producto_TB
FOR EACH ROW
BEGIN
:NEW.id_producto:=id_producto_SEQ.NEXTVAL;
END;
    

-- Autor: Josué García Rojas
-- Fecha: 4/08/2024
-- Ejecutar secuencia con trigger id_inventario

CREATE OR REPLACE TRIGGER G8admin.FIDE_id_inventario_GENERAR_ID_TRG
BEFORE INSERT ON G8admin.FIDE_inventario_TB
FOR EACH ROW
BEGIN
:NEW.id_inventario:=id_inventario_SEQ.NEXTVAL;
END;
    
-- Autor: Josué García Rojas
-- Fecha: 4/08/2024
-- Ejecutar secuencia con trigger id_almacen

CREATE OR REPLACE TRIGGER G8admin.FIDE_id_almacen_GENERAR_ID_TRG
BEFORE INSERT ON G8admin.FIDE_almacen_TB
FOR EACH ROW
BEGIN
:NEW.id_almacen:=id_almacen_SEQ.NEXTVAL;
END;
    
    
-- Autor: Josué García Rojas
-- Fecha: 4/08/2024
-- Ejecutar secuencia con trigger id_pais

CREATE OR REPLACE TRIGGER G8admin.FIDE_id_pais_GENERAR_ID_TRG
BEFORE INSERT ON G8admin.FIDE_pais_TB
FOR EACH ROW
BEGIN
:NEW.id_pais:=id_pais_SEQ.NEXTVAL;
END;

-- Autor: Josué García Rojas
-- Fecha: 4/08/2024
-- Ejecutar secuencia con trigger id_empleado

CREATE OR REPLACE TRIGGER G8admin.FIDE_id_empleado_GENERAR_ID_TRG
BEFORE INSERT ON G8admin.FIDE_empleado_TB
FOR EACH ROW
BEGIN
:NEW.id_empleado:=id_empleado_SEQ.NEXTVAL;
END;

-- Autor: Josué García Rojas
-- Fecha: 4/08/2024
-- Ejecutar secuencia con trigger id_capitan

CREATE OR REPLACE TRIGGER G8admin.FIDE_id_capitan_GENERAR_ID_TRG
BEFORE INSERT ON G8admin.FIDE_capitan_TB
FOR EACH ROW
BEGIN
:NEW.id_capitan:=id_capitan_SEQ.NEXTVAL;
END;


-- Autor: Josué García Rojas
-- Fecha: 4/08/2024
-- Ejecutar secuencia con trigger id_buque

CREATE OR REPLACE TRIGGER G8admin.FIDE_id_buque_GENERAR_ID_TRG
BEFORE INSERT ON G8admin.FIDE_buque_TB
FOR EACH ROW
BEGIN
:NEW.id_buque:=id_buque_SEQ.NEXTVAL;
END;

-- Autor: Josué García Rojas
-- Fecha: 4/08/2024
-- Ejecutar secuencia con trigger id_destino

CREATE OR REPLACE TRIGGER G8admin.FIDE_id_destino_GENERAR_ID_TRG
BEFORE INSERT ON G8admin.FIDE_destino_TB
FOR EACH ROW
BEGIN
:NEW.id_destino:=id_destino_SEQ.NEXTVAL;
END;

-- Autor: Josué García Rojas
-- Fecha: 4/08/2024
-- Ejecutar secuencia con trigger id_contenedor

CREATE OR REPLACE TRIGGER G8admin.FIDE_id_contenedor_GENERAR_ID_TRG
BEFORE INSERT ON G8admin.FIDE_contenedor_TB
FOR EACH ROW
BEGIN
:NEW.id_contenedor:=id_contenedor_SEQ.NEXTVAL;
END;


--------------------------------------------PROCEDIMIENTOS ALMACENADOS--------------------------------------------------------------------------------------------------

-- Autor: Josué García Rojas
-- Fecha: 23/8/24
--creacion del paquete

CREATE OR REPLACE PACKAGE FIDE_PROCEDIMIENTOS_FUNCIONES_PKG AS

PROCEDURE Insertar_producto_SP(
    p_id_categoria IN G8admin.FIDE_producto_TB.id_categoria%TYPE,
    p_descripcion IN G8admin.FIDE_producto_TB.descripcion%TYPE,
    p_precio IN G8admin.FIDE_producto_TB.precio%TYPE,
    p_id_detalle IN G8admin.FIDE_producto_TB.id_detalle%TYPE,
    p_ruta_imagen IN G8admin.FIDE_producto_TB.ruta_imagen%TYPE
);

PROCEDURE Eliminar_Producto_SP(
p_id_producto IN number
);


PROCEDURE Actualizar_Producto_SP(
P_id_producto IN G8admin.FIDE_producto_TB.id_producto%TYPE,
P_descripcion IN G8admin.FIDE_producto_TB.descripcion%TYPE,
P_precio IN G8admin.FIDE_producto_TB.precio%TYPE,
P_ruta_imagen IN G8admin.FIDE_producto_TB.ruta_imagen%TYPE
);

PROCEDURE categoria_insertar_SP(
  P_nombre_categoria IN G8admin.FIDE_categoria_TB.nombre_categoria%TYPE
);


PROCEDURE categoria_eliminar_SP(
P_id_categoria IN number
);

PROCEDURE categoria_actualizar_nombre_SP(
P_nombre_categoria IN G8admin.FIDE_categoria_TB.nombre_categoria%TYPE,
P_id_categoria IN G8admin.FIDE_categoria_TB.id_categoria%TYPE
);


PROCEDURE detalle_insertar_SP(
P_color IN G8admin.FIDE_detalle_TB.color%TYPE,
P_tamaño IN G8admin.FIDE_detalle_TB.tamaño%TYPE
);

PROCEDURE detalle_eliminar_SP(
P_id_detalle IN number
);

PROCEDURE detalle_actualizar_SP(
P_id_detalle IN G8admin.FIDE_detalle_TB.id_detalle%TYPE,
P_color IN G8admin.FIDE_detalle_TB.color%TYPE,
P_tamaño IN G8admin.FIDE_detalle_TB.tamaño%TYPE
);

PROCEDURE pais_insertar_SP(
P_nombre_pais IN G8admin.FIDE_pais_TB.NOMBRE_PAIS%TYPE
);

PROCEDURE pais_eliminar_SP(
P_id_pais IN number
);


PROCEDURE pais_actualizar_SP(
P_id_pais IN G8admin.FIDE_pais_TB.id_pais%TYPE,
P_nombre_pais IN G8admin.FIDE_pais_TB.NOMBRE_PAIS%TYPE
);

PROCEDURE rol_insertar_SP(
P_nombre_rol IN G8admin.FIDE_rol_TB.NOMBRE_rol%TYPE
);

PROCEDURE roles_eliminar_SP(
P_id_rol IN number
);

PROCEDURE rol_actualizar_SP(
P_id_rol IN G8admin.FIDE_rol_TB.id_rol%TYPE,
P_nombre_rol IN G8admin.FIDE_rol_TB.NOMBRE_rol%TYPE
);

PROCEDURE capitan_insertar_SP(
    P_nombre_capitan IN G8admin.FIDE_capitan_TB.nombre_capitan%TYPE,
    P_edad_capitan IN G8admin.FIDE_capitan_TB.edad_capitan%TYPE,
    P_fecha_nacimiento IN G8admin.FIDE_capitan_TB.fecha_nacimiento%TYPE,
    P_años_experiencia IN G8admin.FIDE_capitan_TB.años_experiencia%TYPE,
    P_fecha_inicio_cargo IN G8admin.FIDE_capitan_TB.fecha_inicio_cargo%TYPE,
    P_id_pais IN G8admin.FIDE_capitan_TB.id_pais%TYPE
);

PROCEDURE capitan_eliminar_SP(
    P_id_capitan IN number
);


PROCEDURE capitan_actualizar_SP(
    P_id_capitan IN G8admin.FIDE_capitan_TB.id_capitan%TYPE,
    P_nombre_capitan IN G8admin.FIDE_capitan_TB.nombre_capitan%TYPE,
    P_edad_capitan IN G8admin.FIDE_capitan_TB.edad_capitan%TYPE,
    P_fecha_nacimiento IN G8admin.FIDE_capitan_TB.fecha_nacimiento%TYPE,
    P_años_experiencia IN G8admin.FIDE_capitan_TB.años_experiencia%TYPE,
    P_fecha_inicio_cargo IN G8admin.FIDE_capitan_TB.fecha_inicio_cargo%TYPE,
    P_id_pais IN G8admin.FIDE_capitan_TB.id_pais%TYPE
);

PROCEDURE buque_insertar_SP(
    P_nombre_barco IN G8admin.FIDE_buque_TB.nombre_barco%TYPE,
    P_estado_buque IN G8admin.FIDE_buque_TB.estado_buque%TYPE,
    P_capacidad_maxima IN G8admin.FIDE_buque_TB.capacidad_maxima%TYPE,
    P_id_empleado IN G8admin.FIDE_buque_TB.id_empleado%TYPE,
    P_id_capitan IN G8admin.FIDE_buque_TB.id_capitan%TYPE
);

PROCEDURE buque_eliminar_SP(
    P_id_buque IN G8admin.FIDE_buque_TB.id_buque%TYPE
);


PROCEDURE buque_actualizar_SP(
    P_id_buque IN G8admin.FIDE_buque_TB.id_buque%TYPE,
    P_nombre_barco IN G8admin.FIDE_buque_TB.nombre_barco%TYPE,
    P_estado_buque IN G8admin.FIDE_buque_TB.estado_buque%TYPE,
    P_capacidad_maxima IN G8admin.FIDE_buque_TB.capacidad_maxima%TYPE,
    P_id_empleado IN G8admin.FIDE_buque_TB.id_empleado%TYPE,
    P_id_capitan IN G8admin.FIDE_buque_TB.id_capitan%TYPE
);


PROCEDURE empleado_insertar_SP(
    P_nombre IN G8admin.FIDE_empleado_TB.nombre%TYPE
);

PROCEDURE empleado_eliminar_SP(
    P_id_empleado IN G8admin.FIDE_empleado_TB.id_empleado%TYPE
);


PROCEDURE empleado_actualizar_SP(
    P_id_empleado IN G8admin.FIDE_empleado_TB.id_empleado%TYPE,
    P_nombre IN G8admin.FIDE_empleado_TB.nombre%TYPE
);

PROCEDURE almacen_insertar_SP(
    P_tipo_almacen IN G8admin.FIDE_almacen_TB.tipo_almacen%TYPE
);

PROCEDURE almacen_eliminar_SP(
    P_id_almacen IN number
);

PROCEDURE almacen_actualizar_SP(
    P_id_almacen IN G8admin.FIDE_almacen_TB.id_almacen%TYPE,
    P_tipo_almacen IN G8admin.FIDE_almacen_TB.tipo_almacen%TYPE
);

PROCEDURE inventario_insertar_SP(
    P_ubicacion IN G8admin.FIDE_inventario_TB.ubicacion%TYPE,
    P_cantidad IN G8admin.FIDE_inventario_TB.cantidad%TYPE,
    P_id_producto IN G8admin.FIDE_inventario_TB.id_producto%TYPE
);

PROCEDURE inventario_eliminar_SP(
    P_id_inventario IN number
);

PROCEDURE inventario_actualizar_SP(
    P_id_inventario IN G8admin.FIDE_inventario_TB.id_inventario%TYPE,
    P_ubicacion IN G8admin.FIDE_inventario_TB.ubicacion%TYPE,
    P_cantidad IN G8admin.FIDE_inventario_TB.cantidad%TYPE,
    P_id_producto IN G8admin.FIDE_inventario_TB.id_producto%TYPE
);

PROCEDURE destino_insertar_SP(
    P_nombre_puerto IN G8admin.FIDE_destino_TB.nombre_puerto%TYPE,
    P_fecha_partida IN G8admin.FIDE_destino_TB.fecha_partida%TYPE,
    P_fecha_llegada IN G8admin.FIDE_destino_TB.fecha_llegada%TYPE,
    P_ubicacion IN G8admin.FIDE_destino_TB.ubicacion%TYPE,
    P_id_pais IN G8admin.FIDE_destino_TB.id_pais%TYPE,
    P_id_buque IN G8admin.FIDE_destino_TB.id_buque%TYPE
);


PROCEDURE destino_eliminar_SP(
    P_id_destino IN G8admin.FIDE_destino_TB.id_destino%TYPE
);


PROCEDURE destino_actualizar_SP(
    P_id_destino IN G8admin.FIDE_destino_TB.id_destino%TYPE,
    P_nombre_puerto IN G8admin.FIDE_destino_TB.nombre_puerto%TYPE,
    P_fecha_partida IN G8admin.FIDE_destino_TB.fecha_partida%TYPE,
    P_fecha_llegada IN G8admin.FIDE_destino_TB.fecha_llegada%TYPE,
    P_ubicacion IN G8admin.FIDE_destino_TB.ubicacion%TYPE,
    P_id_pais IN G8admin.FIDE_destino_TB.id_pais%TYPE,
    P_id_buque IN G8admin.FIDE_destino_TB.id_buque%TYPE
);


PROCEDURE usuario_insertar_SP(
    P_primer_nombre IN G8admin.FIDE_usuario_TB.primer_nombre%TYPE,
    P_apellido IN G8admin.FIDE_usuario_TB.apellido%TYPE,
    P_username IN G8admin.FIDE_usuario_TB.username%TYPE,
    P_contraseña IN G8admin.FIDE_usuario_TB.contraseña%TYPE,
    P_email IN G8admin.FIDE_usuario_TB.email%TYPE,
    P_id_rol IN G8admin.FIDE_usuario_TB.id_rol%TYPE,
    P_nacionalidad IN G8admin.FIDE_usuario_TB.nacionalidad%TYPE,
    P_ruta_imagen IN G8admin.FIDE_usuario_TB.ruta_imagen%TYPE
);

PROCEDURE usuario_eliminar_SP(
    P_id_usuario IN G8admin.FIDE_usuario_TB.id_usuario%TYPE
);


PROCEDURE usuario_actualizar_SP(
    P_id_usuario IN G8admin.FIDE_usuario_TB.id_usuario%TYPE,
    P_primer_nombre IN G8admin.FIDE_usuario_TB.primer_nombre%TYPE,
    P_apellido IN G8admin.FIDE_usuario_TB.apellido%TYPE,
    P_username IN G8admin.FIDE_usuario_TB.username%TYPE,
    P_contraseña IN G8admin.FIDE_usuario_TB.contraseña%TYPE,
    P_email IN G8admin.FIDE_usuario_TB.email%TYPE,
    P_id_rol IN G8admin.FIDE_usuario_TB.id_rol%TYPE,
    P_nacionalidad IN G8admin.FIDE_usuario_TB.nacionalidad%TYPE,
    P_ruta_imagen IN G8admin.FIDE_usuario_TB.ruta_imagen%TYPE
);


PROCEDURE contenedor_insertar_SP(
    P_peso_neto IN G8admin.FIDE_contenedor_TB.peso_neto%TYPE,
    P_estado_contenedor IN G8admin.FIDE_contenedor_TB.estado_contenedor%TYPE,
    P_peso_maximo IN G8admin.FIDE_contenedor_TB.peso_maximo%TYPE,
    P_valor_neto IN G8admin.FIDE_contenedor_TB.valor_neto%TYPE,
    P_id_buque IN G8admin.FIDE_contenedor_TB.id_buque%TYPE,
    P_id_producto IN G8admin.FIDE_contenedor_TB.id_producto%TYPE,
    P_id_almacen IN G8admin.FIDE_contenedor_TB.id_almacen%TYPE
);

PROCEDURE contenedor_eliminar_SP(
    P_id_contenedor IN G8admin.FIDE_contenedor_TB.id_contenedor%TYPE
);

PROCEDURE contenedor_actualizar_SP(
    P_id_contenedor IN G8admin.FIDE_contenedor_TB.id_contenedor%TYPE,
    P_peso_neto IN G8admin.FIDE_contenedor_TB.peso_neto%TYPE,
    P_estado_contenedor IN G8admin.FIDE_contenedor_TB.estado_contenedor%TYPE,
    P_peso_maximo IN G8admin.FIDE_contenedor_TB.peso_maximo%TYPE,
    P_valor_neto IN G8admin.FIDE_contenedor_TB.valor_neto%TYPE,
    P_id_buque IN G8admin.FIDE_contenedor_TB.id_buque%TYPE,
    P_id_producto IN G8admin.FIDE_contenedor_TB.id_producto%TYPE,
    P_id_almacen IN G8admin.FIDE_contenedor_TB.id_almacen%TYPE
);

PROCEDURE contenedor_producto_insertar_SP(
    P_id_contenedor IN G8admin.FIDE_contenedor_producto_TB.id_contenedor%TYPE,
    P_id_producto IN G8admin.FIDE_contenedor_producto_TB.id_producto%TYPE,
    P_cantidad_producto IN G8admin.FIDE_contenedor_producto_TB.cantidad_producto%TYPE
);


PROCEDURE contenedor_producto_eliminar_SP(
    P_id_contenedor IN G8admin.FIDE_contenedor_producto_TB.id_contenedor%TYPE,
    P_id_producto IN G8admin.FIDE_contenedor_producto_TB.id_producto%TYPE
);

PROCEDURE contenedor_producto_actualizar_SP(
    P_id_contenedor IN G8admin.FIDE_contenedor_producto_TB.id_contenedor%TYPE,
    P_id_producto IN G8admin.FIDE_contenedor_producto_TB.id_producto%TYPE,
    P_cantidad_producto IN G8admin.FIDE_contenedor_producto_TB.cantidad_producto%TYPE
);

--Funciones
FUNCTION FIDE_buque_TB_buscar_estado_FN(
    P_id_buque IN G8admin.FIDE_buque_TB.id_buque%TYPE

)RETURN G8admin.FIDE_buque_TB.estado_buque%TYPE; 


FUNCTION FIDE_capitan_TB_calcular_edad_FN(
    P_id_capitan IN G8admin.FIDE_capitan_TB.id_capitan%TYPE

)RETURN number;

FUNCTION FIDE_producto_TB_calcular_iva_FN(
    P_precio IN G8admin.FIDE_producto_TB.precio%TYPE,
    P_impuesto IN number
)RETURN number;

FUNCTION FIDE_buque_TB_calcular_peso_FN(
    P_id_buque IN G8admin.FIDE_buque_TB.id_buque%TYPE
    
)RETURN number;

FUNCTION FIDE_contenedor_producto_TB_cantidad_producto_FN(
    P_ID_CONTENEDOR_PRODUCTO IN G8admin.FIDE_contenedor_producto_TB.ID_CONTENEDOR_PRODUCTO%TYPE
 
)RETURN number;

 FUNCTION FIDE_capitan_TB_calcular_experiencia_FN(
    P_id_capitan IN G8admin.FIDE_capitan_TB.id_capitan%TYPE

)RETURN number;

FUNCTION FIDE_usuario_TB_ver_region_usuarios_FN(
    P_nacionalidad IN G8admin.FIDE_usuario_TB.nacionalidad%TYPE
    
)RETURN number;


FUNCTION FIDE_inventario_TB_cantidad_producto_FN(
    P_id_inventario IN G8admin.FIDE_inventario_TB.id_inventario%TYPE
    
)RETURN number;
--TERMINAE EL PAQUETE
END FIDE_PROCEDIMIENTOS_FUNCIONES_PKG;

--drop package FIDE_PROCEDIMIENTOS_FUNCIONES_PKG;


-- Autor: Josué García Rojas
-- Fecha: 23/8/24
--creacion del cuerpo del paquete
--------------------------------------------PROCEDIMIENTOS ALMACENADOS DE PRODUCTO--------------------------------------------------------------------------------------------------


-- Autor: Josué García Rojas
-- Fecha: 25/07/2024
-- Insertar producto
create or replace PACKAGE BODY FIDE_PROCEDIMIENTOS_FUNCIONES_PKG AS

 PROCEDURE Insertar_producto_SP(
    p_id_categoria IN G8admin.FIDE_producto_TB.id_categoria%TYPE,
    p_descripcion IN G8admin.FIDE_producto_TB.descripcion%TYPE,
    p_precio IN G8admin.FIDE_producto_TB.precio%TYPE,
    p_id_detalle IN G8admin.FIDE_producto_TB.id_detalle%TYPE,
    p_ruta_imagen IN G8admin.FIDE_producto_TB.ruta_imagen%TYPE
)
IS
BEGIN
    INSERT INTO G8admin.FIDE_producto_TB(id_categoria, descripcion, precio, id_detalle, ruta_imagen)
    VALUES (p_id_categoria, p_descripcion, p_precio, p_id_detalle, p_ruta_imagen);

    DBMS_OUTPUT.PUT_LINE('Producto agregado exitosamente');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END Insertar_producto_SP;



-- Autor: Josué García Rojas
-- Fecha: 25/07/2024
-- Eliminacion de producto
 PROCEDURE Eliminar_Producto_SP(
p_id_producto IN number
)
IS
BEGIN
    DELETE FROM G8admin.FIDE_producto_TB
    WHERE id_producto = p_id_producto;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar informacion');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END Eliminar_Producto_SP;



-- Autor: Josué García Rojas
-- Fecha: 25/07/2024
-- Actulizar producto
 PROCEDURE Actualizar_Producto_SP(
P_id_producto IN G8admin.FIDE_producto_TB.id_producto%TYPE,
P_descripcion IN G8admin.FIDE_producto_TB.descripcion%TYPE,
P_precio IN G8admin.FIDE_producto_TB.precio%TYPE,
P_ruta_imagen IN G8admin.FIDE_producto_TB.ruta_imagen%TYPE
)
IS
BEGIN
    UPDATE G8admin.FIDE_producto_TB
    SET descripcion = P_descripcion,  precio = P_precio, ruta_imagen =P_ruta_imagen
    WHERE id_producto = P_id_producto;  
     DBMS_OUTPUT.PUT_LINE('Actualizacion exitosa de producto cambiada');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar informacion');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END Actualizar_Producto_SP;



-------------------------PROCEDIMIENTOS ALMACENADOS DE CATEGORIA CRUD-------------------------------------------


-- Autor: Luis David
-- Fecha: 25/07/2024
-- crear categoria
 PROCEDURE categoria_insertar_SP(
  P_nombre_categoria IN G8admin.FIDE_categoria_TB.nombre_categoria%TYPE
)
IS
BEGIN
   INSERT INTO G8admin.FIDE_categoria_TB(nombre_categoria) 
   VALUES(P_nombre_categoria); 
   
   DBMS_OUTPUT.PUT_LINE('Creación exitosa: ' || P_nombre_categoria);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar información');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END categoria_insertar_SP;

-- Autor: Luis David
-- Fecha: 25/07/2024
-- Eliminacion de categoria
 PROCEDURE categoria_eliminar_SP(
P_id_categoria IN number
)
IS
BEGIN
    UPDATE G8admin.FIDE_categoria_TB
    SET Estado = 'Inactivo'
    WHERE id_categoria = P_id_categoria;

    DBMS_OUTPUT.PUT_LINE('Categoría eliminada exitosamente');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar informacion');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END  categoria_eliminar_SP;



-- Autor: Luis David
-- Fecha: 25/07/2024
-- actualiza categoria
 PROCEDURE categoria_actualizar_nombre_SP(
P_nombre_categoria IN G8admin.FIDE_categoria_TB.nombre_categoria%TYPE,
P_id_categoria IN G8admin.FIDE_categoria_TB.id_categoria%TYPE
)
IS
BEGIN
    UPDATE G8admin.FIDE_categoria_TB
    SET nombre_categoria = P_nombre_categoria
    WHERE id_categoria = P_id_categoria;  
     DBMS_OUTPUT.PUT_LINE('Actualizacion exitosa categoria cambiada a:' || P_nombre_categoria);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar informacion');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END categoria_actualizar_nombre_SP;


-------------------------PROCEDIMIENTOS ALMACENADOS DE DETALLE CRUD-------------------------------------------

-- Autor: Luis David
-- Fecha: 25/07/2024
-- crear detalle
 PROCEDURE detalle_insertar_SP(
P_color IN G8admin.FIDE_detalle_TB.color%TYPE,
P_tamaño IN G8admin.FIDE_detalle_TB.tamaño%TYPE
)
IS
BEGIN
   INSERT 
   INTO G8admin.FIDE_detalle_TB(color,tamaño) VALUES(P_color,P_tamaño); 
   
     DBMS_OUTPUT.PUT_LINE('creacion  exitosa');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar informacion');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END detalle_insertar_SP;


-- Autor: Luis David
-- Fecha: 25/07/2024
-- Eliminacion de detalle
 PROCEDURE detalle_eliminar_SP(
P_id_detalle IN number
)
IS
BEGIN
    UPDATE G8admin.FIDE_detalle_TB
    SET Estado = 'Inactivo'
    WHERE id_detalle = P_id_detalle;

    DBMS_OUTPUT.PUT_LINE('Detalle eliminado exitosamente');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar informacion');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END detalle_eliminar_SP;


-- Autor: Luis David
-- Fecha: 25/07/2024
-- actualiza detalle
 PROCEDURE detalle_actualizar_SP(
P_id_detalle IN G8admin.FIDE_detalle_TB.id_detalle%TYPE,
P_color IN G8admin.FIDE_detalle_TB.color%TYPE,
P_tamaño IN G8admin.FIDE_detalle_TB.tamaño%TYPE
)
IS
BEGIN
    UPDATE G8admin.FIDE_detalle_TB
    SET color = P_color,
    tamaño = P_tamaño
    WHERE id_detalle = P_id_detalle;  
     DBMS_OUTPUT.PUT_LINE('Actualizacion exitosa ');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar informacion');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END detalle_actualizar_SP;



-------------------------PROCEDIMIENTOS ALMACENADOS DE PAIS CRUD-------------------------------------------

-- Autor: Josué García Rojas
-- Fecha: 11/08/2024
-- Crear pais
 PROCEDURE pais_insertar_SP(
P_nombre_pais IN G8admin.FIDE_pais_TB.NOMBRE_PAIS%TYPE
)
IS
BEGIN
   INSERT 
   INTO G8admin.FIDE_pais_TB(NOMBRE_PAIS) VALUES(P_nombre_pais); 
   
     DBMS_OUTPUT.PUT_LINE('creacion exitosa');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar informacion');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END pais_insertar_SP;


-- Autor: Josué García Rojas
-- Fecha: 11/08/2024
-- Eliminar paises
 PROCEDURE pais_eliminar_SP(
P_id_pais IN number
)
IS
BEGIN
    UPDATE G8admin.FIDE_pais_TB
    SET Estado = 'Inactivo'
    WHERE id_pais = P_id_pais;

    DBMS_OUTPUT.PUT_LINE('Pais eliminado exitosamente');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar informacion');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END pais_eliminar_SP;


-- Autor: Josué García Rojas
-- Fecha: 11/08/2024
-- Actualizar paises
 PROCEDURE pais_actualizar_SP(
P_id_pais IN G8admin.FIDE_pais_TB.id_pais%TYPE,
P_nombre_pais IN G8admin.FIDE_pais_TB.NOMBRE_PAIS%TYPE
)
IS
BEGIN
    UPDATE G8admin.FIDE_pais_TB
    SET NOMBRE_PAIS = P_nombre_pais
    WHERE id_pais = P_id_pais;  
     DBMS_OUTPUT.PUT_LINE('Actualizacion exitosa ');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar informacion');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END pais_actualizar_SP;


-------------------------PROCEDIMIENTOS ALMACENADOS DE ROL CRUD-------------------------------------------

-- Autor: Josué García Rojas
-- Fecha: 11/08/2024
-- Crear roles
 PROCEDURE rol_insertar_SP(
P_nombre_rol IN G8admin.FIDE_rol_TB.NOMBRE_rol%TYPE
)
IS
BEGIN
   INSERT 
   INTO G8admin.FIDE_rol_TB(NOMBRE_rol) VALUES(P_nombre_rol); 
   
     DBMS_OUTPUT.PUT_LINE('creacion exitosa');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar informacion');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END rol_insertar_SP;


-- Autor: Josué García Rojas
-- Fecha: 11/08/2024
-- Eliminar roles
 PROCEDURE roles_eliminar_SP(
P_id_rol IN number
)
IS
BEGIN
    UPDATE G8admin.FIDE_rol_TB
    SET Estado = 'Inactivo'
    WHERE id_rol = P_id_rol;

    DBMS_OUTPUT.PUT_LINE('Rol eliminado exitosamente');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar informacion');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END roles_eliminar_SP;


-- Autor: Josué García Rojas
-- Fecha: 11/08/2024
-- Actualizar roles
 PROCEDURE rol_actualizar_SP(
P_id_rol IN G8admin.FIDE_rol_TB.id_rol%TYPE,
P_nombre_rol IN G8admin.FIDE_rol_TB.NOMBRE_rol%TYPE
)
IS
BEGIN
    UPDATE G8admin.FIDE_rol_TB
    SET NOMBRE_rol = P_nombre_rol
    WHERE id_rol = P_id_rol;  
     DBMS_OUTPUT.PUT_LINE('Actualizacion exitosa ');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar informacion');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END rol_actualizar_SP;




-------------------------PROCEDIMIENTOS ALMACENADOS DE CAPITAN CRUD-------------------------------------------


-- Autor: Josué García Rojas
-- Fecha: 11/08/2024
-- Crear capitanes
PROCEDURE capitan_insertar_SP(
    P_nombre_capitan IN G8admin.FIDE_capitan_TB.nombre_capitan%TYPE,
    P_edad_capitan IN G8admin.FIDE_capitan_TB.edad_capitan%TYPE,
    P_fecha_nacimiento IN G8admin.FIDE_capitan_TB.fecha_nacimiento%TYPE,
    P_años_experiencia IN G8admin.FIDE_capitan_TB.años_experiencia%TYPE,
    P_fecha_inicio_cargo IN G8admin.FIDE_capitan_TB.fecha_inicio_cargo%TYPE,
    P_id_pais IN G8admin.FIDE_capitan_TB.id_pais%TYPE
)
IS
BEGIN
   INSERT INTO G8admin.FIDE_capitan_TB(nombre_capitan, edad_capitan, fecha_nacimiento, años_experiencia, fecha_inicio_cargo, id_pais, Estado)
   VALUES(P_nombre_capitan, P_edad_capitan, P_fecha_nacimiento, P_años_experiencia, P_fecha_inicio_cargo, P_id_pais, 'Activo');
   
   DBMS_OUTPUT.PUT_LINE('Capitán agregado exitosamente');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar información');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END capitan_insertar_SP;


-- Autor: Josué García Rojas
-- Fecha: 11/08/2024
-- Eliminar capitanes
PROCEDURE capitan_eliminar_SP(
    P_id_capitan IN number
)
IS
BEGIN
    UPDATE G8admin.FIDE_capitan_TB
    SET Estado = 'Inactivo'
    WHERE id_capitan = P_id_capitan;

    DBMS_OUTPUT.PUT_LINE('Capitán eliminado exitosamente');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar información');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END capitan_eliminar_SP;


-- Autor: Josué García Rojas
-- Fecha: 11/08/2024
-- Actualizar capitanes
 PROCEDURE capitan_actualizar_SP(
    P_id_capitan IN G8admin.FIDE_capitan_TB.id_capitan%TYPE,
    P_nombre_capitan IN G8admin.FIDE_capitan_TB.nombre_capitan%TYPE,
    P_edad_capitan IN G8admin.FIDE_capitan_TB.edad_capitan%TYPE,
    P_fecha_nacimiento IN G8admin.FIDE_capitan_TB.fecha_nacimiento%TYPE,
    P_años_experiencia IN G8admin.FIDE_capitan_TB.años_experiencia%TYPE,
    P_fecha_inicio_cargo IN G8admin.FIDE_capitan_TB.fecha_inicio_cargo%TYPE,
    P_id_pais IN G8admin.FIDE_capitan_TB.id_pais%TYPE
)
IS
BEGIN
    UPDATE G8admin.FIDE_capitan_TB
    SET nombre_capitan = P_nombre_capitan,
        edad_capitan = P_edad_capitan,
        fecha_nacimiento = P_fecha_nacimiento,
        años_experiencia = P_años_experiencia,
        fecha_inicio_cargo = P_fecha_inicio_cargo,
        id_pais = P_id_pais
    WHERE id_capitan = P_id_capitan;
    
    DBMS_OUTPUT.PUT_LINE('Capitán actualizado exitosamente');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar información');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END capitan_actualizar_SP;



-------------------------PROCEDIMIENTOS ALMACENADOS DE BUQUE CRUD-------------------------------------------


-- Autor: Josué García Rojas
-- Fecha: 11/08/2024
-- Crear buque
PROCEDURE buque_insertar_SP(
    P_nombre_barco IN G8admin.FIDE_buque_TB.nombre_barco%TYPE,
    P_estado_buque IN G8admin.FIDE_buque_TB.estado_buque%TYPE,
    P_capacidad_maxima IN G8admin.FIDE_buque_TB.capacidad_maxima%TYPE,
    P_id_empleado IN G8admin.FIDE_buque_TB.id_empleado%TYPE,
    P_id_capitan IN G8admin.FIDE_buque_TB.id_capitan%TYPE
)
IS
BEGIN
   INSERT INTO G8admin.FIDE_buque_TB(nombre_barco, estado_buque, capacidad_maxima, id_empleado, id_capitan)
   VALUES(P_nombre_barco, P_estado_buque, P_capacidad_maxima, P_id_empleado, P_id_capitan);

   DBMS_OUTPUT.PUT_LINE('Creación de buque exitosa');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar información');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END buque_insertar_SP;



-- Autor: Josué García Rojas
-- Fecha: 11/08/2024
-- Eliminar buque
 PROCEDURE buque_eliminar_SP(
    P_id_buque IN G8admin.FIDE_buque_TB.id_buque%TYPE
)
IS
BEGIN
    UPDATE G8admin.FIDE_buque_TB
    SET Estado = 'Inactivo'
    WHERE id_buque = P_id_buque;

    DBMS_OUTPUT.PUT_LINE('Buque eliminado exitosamente');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar información');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END  buque_eliminar_SP;


-- Autor: Josué García Rojas
-- Fecha: 11/08/2024
-- Actualizar buque
 PROCEDURE buque_actualizar_SP(
    P_id_buque IN G8admin.FIDE_buque_TB.id_buque%TYPE,
    P_nombre_barco IN G8admin.FIDE_buque_TB.nombre_barco%TYPE,
    P_estado_buque IN G8admin.FIDE_buque_TB.estado_buque%TYPE,
    P_capacidad_maxima IN G8admin.FIDE_buque_TB.capacidad_maxima%TYPE,
    P_id_empleado IN G8admin.FIDE_buque_TB.id_empleado%TYPE,
    P_id_capitan IN G8admin.FIDE_buque_TB.id_capitan%TYPE
)
IS
BEGIN
    UPDATE G8admin.FIDE_buque_TB
    SET nombre_barco = P_nombre_barco,
        estado_buque = P_estado_buque,
        capacidad_maxima = P_capacidad_maxima,
        id_empleado = P_id_empleado,
        id_capitan = P_id_capitan
    WHERE id_buque = P_id_buque;

    DBMS_OUTPUT.PUT_LINE('Actualización de buque exitosa');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar información');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END buque_actualizar_SP;




-------------------------PROCEDIMIENTOS ALMACENADOS DE EMPLEADO CRUD-------------------------------------------


-- Autor: Josué García Rojas
-- Fecha: 12/08/2024
-- Crear empleado
 PROCEDURE empleado_insertar_SP(
    P_nombre IN G8admin.FIDE_empleado_TB.nombre%TYPE
)
IS
BEGIN
   INSERT INTO G8admin.FIDE_empleado_TB(nombre)
   VALUES(P_nombre);

   DBMS_OUTPUT.PUT_LINE('Creación de empleado exitosa');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar información');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END empleado_insertar_SP;



-- Autor: Josué García Rojas
-- Fecha: 12/08/2024
-- Eliminar empleado
 PROCEDURE empleado_eliminar_SP(
    P_id_empleado IN G8admin.FIDE_empleado_TB.id_empleado%TYPE
)
IS
BEGIN
    UPDATE G8admin.FIDE_empleado_TB
    SET Estado = 'Inactivo'
    WHERE id_empleado = P_id_empleado;

    DBMS_OUTPUT.PUT_LINE('Empleado eliminado exitosamente');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar información');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END empleado_eliminar_SP;



-- Autor: Josué García Rojas
-- Fecha: 12/08/2024
-- Actualizar empleado
 PROCEDURE empleado_actualizar_SP(
    P_id_empleado IN G8admin.FIDE_empleado_TB.id_empleado%TYPE,
    P_nombre IN G8admin.FIDE_empleado_TB.nombre%TYPE
)
IS
BEGIN
    UPDATE G8admin.FIDE_empleado_TB
    SET nombre = P_nombre
    WHERE id_empleado = P_id_empleado;

    DBMS_OUTPUT.PUT_LINE('Actualización de empleado exitosa');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar información');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END empleado_actualizar_SP;


-------------------------PROCEDIMIENTOS ALMACENADOS DE ALMACÉN CRUD-------------------------------------------

-- Autor: Josué García Rojas
-- Fecha: 12/08/2024
-- Crear almacén
 PROCEDURE almacen_insertar_SP(
    P_tipo_almacen IN G8admin.FIDE_almacen_TB.tipo_almacen%TYPE
)
IS
BEGIN
   INSERT INTO G8admin.FIDE_almacen_TB(tipo_almacen)
   VALUES(P_tipo_almacen); 
   
   DBMS_OUTPUT.PUT_LINE('Creación de almacén exitosa');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar información');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END almacen_insertar_SP;


-- Autor: Josué García Rojas
-- Fecha: 12/08/2024
-- Eliminación de almacén
 PROCEDURE almacen_eliminar_SP(
    P_id_almacen IN number
)
IS
BEGIN
    UPDATE G8admin.FIDE_almacen_TB
    SET Estado = 'Inactivo'
    WHERE id_almacen = P_id_almacen;

    DBMS_OUTPUT.PUT_LINE('Almacén eliminado exitosamente');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar información');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END almacen_eliminar_SP;


-- Autor: Josué García Rojas
-- Fecha: 12/08/2024
-- Actualizar almacén
 PROCEDURE almacen_actualizar_SP(
    P_id_almacen IN G8admin.FIDE_almacen_TB.id_almacen%TYPE,
    P_tipo_almacen IN G8admin.FIDE_almacen_TB.tipo_almacen%TYPE
)
IS
BEGIN
    UPDATE G8admin.FIDE_almacen_TB
    SET tipo_almacen = P_tipo_almacen
    WHERE id_almacen = P_id_almacen;

    DBMS_OUTPUT.PUT_LINE('Actualización de almacén exitosa');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar información');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END almacen_actualizar_SP;


-------------------------PROCEDIMIENTOS ALMACENADOS DE INVENTARIO CRUD-------------------------------------------

-- Autor: Josué García Rojas
-- Fecha: 12/08/2024
-- Crear inventario
 PROCEDURE inventario_insertar_SP(
    P_ubicacion IN G8admin.FIDE_inventario_TB.ubicacion%TYPE,
    P_cantidad IN G8admin.FIDE_inventario_TB.cantidad%TYPE,
    P_id_producto IN G8admin.FIDE_inventario_TB.id_producto%TYPE
)
IS
BEGIN
   INSERT INTO G8admin.FIDE_inventario_TB(ubicacion, cantidad, id_producto)
   VALUES(P_ubicacion, P_cantidad, P_id_producto); 
   
   DBMS_OUTPUT.PUT_LINE('Creación de inventario exitosa');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar información');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END inventario_insertar_SP;


-- Autor: Josué García Rojas
-- Fecha: 12/08/2024
-- Eliminación de inventario
 PROCEDURE inventario_eliminar_SP(
    P_id_inventario IN number
)
IS
BEGIN
    UPDATE G8admin.FIDE_inventario_TB
    SET Estado = 'Inactivo'
    WHERE id_inventario = P_id_inventario;

    DBMS_OUTPUT.PUT_LINE('Inventario eliminado exitosamente');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar información');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END inventario_eliminar_SP;


-- Autor: Josué García Rojas
-- Fecha: 12/08/2024
-- Actualizar inventario
 PROCEDURE inventario_actualizar_SP(
    P_id_inventario IN G8admin.FIDE_inventario_TB.id_inventario%TYPE,
    P_ubicacion IN G8admin.FIDE_inventario_TB.ubicacion%TYPE,
    P_cantidad IN G8admin.FIDE_inventario_TB.cantidad%TYPE,
    P_id_producto IN G8admin.FIDE_inventario_TB.id_producto%TYPE
)
IS
BEGIN
    UPDATE G8admin.FIDE_inventario_TB
    SET ubicacion = P_ubicacion,
        cantidad = P_cantidad,
        id_producto = P_id_producto
    WHERE id_inventario = P_id_inventario;

    DBMS_OUTPUT.PUT_LINE('Actualización de inventario exitosa');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar información');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END inventario_actualizar_SP;


-------------------------PROCEDIMIENTOS ALMACENADOS DE DESTINO CRUD-------------------------------------------


-- Autor: Josué García Rojas
-- Fecha: 12/08/2024
-- Crear destino
 PROCEDURE destino_insertar_SP(
    P_nombre_puerto IN G8admin.FIDE_destino_TB.nombre_puerto%TYPE,
    P_fecha_partida IN G8admin.FIDE_destino_TB.fecha_partida%TYPE,
    P_fecha_llegada IN G8admin.FIDE_destino_TB.fecha_llegada%TYPE,
    P_ubicacion IN G8admin.FIDE_destino_TB.ubicacion%TYPE,
    P_id_pais IN G8admin.FIDE_destino_TB.id_pais%TYPE,
    P_id_buque IN G8admin.FIDE_destino_TB.id_buque%TYPE
)
IS
BEGIN
   INSERT INTO G8admin.FIDE_destino_TB(nombre_puerto, fecha_partida, fecha_llegada, ubicacion, id_pais, id_buque)
   VALUES(P_nombre_puerto, P_fecha_partida, P_fecha_llegada, P_ubicacion, P_id_pais, P_id_buque); 
   
   DBMS_OUTPUT.PUT_LINE('Creación de destino exitosa');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar información');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END destino_insertar_SP;


-- Autor: Josué García Rojas
-- Fecha: 12/08/2024
-- Eliminación de destino
 PROCEDURE destino_eliminar_SP(
    P_id_destino IN G8admin.FIDE_destino_TB.id_destino%TYPE
)
IS
BEGIN
    UPDATE G8admin.FIDE_destino_TB
    SET Estado = 'Inactivo'
    WHERE id_destino = P_id_destino;

    DBMS_OUTPUT.PUT_LINE('Destino eliminado exitosamente');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar información');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END destino_eliminar_SP;


-- Autor: Josué García Rojas
-- Fecha: 12/08/2024
-- Actualizar destino
 PROCEDURE destino_actualizar_SP(
    P_id_destino IN G8admin.FIDE_destino_TB.id_destino%TYPE,
    P_nombre_puerto IN G8admin.FIDE_destino_TB.nombre_puerto%TYPE,
    P_fecha_partida IN G8admin.FIDE_destino_TB.fecha_partida%TYPE,
    P_fecha_llegada IN G8admin.FIDE_destino_TB.fecha_llegada%TYPE,
    P_ubicacion IN G8admin.FIDE_destino_TB.ubicacion%TYPE,
    P_id_pais IN G8admin.FIDE_destino_TB.id_pais%TYPE,
    P_id_buque IN G8admin.FIDE_destino_TB.id_buque%TYPE
)
IS
BEGIN
    UPDATE G8admin.FIDE_destino_TB
    SET nombre_puerto = P_nombre_puerto,
        fecha_partida = P_fecha_partida,
        fecha_llegada = P_fecha_llegada,
        ubicacion = P_ubicacion,
        id_pais = P_id_pais,
        id_buque = P_id_buque
    WHERE id_destino = P_id_destino;

    DBMS_OUTPUT.PUT_LINE('Actualización de destino exitosa');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar información');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END destino_actualizar_SP;


-------------------------PROCEDIMIENTOS ALMACENADOS DE USUARIO CRUD-------------------------------------------



-- Autor: Josué García Rojas
-- Fecha: 12/08/2024
-- Crear usuario
 PROCEDURE usuario_insertar_SP(
    P_primer_nombre IN G8admin.FIDE_usuario_TB.primer_nombre%TYPE,
    P_apellido IN G8admin.FIDE_usuario_TB.apellido%TYPE,
    P_username IN G8admin.FIDE_usuario_TB.username%TYPE,
    P_contraseña IN G8admin.FIDE_usuario_TB.contraseña%TYPE,
    P_email IN G8admin.FIDE_usuario_TB.email%TYPE,
    P_id_rol IN G8admin.FIDE_usuario_TB.id_rol%TYPE,
    P_nacionalidad IN G8admin.FIDE_usuario_TB.nacionalidad%TYPE,
    P_ruta_imagen IN G8admin.FIDE_usuario_TB.ruta_imagen%TYPE
)
IS
BEGIN
   INSERT INTO G8admin.FIDE_usuario_TB(
       primer_nombre, apellido, username, contraseña, email, id_rol, nacionalidad, ruta_imagen)
   VALUES(
       P_primer_nombre, P_apellido, P_username, P_contraseña, P_email, P_id_rol, P_nacionalidad, P_ruta_imagen); 
   
   DBMS_OUTPUT.PUT_LINE('Creación de usuario exitosa');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar información');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END usuario_insertar_SP;


-- Autor: Josué García Rojas
-- Fecha: 12/08/2024
-- Eliminación de usuario
 PROCEDURE usuario_eliminar_SP(
    P_id_usuario IN G8admin.FIDE_usuario_TB.id_usuario%TYPE
)
IS
BEGIN
    UPDATE G8admin.FIDE_usuario_TB
    SET Estado = 'Inactivo'
    WHERE id_usuario = P_id_usuario;

    DBMS_OUTPUT.PUT_LINE('Usuario eliminado exitosamente');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar información');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END usuario_eliminar_SP;

    
-- Autor: Josué García Rojas
-- Fecha: 12/08/2024
-- Actualizar usuario
 PROCEDURE usuario_actualizar_SP(
    P_id_usuario IN G8admin.FIDE_usuario_TB.id_usuario%TYPE,
    P_primer_nombre IN G8admin.FIDE_usuario_TB.primer_nombre%TYPE,
    P_apellido IN G8admin.FIDE_usuario_TB.apellido%TYPE,
    P_username IN G8admin.FIDE_usuario_TB.username%TYPE,
    P_contraseña IN G8admin.FIDE_usuario_TB.contraseña%TYPE,
    P_email IN G8admin.FIDE_usuario_TB.email%TYPE,
    P_id_rol IN G8admin.FIDE_usuario_TB.id_rol%TYPE,
    P_nacionalidad IN G8admin.FIDE_usuario_TB.nacionalidad%TYPE,
    P_ruta_imagen IN G8admin.FIDE_usuario_TB.ruta_imagen%TYPE
)
IS
BEGIN
    UPDATE G8admin.FIDE_usuario_TB
    SET primer_nombre = P_primer_nombre,
        apellido = P_apellido,
        username = P_username,
        contraseña = P_contraseña,
        email = P_email,
        id_rol = P_id_rol,
        nacionalidad = P_nacionalidad,
        ruta_imagen = P_ruta_imagen
    WHERE id_usuario = P_id_usuario;

    DBMS_OUTPUT.PUT_LINE('Actualización de usuario exitosa');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar información');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END usuario_actualizar_SP;



-------------------------PROCEDIMIENTOS ALMACENADOS DE CONTENEDOR CRUD-------------------------------------------


-- Autor: Josué García Rojas
-- Fecha: 13/08/2024
-- Crear contenedor
 PROCEDURE contenedor_insertar_SP(
    P_peso_neto IN G8admin.FIDE_contenedor_TB.peso_neto%TYPE,
    P_estado_contenedor IN G8admin.FIDE_contenedor_TB.estado_contenedor%TYPE,
    P_peso_maximo IN G8admin.FIDE_contenedor_TB.peso_maximo%TYPE,
    P_valor_neto IN G8admin.FIDE_contenedor_TB.valor_neto%TYPE,
    P_id_buque IN G8admin.FIDE_contenedor_TB.id_buque%TYPE,
    P_id_producto IN G8admin.FIDE_contenedor_TB.id_producto%TYPE,
    P_id_almacen IN G8admin.FIDE_contenedor_TB.id_almacen%TYPE
)
IS
BEGIN
   INSERT INTO G8admin.FIDE_contenedor_TB(peso_neto, estado_contenedor, peso_maximo, valor_neto, id_buque, id_producto, id_almacen)
   VALUES(P_peso_neto, P_estado_contenedor, P_peso_maximo, P_valor_neto, P_id_buque, P_id_producto, P_id_almacen);
   
   DBMS_OUTPUT.PUT_LINE('Creación de contenedor exitosa');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar información');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END contenedor_insertar_SP;


-- Autor: Josué García Rojas
-- Fecha: 13/08/2024
-- Eliminación de contenedor
 PROCEDURE contenedor_eliminar_SP(
    P_id_contenedor IN G8admin.FIDE_contenedor_TB.id_contenedor%TYPE
)
IS
BEGIN
    UPDATE G8admin.FIDE_contenedor_TB
    SET Estado = 'Inactivo'
    WHERE id_contenedor = P_id_contenedor;

    DBMS_OUTPUT.PUT_LINE('Contenedor eliminado exitosamente');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar información');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END contenedor_eliminar_SP;


-- Autor: Josué García Rojas
-- Fecha: 13/08/2024
-- Actualizar contenedor
 PROCEDURE contenedor_actualizar_SP(
    P_id_contenedor IN G8admin.FIDE_contenedor_TB.id_contenedor%TYPE,
    P_peso_neto IN G8admin.FIDE_contenedor_TB.peso_neto%TYPE,
    P_estado_contenedor IN G8admin.FIDE_contenedor_TB.estado_contenedor%TYPE,
    P_peso_maximo IN G8admin.FIDE_contenedor_TB.peso_maximo%TYPE,
    P_valor_neto IN G8admin.FIDE_contenedor_TB.valor_neto%TYPE,
    P_id_buque IN G8admin.FIDE_contenedor_TB.id_buque%TYPE,
    P_id_producto IN G8admin.FIDE_contenedor_TB.id_producto%TYPE,
    P_id_almacen IN G8admin.FIDE_contenedor_TB.id_almacen%TYPE
)
IS
BEGIN
    UPDATE G8admin.FIDE_contenedor_TB
    SET peso_neto = P_peso_neto,
        estado_contenedor = P_estado_contenedor,
        peso_maximo = P_peso_maximo,
        valor_neto = P_valor_neto,
        id_buque = P_id_buque,
        id_producto = P_id_producto,
        id_almacen = P_id_almacen
    WHERE id_contenedor = P_id_contenedor;

    DBMS_OUTPUT.PUT_LINE('Actualización de contenedor exitosa');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar información');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END contenedor_actualizar_SP;






-------------------------PROCEDIMIENTOS ALMACENADOS DE CONTENEDOR PRODUCTO CRUD-------------------------------------------



-- Autor: Josué García Rojas
-- Fecha: 13/08/2024
-- Crear contenedor producto
 PROCEDURE contenedor_producto_insertar_SP(
    P_id_contenedor IN G8admin.FIDE_contenedor_producto_TB.id_contenedor%TYPE,
    P_id_producto IN G8admin.FIDE_contenedor_producto_TB.id_producto%TYPE,
    P_cantidad_producto IN G8admin.FIDE_contenedor_producto_TB.cantidad_producto%TYPE
)
IS
BEGIN
   INSERT INTO G8admin.FIDE_contenedor_producto_TB(id_contenedor, id_producto, cantidad_producto)
   VALUES(P_id_contenedor, P_id_producto, P_cantidad_producto);
   
   DBMS_OUTPUT.PUT_LINE('Inserción de contenedor producto fue exitosa');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar información');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END contenedor_producto_insertar_SP;


-- Autor: Josué García Rojas
-- Fecha: 13/08/2024
-- Eliminar contenedor producto
 PROCEDURE contenedor_producto_eliminar_SP(
    P_id_contenedor IN G8admin.FIDE_contenedor_producto_TB.id_contenedor%TYPE,
    P_id_producto IN G8admin.FIDE_contenedor_producto_TB.id_producto%TYPE
)
IS
BEGIN
    UPDATE G8admin.FIDE_contenedor_producto_TB
    SET Estado = 'Inactivo'
    WHERE id_contenedor = P_id_contenedor
    AND id_producto = P_id_producto;

    DBMS_OUTPUT.PUT_LINE('Eliminación de contenedor-producto exitosa');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar información');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END contenedor_producto_eliminar_SP;


-- Autor: Josué García Rojas
-- Fecha: 13/08/2024
-- Actualizar contenedor producto
 PROCEDURE contenedor_producto_actualizar_SP(
    P_id_contenedor IN G8admin.FIDE_contenedor_producto_TB.id_contenedor%TYPE,
    P_id_producto IN G8admin.FIDE_contenedor_producto_TB.id_producto%TYPE,
    P_cantidad_producto IN G8admin.FIDE_contenedor_producto_TB.cantidad_producto%TYPE
)
IS
BEGIN
    UPDATE G8admin.FIDE_contenedor_producto_TB
    SET cantidad_producto = P_cantidad_producto
    WHERE id_contenedor = P_id_contenedor
    AND id_producto = P_id_producto;

    DBMS_OUTPUT.PUT_LINE('Actualización de contenedor-producto exitosa');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No se pudo encontrar información');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END contenedor_producto_actualizar_SP;

---------------------------FUNCIONES---------------------------------------------

    
 -- Autor: Luis David
-- Fecha: 25/07/2024
-- obtener estado de un buque especifico.
 FUNCTION FIDE_buque_TB_buscar_estado_FN(
    P_id_buque IN G8admin.FIDE_buque_TB.id_buque%TYPE

)RETURN G8admin.FIDE_buque_TB.estado_buque%TYPE 
IS
V_estado_buque G8admin.FIDE_buque_TB.estado_buque%TYPE ;
BEGIN
    SELECT estado_buque INTO V_estado_buque
    FROM G8admin.FIDE_buque_TB
    WHERE id_buque = P_id_buque;
    
    return V_estado_buque;
END FIDE_buque_TB_buscar_estado_FN;


-- Autor: Luis David
-- Fecha: 25/07/2024
-- calcular la edad del capitan.
 FUNCTION FIDE_capitan_TB_calcular_edad_FN(
    P_id_capitan IN G8admin.FIDE_capitan_TB.id_capitan%TYPE

)RETURN number
IS
V_edad number;
BEGIN
    SELECT 
    FLOOR(months_between(sysdate,FECHA_NACIMIENTO)/12) into V_edad
    FROM G8admin.FIDE_capitan_TB 
    WHERE id_capitan = P_id_capitan;
    return V_edad;
END FIDE_capitan_TB_calcular_edad_FN;


-- Autor: Luis David
-- Fecha: 25/07/2024
-- calcular precio de los productos con iva
 FUNCTION FIDE_producto_TB_calcular_iva_FN(
    P_precio IN G8admin.FIDE_producto_TB.precio%TYPE,
    P_impuesto IN number
)RETURN number
IS
V_precio_con_iva number;
BEGIN
    V_precio_con_iva:= p_precio + ((P_precio / 100) * p_impuesto);
    return V_precio_con_iva;
END FIDE_producto_TB_calcular_iva_FN;


-- Autor: Luis David
-- Fecha: 25/07/2024
-- calcular el peso actual de un buque
 FUNCTION FIDE_buque_TB_calcular_peso_FN(
    P_id_buque IN G8admin.FIDE_buque_TB.id_buque%TYPE
    
)RETURN number
IS
V_peso_maximo  number;
V_peso_uso  number := 0;
V_peso_actual  number;
BEGIN
    SELECT 
    sum(peso_neto)
    into V_peso_uso 
    FROM G8admin.FIDE_contenedor_TB c
    WHERE c.id_buque = P_id_buque;
    
     SELECT 
    CAPACIDAD_MAXIMA
    into V_peso_maximo 
    FROM G8admin.FIDE_buque_TB b
    WHERE b.id_buque = P_id_buque;
    
    V_peso_actual:= V_peso_maximo - V_peso_uso;
    return V_peso_actual;
END FIDE_buque_TB_calcular_peso_FN;


-- Autor: Luis David
-- Fecha: 25/07/2024
-- funcion para calcular cantidad de productos en un contenedor
 FUNCTION FIDE_contenedor_producto_TB_cantidad_producto_FN(
    P_ID_CONTENEDOR_PRODUCTO IN G8admin.FIDE_contenedor_producto_TB.ID_CONTENEDOR_PRODUCTO%TYPE
 
)RETURN number
IS
V_cantidad_producto number;
BEGIN
    SELECT 
    COUNT(ID_PRODUCTO) INTO V_cantidad_producto 
    FROM FIDE_contenedor_producto_TB
    WHERE ID_CONTENEDOR_PRODUCTO = P_ID_CONTENEDOR_PRODUCTO;
    return V_cantidad_producto;
END FIDE_contenedor_producto_TB_cantidad_producto_FN;



-- Autor: Luis David
-- Fecha: 25/07/2024
-- funcion para calcular años de experiencia del capitan
 FUNCTION FIDE_capitan_TB_calcular_experiencia_FN(
    P_id_capitan IN G8admin.FIDE_capitan_TB.id_capitan%TYPE

)RETURN number
IS
V_anios_experiencia number;
BEGIN
    SELECT 
    FLOOR(months_between(sysdate,FECHA_INICIO_CARGO)/12) into V_anios_experiencia
    FROM G8admin.FIDE_capitan_TB 
    WHERE id_capitan = P_id_capitan;
    return V_anios_experiencia;
END FIDE_capitan_TB_calcular_experiencia_FN;


-- Autor: Luis David
-- Fecha: 25/07/2024
-- funcion cuenta los ususarios de una nacionalidad determinada.
 FUNCTION FIDE_usuario_TB_ver_region_usuarios_FN(
    P_nacionalidad IN G8admin.FIDE_usuario_TB.nacionalidad%TYPE
    
)RETURN number
IS
V_cantidad_region number;
BEGIN
    SELECT 
    COUNT(nacionalidad) INTO V_cantidad_region 
    FROM FIDE_usuario_TB
    WHERE UPPER(nacionalidad) like UPPER(P_nacionalidad);
    return V_cantidad_region;
END FIDE_usuario_TB_ver_region_usuarios_FN;


-- Autor: Luis David
-- Fecha: 25/07/2024
-- devuelve cantidad de productos en un inventario
 FUNCTION FIDE_inventario_TB_cantidad_producto_FN(
    P_id_inventario IN G8admin.FIDE_inventario_TB.id_inventario%TYPE
    
)RETURN number
IS
V_cantidad number;
BEGIN
    SELECT COUNT(id_producto) into V_cantidad
    FROM G8admin.FIDE_inventario_TB
    WHERE id_inventario = P_id_inventario;
    
    return V_cantidad;
END FIDE_inventario_TB_cantidad_producto_FN;

END FIDE_PROCEDIMIENTOS_FUNCIONES_PKG;

DROP PACKAGE BODY FIDE_PROCEDIMIENTOS_FUNCIONES_PKG;
------------------------------ VISTAS -------------------------------------------------------

-- Autor: Luis David
-- Fecha: 25/07/2024
-- vista de productos con detalles varios.
CREATE OR REPLACE view FIDE_productos_V
AS
    SELECT 
        p.descripcion, c.nombre_categoria categoria,  d.color, d.tamaño, p.precio, i.cantidad stock
    FROM G8admin.FIDE_producto_TB p
    INNER JOIN  G8admin.FIDE_detalle_TB d ON p.id_detalle = d.id_detalle
    INNER JOIN  G8admin.FIDE_capitan_TB c ON p.id_categoria = c.id_categoria
    INNER JOIN  G8admin.FIDE_inventario_TB i ON i.id_producto = p.id_producto;
    
    
    
    
-- Autor: Luis David
-- Fecha: 25/07/2024
-- vista de personal buque.
CREATE OR REPLACE view FIDE_personal_buque_V
AS
    SELECT 
        b.nombre_barco, e.nombre nombre_empleado, c.nombre_capitan 
    FROM G8admin.FIDE_buque_TB b
    INNER JOIN  G8admin.FIDE_empleado_TB e ON b.id_empleado = e.id_empleado
    INNER JOIN  G8admin.FIDE_capitan_TB c ON b.id_capitan = c.id_capitan;
    
    
-- Autor: Josué García Rojas
-- Fecha: 5/08/2024
-- Vista de informacion de capitanes

CREATE OR REPLACE VIEW G8admin.VIEW_Capitanes_Info AS
SELECT 
    cap.id_capitan AS "ID Capitán",
    cap.nombre_capitan AS "Nombre Capitán",
    cap.edad_capitan AS "Edad",
    TO_CHAR(cap.fecha_nacimiento, 'DD-MM-YYYY') AS "Fecha de Nacimiento",
    cap.años_experiencia AS "Años de Experiencia",
    TO_CHAR(cap.fecha_inicio_cargo, 'DD-MM-YYYY') AS "Fecha de Inicio en el Cargo",
    pais.nombre_pais AS "País"
FROM 
    G8admin.FIDE_capitan_TB cap
JOIN 
    G8admin.FIDE_pais_TB pais ON cap.id_pais = pais.id_pais
WHERE 
    cap.Estado = 'Activo';
    
    
    
    
    


-------------------------------------------------- INSERTS ---------------------------------------------------------

---- DATOS DE CATEGORIA ----

BEGIN
    G8admin.categoria_insertar_SP('Electrónica');
    G8admin.categoria_insertar_SP('Ropa');
    G8admin.categoria_insertar_SP('Hogar');
    G8admin.categoria_insertar_SP('Juguetes');
    G8admin.categoria_insertar_SP('Deportes');
    G8admin.categoria_insertar_SP('Salud');
    G8admin.categoria_insertar_SP('Belleza');
    G8admin.categoria_insertar_SP('Automóviles');
    G8admin.categoria_insertar_SP('Libros');
    G8admin.categoria_insertar_SP('Música');
    G8admin.categoria_insertar_SP('Computadoras');
    G8admin.categoria_insertar_SP('Teléfonos');
    G8admin.categoria_insertar_SP('Electrodomésticos');
    G8admin.categoria_insertar_SP('Muebles');
    G8admin.categoria_insertar_SP('Herramientas');
    G8admin.categoria_insertar_SP('Oficina');
    G8admin.categoria_insertar_SP('Cocina');
    G8admin.categoria_insertar_SP('Decoración');
    G8admin.categoria_insertar_SP('Fitness');
    G8admin.categoria_insertar_SP('Cuidado Personal');
    G8admin.categoria_insertar_SP('Ropa Deportiva');
    G8admin.categoria_insertar_SP('Equipamiento Deportivo');
    G8admin.categoria_insertar_SP('Videojuegos');
    G8admin.categoria_insertar_SP('Películas');
    G8admin.categoria_insertar_SP('Series');
    G8admin.categoria_insertar_SP('Cómics');
    G8admin.categoria_insertar_SP('Instrumentos Musicales');
    G8admin.categoria_insertar_SP('Cámara');
    G8admin.categoria_insertar_SP('Fotografía');
    G8admin.categoria_insertar_SP('Cuidado del Bebé');
    G8admin.categoria_insertar_SP('Ropa Infantil');
    G8admin.categoria_insertar_SP('Cuidado del Cabello');
    G8admin.categoria_insertar_SP('Cuidado de la Piel');
    G8admin.categoria_insertar_SP('Higiene');
    G8admin.categoria_insertar_SP('Cuidado del Hogar');
    G8admin.categoria_insertar_SP('Jardinería');
    G8admin.categoria_insertar_SP('Almacenamiento');
    G8admin.categoria_insertar_SP('Viajes');
    G8admin.categoria_insertar_SP('Cámaras de Seguridad');
    G8admin.categoria_insertar_SP('Aire Acondicionado');
    G8admin.categoria_insertar_SP('Calefacción');
    G8admin.categoria_insertar_SP('Purificación de Aire');
    G8admin.categoria_insertar_SP('Iluminación');
    G8admin.categoria_insertar_SP('Ropa de Cama');
    G8admin.categoria_insertar_SP('Toallas');
    G8admin.categoria_insertar_SP('Alfombras');
    G8admin.categoria_insertar_SP('Muebles de Oficina');
    G8admin.categoria_insertar_SP('Cocina y Comedor');
    G8admin.categoria_insertar_SP('Ropa de Fiesta');
    G8admin.categoria_insertar_SP('Ropa Casual');
    G8admin.categoria_insertar_SP('Calzado');
    G8admin.categoria_insertar_SP('Accesorios');
    G8admin.categoria_insertar_SP('Higiene Personal');
    G8admin.categoria_insertar_SP('Cuidado de la Salud');
    G8admin.categoria_insertar_SP('Mascotas');
    G8admin.categoria_insertar_SP('Fitness y Ejercicio');
    G8admin.categoria_insertar_SP('Bebidas');
    G8admin.categoria_insertar_SP('Alimentos');
    G8admin.categoria_insertar_SP('Vinos');
    G8admin.categoria_insertar_SP('Cervezas');
    G8admin.categoria_insertar_SP('Licores');
    G8admin.categoria_insertar_SP('Productos Gourmet');
    G8admin.categoria_insertar_SP('Cuidado del Jardín');
END;


---- DATOS DE DETALLE ----


BEGIN
  G8admin.detalle_insertar_SP('Rojo', 'Pequeño');
  G8admin.detalle_insertar_SP('Azul', 'Mediano');
  G8admin.detalle_insertar_SP('Verde', 'Grande');
  G8admin.detalle_insertar_SP('Amarillo', 'Pequeño');
  G8admin.detalle_insertar_SP('Negro', 'Mediano');
  G8admin.detalle_insertar_SP('Blanco', 'Grande');
  G8admin.detalle_insertar_SP('Marrón', 'Pequeño');
  G8admin.detalle_insertar_SP('Gris', 'Mediano');
  G8admin.detalle_insertar_SP('Rosa', 'Grande');
  G8admin.detalle_insertar_SP('Morado', 'Pequeño');
  G8admin.detalle_insertar_SP('Naranja', 'Mediano');
  G8admin.detalle_insertar_SP('Turquesa', 'Grande');
  G8admin.detalle_insertar_SP('Celeste', 'Pequeño');
  G8admin.detalle_insertar_SP('Violeta', 'Mediano');
  G8admin.detalle_insertar_SP('Lila', 'Grande');
  G8admin.detalle_insertar_SP('Fucsia', 'Pequeño');
  G8admin.detalle_insertar_SP('Beige', 'Mediano');
  G8admin.detalle_insertar_SP('Cian', 'Grande');
  G8admin.detalle_insertar_SP('Ocre', 'Pequeño');
  G8admin.detalle_insertar_SP('Magenta', 'Mediano');
  G8admin.detalle_insertar_SP('Café', 'Grande');
  G8admin.detalle_insertar_SP('Azul marino', 'Pequeño');
  G8admin.detalle_insertar_SP('Verde lima', 'Mediano');
  G8admin.detalle_insertar_SP('Dorado', 'Grande');
  G8admin.detalle_insertar_SP('Plateado', 'Pequeño');
  G8admin.detalle_insertar_SP('Champán', 'Mediano');
  G8admin.detalle_insertar_SP('Marfil', 'Grande');
  G8admin.detalle_insertar_SP('Coral', 'Pequeño');
  G8admin.detalle_insertar_SP('Menta', 'Mediano');
  G8admin.detalle_insertar_SP('Lavanda', 'Grande');
  G8admin.detalle_insertar_SP('Esmeralda', 'Pequeño');
  G8admin.detalle_insertar_SP('Ámbar', 'Mediano');
  G8admin.detalle_insertar_SP('Salmón', 'Grande');
  G8admin.detalle_insertar_SP('Caqui', 'Pequeño');
  G8admin.detalle_insertar_SP('Chocolate', 'Mediano');
  G8admin.detalle_insertar_SP('Caramelo', 'Grande');
  G8admin.detalle_insertar_SP('Oro', 'Pequeño');
  G8admin.detalle_insertar_SP('Cobre', 'Mediano');
  G8admin.detalle_insertar_SP('Bronce', 'Grande');
  G8admin.detalle_insertar_SP('Ladrillo', 'Pequeño');
  G8admin.detalle_insertar_SP('Arena', 'Mediano');
  G8admin.detalle_insertar_SP('Oliva', 'Grande');
  G8admin.detalle_insertar_SP('Pistacho', 'Pequeño');
  G8admin.detalle_insertar_SP('Turquesa claro', 'Mediano');
  G8admin.detalle_insertar_SP('Marrón oscuro', 'Grande');
  G8admin.detalle_insertar_SP('Vino', 'Pequeño');
  G8admin.detalle_insertar_SP('Lavanda claro', 'Mediano');
  G8admin.detalle_insertar_SP('Rosa pastel', 'Grande');
  G8admin.detalle_insertar_SP('Verde menta', 'Pequeño');
  G8admin.detalle_insertar_SP('Lila claro', 'Mediano');
  G8admin.detalle_insertar_SP('Celeste claro', 'Grande');
  G8admin.detalle_insertar_SP('Azul cielo', 'Pequeño');
  G8admin.detalle_insertar_SP('Verde oscuro', 'Mediano');
  G8admin.detalle_insertar_SP('Amarillo limón', 'Grande');
  G8admin.detalle_insertar_SP('Mandarina', 'Pequeño');
  G8admin.detalle_insertar_SP('Rosa chicle', 'Mediano');
  G8admin.detalle_insertar_SP('Azul bebé', 'Grande');
  G8admin.detalle_insertar_SP('Marrón claro', 'Pequeño');
  G8admin.detalle_insertar_SP('Café oscuro', 'Mediano');
  G8admin.detalle_insertar_SP('Verde esmeralda', 'Grande');
  G8admin.detalle_insertar_SP('Amarillo claro', 'Pequeño');
  G8admin.detalle_insertar_SP('Dorado oscuro', 'Mediano');
  G8admin.detalle_insertar_SP('Plateado claro', 'Grande');
  G8admin.detalle_insertar_SP('Champán claro', 'Pequeño');
  G8admin.detalle_insertar_SP('Coral oscuro', 'Mediano');
  G8admin.detalle_insertar_SP('Verde claro', 'Grande');
  G8admin.detalle_insertar_SP('Gris claro', 'Pequeño');
  G8admin.detalle_insertar_SP('Rojo oscuro', 'Mediano');
  G8admin.detalle_insertar_SP('Azul oscuro', 'Grande');
  G8admin.detalle_insertar_SP('Verde oliva', 'Pequeño');
  G8admin.detalle_insertar_SP('Marrón claro', 'Mediano');
  G8admin.detalle_insertar_SP('Violeta oscuro', 'Grande');
  G8admin.detalle_insertar_SP('Lila oscuro', 'Pequeño');
  G8admin.detalle_insertar_SP('Turquesa oscuro', 'Mediano');
  G8admin.detalle_insertar_SP('Verde botella', 'Grande');
  G8admin.detalle_insertar_SP('Cian claro', 'Pequeño');
  G8admin.detalle_insertar_SP('Magenta oscuro', 'Mediano');
  G8admin.detalle_insertar_SP('Ocre claro', 'Grande');
  G8admin.detalle_insertar_SP('Lavanda oscuro', 'Pequeño');
  G8admin.detalle_insertar_SP('Púrpura claro', 'Mediano');
  G8admin.detalle_insertar_SP('Esmeralda claro', 'Grande');
  G8admin.detalle_insertar_SP('Ámbar claro', 'Pequeño');
  G8admin.detalle_insertar_SP('Salmón claro', 'Mediano');
  G8admin.detalle_insertar_SP('Violeta claro', 'Grande');
  G8admin.detalle_insertar_SP('Caqui claro', 'Pequeño');
  G8admin.detalle_insertar_SP('Menta claro', 'Mediano');
  G8admin.detalle_insertar_SP('Oro claro', 'Grande');
  G8admin.detalle_insertar_SP('Cobre claro', 'Pequeño');
  G8admin.detalle_insertar_SP('Bronce claro', 'Mediano');
  G8admin.detalle_insertar_SP('Ladrillo claro', 'Grande');
  G8admin.detalle_insertar_SP('Arena claro', 'Pequeño');
  G8admin.detalle_insertar_SP('Oliva claro', 'Mediano');
  G8admin.detalle_insertar_SP('Pistacho claro', 'Grande');
  G8admin.detalle_insertar_SP('Turquesa pastel', 'Pequeño');
  G8admin.detalle_insertar_SP('Rosa oscuro', 'Mediano');
  G8admin.detalle_insertar_SP('Gris oscuro', 'Grande');
  G8admin.detalle_insertar_SP('Beige oscuro', 'Pequeño');
  G8admin.detalle_insertar_SP('Rosa oscuro', 'Mediano');
  G8admin.detalle_insertar_SP('Azul oscuro', 'Grande');
  G8admin.detalle_insertar_SP('Verde oscuro', 'Pequeño');
  G8admin.detalle_insertar_SP('Amarillo oscuro', 'Mediano');
  G8admin.detalle_insertar_SP('Rojo oscuro', 'Grande');
  G8admin.detalle_insertar_SP('Marrón oscuro', 'Pequeño');
  G8admin.detalle_insertar_SP('Gris oscuro', 'Mediano');
  G8admin.detalle_insertar_SP('Violeta oscuro', 'Grande');
  G8admin.detalle_insertar_SP('Turquesa oscuro', 'Pequeño');
  G8admin.detalle_insertar_SP('Verde oscuro', 'Mediano');
  G8admin.detalle_insertar_SP('Amarillo oscuro', 'Grande');
  G8admin.detalle_insertar_SP('Rosa oscuro', 'Pequeño');
  G8admin.detalle_insertar_SP('Azul oscuro', 'Mediano');
  G8admin.detalle_insertar_SP('Verde oscuro', 'Grande');
  G8admin.detalle_insertar_SP('Amarillo oscuro', 'Pequeño');
  G8admin.detalle_insertar_SP('Rojo oscuro', 'Mediano');
  G8admin.detalle_insertar_SP('Marrón oscuro', 'Grande');
  G8admin.detalle_insertar_SP('Gris oscuro', 'Pequeño');
  G8admin.detalle_insertar_SP('Violeta oscuro', 'Mediano');
  G8admin.detalle_insertar_SP('Turquesa oscuro', 'Grande');
  G8admin.detalle_insertar_SP('Verde oscuro', 'Pequeño');
  G8admin.detalle_insertar_SP('Amarillo oscuro', 'Mediano');
  G8admin.detalle_insertar_SP('Rojo oscuro', 'Grande');
  G8admin.detalle_insertar_SP('Marrón oscuro', 'Pequeño');
  G8admin.detalle_insertar_SP('Gris oscuro', 'Mediano');
  G8admin.detalle_insertar_SP('Violeta oscuro', 'Grande');
  G8admin.detalle_insertar_SP('Turquesa oscuro', 'Pequeño');
  G8admin.detalle_insertar_SP('Verde oscuro', 'Mediano');
  G8admin.detalle_insertar_SP('Amarillo oscuro', 'Grande');
  G8admin.detalle_insertar_SP('Rosa oscuro', 'Pequeño');
  G8admin.detalle_insertar_SP('Azul oscuro', 'Mediano');
  G8admin.detalle_insertar_SP('Verde oscuro', 'Grande');
  G8admin.detalle_insertar_SP('Amarillo oscuro', 'Pequeño');
  G8admin.detalle_insertar_SP('Rojo oscuro', 'Mediano');
  G8admin.detalle_insertar_SP('Marrón oscuro', 'Grande');
  G8admin.detalle_insertar_SP('Gris oscuro', 'Pequeño');
  G8admin.detalle_insertar_SP('Violeta oscuro', 'Mediano');
  G8admin.detalle_insertar_SP('Turquesa oscuro', 'Grande');
  G8admin.detalle_insertar_SP('Verde oscuro', 'Pequeño');
  G8admin.detalle_insertar_SP('Amarillo oscuro', 'Mediano');
  G8admin.detalle_insertar_SP('Rojo oscuro', 'Grande');
  G8admin.detalle_insertar_SP('Ladrillo oscuro', 'Pequeño');
  G8admin.detalle_insertar_SP('Arena oscura', 'Mediano');
  G8admin.detalle_insertar_SP('Oliva oscura', 'Grande');
  G8admin.detalle_insertar_SP('Pistacho oscuro', 'Pequeño');
  G8admin.detalle_insertar_SP('Turquesa oscuro', 'Mediano');
  G8admin.detalle_insertar_SP('Rosa pastel', 'Grande');
  G8admin.detalle_insertar_SP('Gris pastel', 'Pequeño');
  G8admin.detalle_insertar_SP('Azul pastel', 'Mediano');
  G8admin.detalle_insertar_SP('Verde pastel', 'Grande');
  G8admin.detalle_insertar_SP('Amarillo pastel', 'Pequeño');
  G8admin.detalle_insertar_SP('Rojo pastel', 'Mediano');
  G8admin.detalle_insertar_SP('Marrón pastel', 'Grande');
  G8admin.detalle_insertar_SP('Gris plata', 'Pequeño');
  G8admin.detalle_insertar_SP('Azul plata', 'Mediano');
  G8admin.detalle_insertar_SP('Verde plata', 'Grande');
  G8admin.detalle_insertar_SP('Amarillo plata', 'Pequeño');
  G8admin.detalle_insertar_SP('Rojo plata', 'Mediano');
  G8admin.detalle_insertar_SP('Marrón plata', 'Grande');
  G8admin.detalle_insertar_SP('Turquesa metalizado', 'Pequeño');
  G8admin.detalle_insertar_SP('Rosa metalizado', 'Mediano');
  G8admin.detalle_insertar_SP('Gris metalizado', 'Grande');
  G8admin.detalle_insertar_SP('Azul metalizado', 'Pequeño');
  G8admin.detalle_insertar_SP('Verde metalizado', 'Mediano');
  G8admin.detalle_insertar_SP('Amarillo metalizado', 'Grande');
  G8admin.detalle_insertar_SP('Rojo metalizado', 'Pequeño');
  G8admin.detalle_insertar_SP('Marrón metalizado', 'Mediano');
  G8admin.detalle_insertar_SP('Celeste metalizado', 'Grande');
  G8admin.detalle_insertar_SP('Lila metalizado', 'Pequeño');
  G8admin.detalle_insertar_SP('Violeta metalizado', 'Mediano');
  G8admin.detalle_insertar_SP('Esmeralda metalizado', 'Grande');
  G8admin.detalle_insertar_SP('Cian metalizado', 'Pequeño');
  G8admin.detalle_insertar_SP('Magenta metalizado', 'Mediano');
  G8admin.detalle_insertar_SP('Ocre metalizado', 'Grande');
  G8admin.detalle_insertar_SP('Salmon metalizado', 'Pequeño');
  G8admin.detalle_insertar_SP('Coral metalizado', 'Mediano');
  G8admin.detalle_insertar_SP('Menta metalizado', 'Grande');
  G8admin.detalle_insertar_SP('Lavanda metalizado', 'Pequeño');
  G8admin.detalle_insertar_SP('Púrpura metalizado', 'Mediano');
  G8admin.detalle_insertar_SP('Ladrillo metalizado', 'Grande');
  G8admin.detalle_insertar_SP('Arena metalizado', 'Pequeño');
  G8admin.detalle_insertar_SP('Oliva metalizado', 'Mediano');
  G8admin.detalle_insertar_SP('Pistacho metalizado', 'Grande');
  G8admin.detalle_insertar_SP('Turquesa brillante', 'Pequeño');
  G8admin.detalle_insertar_SP('Rosa brillante', 'Mediano');
  G8admin.detalle_insertar_SP('Gris brillante', 'Grande');
  G8admin.detalle_insertar_SP('Azul brillante', 'Pequeño');
  G8admin.detalle_insertar_SP('Verde brillante', 'Mediano');
  G8admin.detalle_insertar_SP('Amarillo brillante', 'Grande');
  G8admin.detalle_insertar_SP('Rojo brillante', 'Pequeño');
  G8admin.detalle_insertar_SP('Marrón brillante', 'Mediano');
  G8admin.detalle_insertar_SP('Celeste brillante', 'Grande');
  G8admin.detalle_insertar_SP('Lila brillante', 'Pequeño');
  G8admin.detalle_insertar_SP('Violeta brillante', 'Mediano');
  G8admin.detalle_insertar_SP('Esmeralda brillante', 'Grande');
  G8admin.detalle_insertar_SP('Cian brillante', 'Pequeño');
  G8admin.detalle_insertar_SP('Magenta brillante', 'Mediano');
  G8admin.detalle_insertar_SP('Ocre brillante', 'Grande');
  G8admin.detalle_insertar_SP('Salmon brillante', 'Pequeño');
  G8admin.detalle_insertar_SP('Coral brillante', 'Mediano');
  G8admin.detalle_insertar_SP('Menta brillante', 'Grande');
  G8admin.detalle_insertar_SP('Lavanda brillante', 'Pequeño');
  G8admin.detalle_insertar_SP('Púrpura brillante', 'Mediano');
  G8admin.detalle_insertar_SP('Ladrillo brillante', 'Grande');
  
END;
/



---- DATOS DE PRODUCTO ----

BEGIN
    G8admin.Insertar_producto(1, 'Cámara DSLR Canon EOS 5D', 1499.99, 1, 'canon_5d.jpg');
    G8admin.Insertar_producto(2, 'Auriculares Bose QuietComfort', 299.99, 2, 'bose_headphones.jpg');
    G8admin.Insertar_producto(3, 'Chaqueta impermeable azul', 89.99, 3, 'blue_raincoat.jpg');
    G8admin.Insertar_producto(4, 'Reloj inteligente Garmin Venu', 399.99, 4, 'garmin_venu.jpg');
    G8admin.Insertar_producto(5, 'Perfume Burberry Her', 129.99, 5, 'burberry_her.jpg');
    G8admin.Insertar_producto(6, 'Laptop Dell XPS 13', 1299.99, 6, 'dell_xps.jpg');
    G8admin.Insertar_producto(7, 'Cartera de cuero marrón', 79.99, 7, 'brown_wallet.jpg');
    G8admin.Insertar_producto(8, 'Camisa de algodón blanca', 49.99, 8, 'white_shirt.jpg');
    G8admin.Insertar_producto(9, 'Botines de cuero negro', 139.99, 9, 'black_boots.jpg');
    G8admin.Insertar_producto(10, 'Chaqueta de lana gris', 119.99, 10, 'grey_wool_jacket.jpg');
    G8admin.Insertar_producto(11, 'Zapatos deportivos Nike Air Max', 149.99, 11, 'nike_air_max.jpg');
    G8admin.Insertar_producto(12, 'Ropa de cama para adultos', 89.99, 12, 'adult_bedding.jpg');
    G8admin.Insertar_producto(13, 'Cámara de acción GoPro HERO10', 499.99, 13, 'gopro_hero10.jpg');
    G8admin.Insertar_producto(14, 'Chaqueta de mezclilla clásica', 99.99, 14, 'classic_denim_jacket.jpg');
    G8admin.Insertar_producto(15, 'Camisa de manga corta', 39.99, 15, 'short_sleeve_shirt.jpg');
    G8admin.Insertar_producto(16, 'Perfume Chanel No. 5', 159.99, 16, 'chanel_no5.jpg');
    G8admin.Insertar_producto(17, 'Pantalones deportivos Adidas', 69.99, 17, 'adidas_sweatpants.jpg');
    G8admin.Insertar_producto(18, 'Reloj de pulsera analógico', 119.99, 18, 'analog_watch.jpg');
    G8admin.Insertar_producto(19, 'Chaqueta de cuero con capucha', 179.99, 19, 'hooded_leather_jacket.jpg');
    G8admin.Insertar_producto(20, 'Gafas de sol Ray-Ban', 129.99, 20, 'rayban_sunglasses.jpg');
    G8admin.Insertar_producto(21, 'Zapatos de charol', 159.99, 21, 'patent_shoes.jpg');
    G8admin.Insertar_producto(22, 'Camisa de lino', 59.99, 22, 'linen_shirt.jpg');
    G8admin.Insertar_producto(23, 'Chaqueta acolchada', 149.99, 23, 'padded_jacket.jpg');
    G8admin.Insertar_producto(24, 'Perfume Dior Sauvage', 139.99, 24, 'dior_sauvage.jpg');
    G8admin.Insertar_producto(25, 'Cartera pequeña de cuero', 69.99, 25, 'small_leather_wallet.jpg');
    G8admin.Insertar_producto(26, 'Chaqueta de felpa', 89.99, 26, 'fleece_jacket.jpg');
    G8admin.Insertar_producto(27, 'Gafas de sol estilo aviador', 89.99, 27, 'aviator_sunglasses.jpg');
    G8admin.Insertar_producto(28, 'Camisa de rayas', 49.99, 28, 'striped_shirt.jpg');
    G8admin.Insertar_producto(29, 'Ropa de baño para hombre', 39.99, 29, 'men_swimwear.jpg');
    G8admin.Insertar_producto(30, 'Chaqueta ligera', 89.99, 30, 'light_jacket.jpg');
    G8admin.Insertar_producto(31, 'Reloj de pulsera digital', 89.99, 31, 'digital_wristwatch.jpg');
    G8admin.Insertar_producto(32, 'Pantalones cortos', 49.99, 32, 'shorts.jpg');
    G8admin.Insertar_producto(33, 'Zapatos de ballet', 79.99, 33, 'ballet_shoes.jpg');
    G8admin.Insertar_producto(34, 'Perfume Hugo Boss Bottled', 119.99, 34, 'hugo_boss.jpg');
    G8admin.Insertar_producto(35, 'Camisa de seda roja', 129.99, 35, 'red_silk_shirt.jpg');
    G8admin.Insertar_producto(36, 'Chaqueta de lana', 129.99, 36, 'wool_jacket.jpg');
    G8admin.Insertar_producto(37, 'Cartera de mano', 129.99, 37, 'handbag.jpg');
    G8admin.Insertar_producto(38, 'Camisa de manga larga', 49.99, 38, 'long_sleeve_shirt.jpg');
    G8admin.Insertar_producto(39, 'Ropa de cama para niños', 79.99, 39, 'kids_bedding.jpg');
    G8admin.Insertar_producto(40, 'Zapatos Oxford', 119.99, 40, 'oxford_shoes.jpg');
    G8admin.Insertar_producto(41, 'Gafas de sol modernas', 109.99, 41, 'modern_sunglasses.jpg');
    G8admin.Insertar_producto(42, 'Chaqueta de terciopelo', 149.99, 42, 'velvet_jacket.jpg');
    G8admin.Insertar_producto(43, 'Cámara Sony Alpha', 2299.99, 43, 'sony_alpha_camera.jpg');
    G8admin.Insertar_producto(44, 'Perfume Versace', 129.99, 44, 'versace_perfume.jpg');
    G8admin.Insertar_producto(45, 'Ropa interior', 39.99, 45, 'underwear.jpg');
    G8admin.Insertar_producto(46, 'Zapatos de deporte Puma', 119.99, 46, 'puma_sports_shoes.jpg');
    G8admin.Insertar_producto(47, 'Chaqueta de gamuza', 159.99, 47, 'suede_jacket.jpg');
    G8admin.Insertar_producto(48, 'Camisa de algodón azul', 59.99, 48, 'blue_cotton_shirt.jpg');
    G8admin.Insertar_producto(49, 'Ropa de deporte', 49.99, 49, 'sportswear.jpg');
    G8admin.Insertar_producto(50, 'Chaqueta de lana fina', 119.99, 50, 'fine_wool_jacket.jpg');
    G8admin.Insertar_producto(1, 'Chaqueta de mezclilla con parches', 129.99, 51, 'patched_denim_jacket.jpg');
    G8admin.Insertar_producto(2, 'Cartera de mano pequeña', 69.99, 52, 'small_handbag.jpg');
    G8admin.Insertar_producto(3, 'Reloj de pulsera', 159.99, 53, 'wristwatch.jpg');
    G8admin.Insertar_producto(4, 'Chaqueta de lana gruesa', 149.99, 54, 'thick_wool_jacket.jpg');
    G8admin.Insertar_producto(5, 'Cartera de piel', 79.99, 55, 'leather_wallet.jpg');
    G8admin.Insertar_producto(6, 'Zapatos deportivos Adidas', 129.99, 56, 'adidas_shoes.jpg');
    G8admin.Insertar_producto(7, 'Chaqueta de gamuza', 159.99, 57, 'suede_jacket.jpg');
    G8admin.Insertar_producto(8, 'Chaqueta de lana con botones', 139.99, 58, 'buttoned_wool_jacket.jpg');
    G8admin.Insertar_producto(9, 'Ropa de baño para mujer', 49.99, 59, 'women_swimwear.jpg');
    G8admin.Insertar_producto(10, 'Camisa de seda negra', 119.99, 60, 'black_silk_shirt.jpg');
    G8admin.Insertar_producto(11, 'Chaqueta deportiva', 99.99, 61, 'sports_jacket.jpg');
    G8admin.Insertar_producto(12, 'Chaqueta de mezclilla ajustada', 129.99, 62, 'fitted_denim_jacket.jpg');
    G8admin.Insertar_producto(13, 'Gafas de sol polarizadas', 139.99, 63, 'polarized_sunglasses.jpg');
    G8admin.Insertar_producto(14, 'Camisa de algodón con estampado', 69.99, 64, 'printed_cotton_shirt.jpg');
    G8admin.Insertar_producto(15, 'Cartera grande de cuero', 89.99, 65, 'large_leather_wallet.jpg');
    G8admin.Insertar_producto(16, 'Reloj de pulsera clásico', 179.99, 66, 'classic_wristwatch.jpg');
    G8admin.Insertar_producto(17, 'Zapatos casuales', 119.99, 67, 'casual_shoes.jpg');
    G8admin.Insertar_producto(18, 'Chaqueta de cuero estilo motero', 199.99, 68, 'biker_leather_jacket.jpg');
    G8admin.Insertar_producto(19, 'Perfume Givenchy', 139.99, 69, 'givenchy_perfume.jpg');
    G8admin.Insertar_producto(20, 'Ropa interior de seda', 49.99, 70, 'silk_underwear.jpg');
    G8admin.Insertar_producto(1, 'Chaqueta de plumas', 159.99, 71, 'down_jacket.jpg');
    G8admin.Insertar_producto(2, 'Ropa de cama de seda', 129.99, 72, 'silk_bedding.jpg');
    G8admin.Insertar_producto(3, 'Zapatos de charol negros', 139.99, 73, 'black_patent_shoes.jpg');
    G8admin.Insertar_producto(4, 'Camisa de mezclilla', 69.99, 74, 'denim_shirt.jpg');
    G8admin.Insertar_producto(5, 'Chaqueta de cuero sintético', 139.99, 75, 'synthetic_leather_jacket.jpg');
    G8admin.Insertar_producto(6, 'Cartera de cuero de diseño', 89.99, 76, 'designer_leather_wallet.jpg');
    G8admin.Insertar_producto(7, 'Reloj de buceo', 249.99, 77, 'diving_watch.jpg');
    G8admin.Insertar_producto(8, 'Botines de ante', 119.99, 78, 'suede_boots.jpg');
    G8admin.Insertar_producto(9, 'Chaqueta acolchada para invierno', 149.99, 79, 'winter_padded_jacket.jpg');
    G8admin.Insertar_producto(10, 'Gafas de sol de lujo', 199.99, 80, 'luxury_sunglasses.jpg');
    G8admin.Insertar_producto(11, 'Chaqueta de mezclilla con forro', 119.99, 81, 'denim_jacket_with_lining.jpg');
    G8admin.Insertar_producto(12, 'Chaqueta de lana y seda', 139.99, 82, 'wool_silk_jacket.jpg');
    G8admin.Insertar_producto(13, 'Cartera de mano elegante', 99.99, 83, 'elegant_handbag.jpg');
    G8admin.Insertar_producto(14, 'Perfume Valentino', 149.99, 84, 'valentino_perfume.jpg');
    G8admin.Insertar_producto(15, 'Ropa de cama para niños', 79.99, 85, 'kids_bedding.jpg');
    G8admin.Insertar_producto(16, 'Camisa de manga larga de lino', 79.99, 86, 'linen_long_sleeve_shirt.jpg');
    G8admin.Insertar_producto(17, 'Chaqueta deportiva para correr', 89.99, 87, 'running_sports_jacket.jpg');
    G8admin.Insertar_producto(18, 'Zapatos de cuero clásico', 149.99, 88, 'classic_leather_shoes.jpg');
    G8admin.Insertar_producto(19, 'Reloj digital deportivo', 129.99, 89, 'sports_digital_watch.jpg');
    G8admin.Insertar_producto(20, 'Botas de montaña resistentes', 179.99, 90, 'mountain_boots.jpg');
    G8admin.Insertar_producto(21, 'Chaqueta de lana con capucha', 159.99, 91, 'hooded_wool_jacket.jpg');
    G8admin.Insertar_producto(22, 'Perfume Montblanc Explorer', 139.99, 92, 'montblanc_explorer.jpg');
    G8admin.Insertar_producto(23, 'Cartera de mano de diseño exclusivo', 109.99, 93, 'exclusive_handbag.jpg');
    G8admin.Insertar_producto(24, 'Camisa de algodón con cuello', 59.99, 94, 'collared_cotton_shirt.jpg');
    G8admin.Insertar_producto(25, 'Chaqueta de cuero para motociclista', 199.99, 95, 'motorcycle_leather_jacket.jpg');
    G8admin.Insertar_producto(26, 'Gafas de sol polarizadas', 119.99, 96, 'polarized_sunglasses.jpg');
    G8admin.Insertar_producto(27, 'Chaqueta de lana y algodón', 129.99, 97, 'wool_cotton_jacket.jpg');
    G8admin.Insertar_producto(28, 'Cartera de piel grande', 89.99, 98, 'large_leather_wallet.jpg');
    G8admin.Insertar_producto(29, 'Zapatos de charol para eventos', 159.99, 99, 'event_patent_shoes.jpg');
    G8admin.Insertar_producto(30, 'Camisa de seda con estampado', 119.99, 100, 'printed_silk_shirt.jpg');
    G8admin.Insertar_producto(31, 'Reloj de pulsera con cronómetro', 219.99, 101, 'chronograph_wristwatch.jpg');
    G8admin.Insertar_producto(32, 'Botines de cuero con hebilla', 139.99, 102, 'buckled_leather_boots.jpg');
    G8admin.Insertar_producto(33, 'Chaqueta de terciopelo azul', 159.99, 103, 'blue_velvet_jacket.jpg');
    G8admin.Insertar_producto(34, 'Chaqueta de lana con forro interior', 139.99, 104, 'lined_wool_jacket.jpg');
    G8admin.Insertar_producto(35, 'Cartera de mano pequeña', 69.99, 105, 'small_handbag.jpg');
    G8admin.Insertar_producto(36, 'Chaqueta acolchada de plumón', 169.99, 106, 'down_jacket.jpg');
    G8admin.Insertar_producto(37, 'Camisa de mezclilla azul', 69.99, 107, 'blue_denim_shirt.jpg');
    G8admin.Insertar_producto(38, 'Gafas de sol de diseñador', 199.99, 108, 'designer_sunglasses.jpg');
    G8admin.Insertar_producto(39, 'Chaqueta de cuero negra', 179.99, 109, 'black_leather_jacket.jpg');
    G8admin.Insertar_producto(40, 'Reloj analógico de lujo', 299.99, 110, 'luxury_analog_watch.jpg');
    G8admin.Insertar_producto(41, 'Chaqueta de lana y cachemira', 189.99, 111, 'cashmere_wool_jacket.jpg');
    G8admin.Insertar_producto(42, 'Cartera de mano con cierre', 79.99, 112, 'zippered_handbag.jpg');
    G8admin.Insertar_producto(43, 'Ropa interior de algodón', 39.99, 113, 'cotton_underwear.jpg');
    G8admin.Insertar_producto(44, 'Chaqueta de lana negra', 129.99, 114, 'black_wool_jacket.jpg');
    G8admin.Insertar_producto(45, 'Cartera de cuero para hombre', 89.99, 115, 'men_leather_wallet.jpg');
    G8admin.Insertar_producto(46, 'Reloj de pulsera para hombre', 179.99, 116, 'men_wristwatch.jpg');
    G8admin.Insertar_producto(47, 'Chaqueta de mezclilla verde', 119.99, 117, 'green_denim_jacket.jpg');
    G8admin.Insertar_producto(48, 'Botines de gamuza con cordones', 149.99, 118, 'suede_boots_with_laces.jpg');
    G8admin.Insertar_producto(49, 'Chaqueta de lana con detalles', 139.99, 119, 'detailed_wool_jacket.jpg');
    G8admin.Insertar_producto(50, 'Gafas de sol de aviador', 139.99, 120, 'aviator_sunglasses.jpg');
    G8admin.Insertar_producto(1, 'Ropa de cama para bebé', 59.99, 121, 'baby_bedding.jpg');
    G8admin.Insertar_producto(2, 'Chaqueta de lana con capucha', 149.99, 122, 'hooded_wool_jacket.jpg');
    G8admin.Insertar_producto(3, 'Zapatos de deporte Nike', 129.99, 123, 'nike_sports_shoes.jpg');
    G8admin.Insertar_producto(4, 'Cartera de mano de piel', 89.99, 124, 'leather_handbag.jpg');
    G8admin.Insertar_producto(5, 'Chaqueta de mezclilla con forro', 129.99, 125, 'denim_jacket_with_lining.jpg');
    G8admin.Insertar_producto(6, 'Reloj de pulsera con cronógrafo', 219.99, 126, 'chronograph_watch.jpg');
    G8admin.Insertar_producto(7, 'Camisa de seda con estampado floral', 139.99, 127, 'floral_silk_shirt.jpg');
    G8admin.Insertar_producto(8, 'Botines de cuero marrón', 159.99, 128, 'brown_leather_boots.jpg');
    G8admin.Insertar_producto(9, 'Chaqueta de lana gris', 139.99, 129, 'grey_wool_jacket.jpg');
    G8admin.Insertar_producto(10, 'Cartera de mano pequeña de diseño', 79.99, 130, 'designer_small_handbag.jpg');
    G8admin.Insertar_producto(11, 'Ropa de cama para adultos', 99.99, 131, 'adult_bedding.jpg');
    G8admin.Insertar_producto(12, 'Chaqueta de lana con forro de piel', 159.99, 132, 'wool_jacket_with_fur.jpg');
    G8admin.Insertar_producto(13, 'Zapatos de charol para mujer', 149.99, 133, 'women_patent_shoes.jpg');
    G8admin.Insertar_producto(14, 'Gafas de sol con marco dorado', 179.99, 134, 'gold_frame_sunglasses.jpg');
    G8admin.Insertar_producto(15, 'Chaqueta de lana para niños', 109.99, 135, 'kids_wool_jacket.jpg');
    G8admin.Insertar_producto(16, 'Cartera de mano con grabado', 99.99, 136, 'engraved_handbag.jpg');
    G8admin.Insertar_producto(17, 'Reloj analógico con correa de piel', 249.99, 137, 'analog_watch_with_leather_band.jpg');
    G8admin.Insertar_producto(18, 'Chaqueta de lana de mezclilla', 149.99, 138, 'denim_wool_jacket.jpg');
    G8admin.Insertar_producto(19, 'Cartera de mano de diseño exclusivo', 119.99, 139, 'exclusive_design_handbag.jpg');
    G8admin.Insertar_producto(20, 'Chaqueta de lana con detalles en cuero', 159.99, 140, 'wool_jacket_with_leather_details.jpg');
    G8admin.Insertar_producto(1, 'Chaqueta de mezclilla con forro térmico', 139.99, 141, 'thermal_denim_jacket.jpg');
    G8admin.Insertar_producto(2, 'Ropa interior térmica', 49.99, 142, 'thermal_underwear.jpg');
    G8admin.Insertar_producto(3, 'Cartera de cuero de hombre', 99.99, 143, 'mens_leather_wallet.jpg');
    G8admin.Insertar_producto(4, 'Chaqueta de plumas para niños', 149.99, 144, 'kids_down_jacket.jpg');
    G8admin.Insertar_producto(5, 'Zapatos de gamuza para mujer', 139.99, 145, 'womens_suede_shoes.jpg');
    G8admin.Insertar_producto(6, 'Reloj de pulsera con pantalla táctil', 219.99, 146, 'touchscreen_watch.jpg');
    G8admin.Insertar_producto(7, 'Chaqueta de lana con detalles en lana', 149.99, 147, 'wool_jacket_with_details.jpg');
    G8admin.Insertar_producto(8, 'Camisa de seda con estampado geométrico', 129.99, 148, 'geometric_silk_shirt.jpg');
    G8admin.Insertar_producto(9, 'Gafas de sol con lentes espejados', 149.99, 149, 'mirrored_sunglasses.jpg');
    G8admin.Insertar_producto(10, 'Botines de cuero con forro de lana', 159.99, 150, 'leather_boots_with_fleece.jpg');
    G8admin.Insertar_producto(11, 'Chaqueta de mezclilla con bordados', 129.99, 151, 'embroidered_denim_jacket.jpg');
    G8admin.Insertar_producto(12, 'Cartera de mano con detalles en oro', 119.99, 152, 'gold_detailed_handbag.jpg');
    G8admin.Insertar_producto(13, 'Ropa de cama de algodón orgánico', 89.99, 153, 'organic_cotton_bedding.jpg');
    G8admin.Insertar_producto(14, 'Chaqueta de lana con detalles en contraste', 159.99, 154, 'contrast_wool_jacket.jpg');
    G8admin.Insertar_producto(15, 'Zapatos de charol con cierre de hebilla', 169.99, 155, 'patent_shoes_with_buckle.jpg');
    G8admin.Insertar_producto(16, 'Camisa de lino con manga larga', 79.99, 156, 'long_sleeve_linen_shirt.jpg');
    G8admin.Insertar_producto(17, 'Reloj digital con pantalla LED', 179.99, 157, 'led_digital_watch.jpg');
    G8admin.Insertar_producto(18, 'Chaqueta de cuero con acolchado', 179.99, 158, 'padded_leather_jacket.jpg');
    G8admin.Insertar_producto(19, 'Gafas de sol deportivas', 129.99, 159, 'sport_sunglasses.jpg');
    G8admin.Insertar_producto(20, 'Cartera de mano con detalles en plata', 109.99, 160, 'silver_detailed_handbag.jpg');
    G8admin.Insertar_producto(21, 'Chaqueta de lana con estampado', 139.99, 161, 'wool_jacket_with_print.jpg');
    G8admin.Insertar_producto(22, 'Ropa interior de lana', 69.99, 162, 'wool_underwear.jpg');
    G8admin.Insertar_producto(23, 'Botines de charol con detalles', 159.99, 163, 'patent_boots_with_details.jpg');
    G8admin.Insertar_producto(24, 'Chaqueta de lana con forro de terciopelo', 169.99, 164, 'wool_jacket_with_velvet_lining.jpg');
    G8admin.Insertar_producto(25, 'Camisa de algodón con estampado floral', 69.99, 165, 'floral_cotton_shirt.jpg');
    G8admin.Insertar_producto(26, 'Reloj de pulsera con correa de silicona', 129.99, 166, 'silicone_band_watch.jpg');
    G8admin.Insertar_producto(27, 'Chaqueta de plumas con capucha', 159.99, 167, 'hooded_down_jacket.jpg');
    G8admin.Insertar_producto(28, 'Cartera de mano de cuero con monograma', 119.99, 168, 'monogram_leather_handbag.jpg');
    G8admin.Insertar_producto(29, 'Chaqueta de lana con capucha desmontable', 149.99, 169, 'wool_jacket_with_detachable_hood.jpg');
    G8admin.Insertar_producto(30, 'Zapatos de cuero con detalles metálicos', 169.99, 170, 'leather_shoes_with_metal_details.jpg');
    G8admin.Insertar_producto(31, 'Gafas de sol con lentes polarizados', 139.99, 171, 'polarized_lenses_sunglasses.jpg');
    G8admin.Insertar_producto(32, 'Camisa de seda con cuello tipo mao', 119.99, 172, 'mao_collar_silk_shirt.jpg');
    G8admin.Insertar_producto(33, 'Botines de gamuza con detalles en piel', 149.99, 173, 'suede_boots_with_leather_details.jpg');
    G8admin.Insertar_producto(34, 'Chaqueta de mezclilla con cierre de cremallera', 139.99, 174, 'denim_jacket_with_zip.jpg');
    G8admin.Insertar_producto(35, 'Ropa de cama de algodón para niños', 69.99, 175, 'kids_cotton_bedding.jpg');
    G8admin.Insertar_producto(36, 'Chaqueta de lana con detalles en cuero', 159.99, 176, 'wool_jacket_with_leather_details.jpg');
    G8admin.Insertar_producto(37, 'Camisa de lino con estampado a rayas', 79.99, 177, 'striped_linen_shirt.jpg');
    G8admin.Insertar_producto(38, 'Reloj de pulsera con diseño deportivo', 199.99, 178, 'sport_design_wristwatch.jpg');
    G8admin.Insertar_producto(39, 'Chaqueta de cuero con detalles metálicos', 179.99, 179, 'metallic_detail_leather_jacket.jpg');
    G8admin.Insertar_producto(40, 'Cartera de mano con detalles en piel de serpiente', 139.99, 180, 'snake_skin_handbag.jpg');
    G8admin.Insertar_producto(41, 'Zapatos de charol con plantilla de gel', 169.99, 181, 'gel_insole_patent_shoes.jpg');
    G8admin.Insertar_producto(42, 'Gafas de sol con diseño futurista', 159.99, 182, 'futuristic_sunglasses.jpg');
    G8admin.Insertar_producto(43, 'Camisa de seda con estampado de lunares', 129.99, 183, 'polka_dot_silk_shirt.jpg');
    G8admin.Insertar_producto(44, 'Botines de cuero con forro de lana', 159.99, 184, 'leather_boots_with_wool_lining.jpg');
    G8admin.Insertar_producto(45, 'Chaqueta de lana con botones de madera', 149.99, 185, 'wool_jacket_with_wooden_buttons.jpg');
    G8admin.Insertar_producto(46, 'Chaqueta de mezclilla con detalles en cuero', 129.99, 186, 'denim_jacket_with_leather_details.jpg');
    G8admin.Insertar_producto(47, 'Ropa de cama de lino', 99.99, 187, 'linen_bedding.jpg');
    G8admin.Insertar_producto(48, 'Cartera de mano con detalles en plata', 109.99, 188, 'silver_detailed_wallet.jpg');
    G8admin.Insertar_producto(49, 'Camisa de algodón con cuello mao', 59.99, 189, 'mao_collar_cotton_shirt.jpg');
    G8admin.Insertar_producto(50, 'Reloj digital con cronógrafo', 239.99, 190, 'digital_chronograph_watch.jpg');
    G8admin.Insertar_producto(1, 'Chaqueta de lana con forro de piel', 179.99, 191, 'wool_jacket_with_fur_lining.jpg');
    G8admin.Insertar_producto(2, 'Botines de gamuza con plantilla acolchada', 159.99, 192, 'suede_boots_with_padded_insole.jpg');
    G8admin.Insertar_producto(3, 'Chaqueta de cuero con cuello de piel', 189.99, 193, 'leather_jacket_with_fur_collar.jpg');
    G8admin.Insertar_producto(4, 'Gafas de sol con diseño clásico', 129.99, 194, 'classic_sunglasses.jpg');
    G8admin.Insertar_producto(5, 'Camisa de lino con botones de madera', 89.99, 195, 'linen_shirt_with_wooden_buttons.jpg');
    G8admin.Insertar_producto(6, 'Ropa de cama de seda', 149.99, 196, 'silk_bedding.jpg');
    G8admin.Insertar_producto(7, 'Cartera de mano con diseño minimalista', 119.99, 197, 'minimalist_handbag.jpg');
    G8admin.Insertar_producto(8, 'Chaqueta de lana con parches decorativos', 159.99, 198, 'decorative_patch_wool_jacket.jpg');
    G8admin.Insertar_producto(9, 'Zapatos de charol con punta de metal', 179.99, 199, 'metal_tipped_patent_shoes.jpg');
    G8admin.Insertar_producto(10, 'Gafas de sol con diseño retro', 139.99, 200, 'retro_sunglasses.jpg');
    
END;

---- DATOS DE PAIS ----

BEGIN
    G8admin.pais_insertar_SP('Argentina');
    G8admin.pais_insertar_SP('Brasil');
    G8admin.pais_insertar_SP('Chile');
    G8admin.pais_insertar_SP('Colombia');
    G8admin.pais_insertar_SP('México');
    G8admin.pais_insertar_SP('Perú');
    G8admin.pais_insertar_SP('Uruguay');
    G8admin.pais_insertar_SP('Venezuela');
    G8admin.pais_insertar_SP('España');
    G8admin.pais_insertar_SP('Francia');
    G8admin.pais_insertar_SP('Alemania');
    G8admin.pais_insertar_SP('Italia');
    G8admin.pais_insertar_SP('Reino Unido');
    G8admin.pais_insertar_SP('Estados Unidos');
    G8admin.pais_insertar_SP('Canadá');
    G8admin.pais_insertar_SP('Japón');
    G8admin.pais_insertar_SP('China');
    G8admin.pais_insertar_SP('Costa Rica');
    G8admin.pais_insertar_SP('Australia');
    G8admin.pais_insertar_SP('Sudáfrica');
    G8admin.pais_insertar_SP('Nigeria');
    G8admin.pais_insertar_SP('Egipto');
    G8admin.pais_insertar_SP('Arabia Saudita');
    G8admin.pais_insertar_SP('Emiratos Árabes Unidos');
    G8admin.pais_insertar_SP('Israel');
    G8admin.pais_insertar_SP('Turquía');
    G8admin.pais_insertar_SP('Grecia');
    G8admin.pais_insertar_SP('Portugal');
    G8admin.pais_insertar_SP('Suecia');
    G8admin.pais_insertar_SP('Noruega');
    G8admin.pais_insertar_SP('Dinamarca');
    G8admin.pais_insertar_SP('Países Bajos');
    G8admin.pais_insertar_SP('Bélgica');
    G8admin.pais_insertar_SP('Suiza');
    G8admin.pais_insertar_SP('Austria');
    G8admin.pais_insertar_SP('Polonia');
    G8admin.pais_insertar_SP('Hungría');
    G8admin.pais_insertar_SP('República Checa');
    G8admin.pais_insertar_SP('Eslovaquia');
    G8admin.pais_insertar_SP('Rumanía');
    G8admin.pais_insertar_SP('Bulgaria');
    G8admin.pais_insertar_SP('Serbia');
    G8admin.pais_insertar_SP('Croacia');
    G8admin.pais_insertar_SP('Eslovenia');
    G8admin.pais_insertar_SP('Bosnia y Herzegovina');
    G8admin.pais_insertar_SP('Montenegro');
    G8admin.pais_insertar_SP('Macedonia del Norte');
    G8admin.pais_insertar_SP('Albania');
    G8admin.pais_insertar_SP('Líbano');
    G8admin.pais_insertar_SP('Jordania');
    G8admin.pais_insertar_SP('Kuwait');
    G8admin.pais_insertar_SP('Omán');
    G8admin.pais_insertar_SP('Yemen');
    G8admin.pais_insertar_SP('Sri Lanka');
    G8admin.pais_insertar_SP('Malasia');
    G8admin.pais_insertar_SP('Singapur');
END;
/

---- DATOS DE ROL ----

BEGIN
    G8admin.rol_insertar_sp('ROLE_ADMIN');
    G8admin.rol_insertar_sp('ROLE_USER');
END;

---- DATOS DE CAPITAN ----

BEGIN
    G8admin.capitan_insertar_SP('Capitán Roberto Martínez', 48.0, TO_DATE('1976-03-15', 'YYYY-MM-DD'), 25.0, TO_DATE('1999-08-20', 'YYYY-MM-DD'), 12);
    G8admin.capitan_insertar_SP('Capitán Laura González', 37.0, TO_DATE('1987-11-10', 'YYYY-MM-DD'), 15.0, TO_DATE('2009-04-18', 'YYYY-MM-DD'), 45);
    G8admin.capitan_insertar_SP('Capitán Pedro Pérez', 42.0, TO_DATE('1982-06-22', 'YYYY-MM-DD'), 18.0, TO_DATE('2005-10-30', 'YYYY-MM-DD'), 5);
    G8admin.capitan_insertar_SP('Capitán María García', 35.0, TO_DATE('1989-09-05', 'YYYY-MM-DD'), 12.0, TO_DATE('2011-03-25', 'YYYY-MM-DD'), 33);
    G8admin.capitan_insertar_SP('Capitán Juan López', 50.0, TO_DATE('1974-01-18', 'YYYY-MM-DD'), 27.0, TO_DATE('1997-09-14', 'YYYY-MM-DD'), 22);
    G8admin.capitan_insertar_SP('Capitán Sofía Hernández', 39.0, TO_DATE('1985-12-02', 'YYYY-MM-DD'), 14.0, TO_DATE('2010-07-09', 'YYYY-MM-DD'), 7);
    G8admin.capitan_insertar_SP('Capitán Daniel Ramírez', 46.0, TO_DATE('1978-05-29', 'YYYY-MM-DD'), 21.0, TO_DATE('2003-02-16', 'YYYY-MM-DD'), 19);
    G8admin.capitan_insertar_SP('Capitán Paula Jiménez', 43.0, TO_DATE('1981-08-08', 'YYYY-MM-DD'), 20.0, TO_DATE('2004-06-21', 'YYYY-MM-DD'), 25);
    G8admin.capitan_insertar_SP('Capitán José Fernández', 41.0, TO_DATE('1983-03-02', 'YYYY-MM-DD'), 19.0, TO_DATE('2005-11-17', 'YYYY-MM-DD'), 9);
    G8admin.capitan_insertar_SP('Capitán Valeria Ruiz', 36.0, TO_DATE('1988-07-26', 'YYYY-MM-DD'), 11.0, TO_DATE('2013-01-13', 'YYYY-MM-DD'), 56);
    G8admin.capitan_insertar_SP('Capitán Enrique Torres', 45.0, TO_DATE('1979-11-19', 'YYYY-MM-DD'), 23.0, TO_DATE('2001-04-22', 'YYYY-MM-DD'), 34);
    G8admin.capitan_insertar_SP('Capitán Claudia Vega', 40.0, TO_DATE('1984-02-13', 'YYYY-MM-DD'), 17.0, TO_DATE('2007-12-19', 'YYYY-MM-DD'), 18);
    G8admin.capitan_insertar_SP('Capitán Antonio Morales', 38.0, TO_DATE('1986-05-07', 'YYYY-MM-DD'), 16.0, TO_DATE('2008-08-30', 'YYYY-MM-DD'), 23);
    G8admin.capitan_insertar_SP('Capitán Carmen Flores', 44.0, TO_DATE('1980-03-25', 'YYYY-MM-DD'), 22.0, TO_DATE('2002-06-14', 'YYYY-MM-DD'), 6);
    G8admin.capitan_insertar_SP('Capitán Ricardo Álvarez', 47.0, TO_DATE('1977-12-03', 'YYYY-MM-DD'), 24.0, TO_DATE('2000-10-05', 'YYYY-MM-DD'), 16);
    G8admin.capitan_insertar_SP('Capitán Daniela Ortiz', 39.0, TO_DATE('1985-09-21', 'YYYY-MM-DD'), 13.0, TO_DATE('2012-03-28', 'YYYY-MM-DD'), 41);
    G8admin.capitan_insertar_SP('Capitán Santiago Navarro', 42.0, TO_DATE('1982-10-15', 'YYYY-MM-DD'), 19.0, TO_DATE('2005-05-10', 'YYYY-MM-DD'), 2);
    G8admin.capitan_insertar_SP('Capitán Ana Castillo', 37.0, TO_DATE('1987-11-07', 'YYYY-MM-DD'), 14.0, TO_DATE('2010-09-02', 'YYYY-MM-DD'), 28);
    G8admin.capitan_insertar_SP('Capitán Felipe Reyes', 48.0, TO_DATE('1976-06-13', 'YYYY-MM-DD'), 26.0, TO_DATE('1998-02-18', 'YYYY-MM-DD'), 14);
    G8admin.capitan_insertar_SP('Capitán Julieta Soto', 43.0, TO_DATE('1981-01-22', 'YYYY-MM-DD'), 21.0, TO_DATE('2003-11-04', 'YYYY-MM-DD'), 38);
    G8admin.capitan_insertar_SP('Capitán Marcelo Blanco', 49.0, TO_DATE('1975-07-17', 'YYYY-MM-DD'), 27.0, TO_DATE('1997-05-06', 'YYYY-MM-DD'), 8);
    G8admin.capitan_insertar_SP('Capitán Natalia Estrada', 38.0, TO_DATE('1986-11-09', 'YYYY-MM-DD'), 15.0, TO_DATE('2009-07-18', 'YYYY-MM-DD'), 31);
    G8admin.capitan_insertar_SP('Capitán Sebastián Castro', 40.0, TO_DATE('1984-04-12', 'YYYY-MM-DD'), 18.0, TO_DATE('2006-01-14', 'YYYY-MM-DD'), 49);
    G8admin.capitan_insertar_SP('Capitán Liliana Romero', 37.0, TO_DATE('1987-03-28', 'YYYY-MM-DD'), 14.0, TO_DATE('2010-08-12', 'YYYY-MM-DD'), 11);
    G8admin.capitan_insertar_SP('Capitán Javier Ortega', 45.0, TO_DATE('1979-12-11', 'YYYY-MM-DD'), 22.0, TO_DATE('2002-04-02', 'YYYY-MM-DD'), 26);
    G8admin.capitan_insertar_SP('Capitán Gabriela Lara', 39.0, TO_DATE('1985-06-01', 'YYYY-MM-DD'), 16.0, TO_DATE('2008-10-20', 'YYYY-MM-DD'), 21);
    G8admin.capitan_insertar_SP('Capitán Eduardo Núñez', 41.0, TO_DATE('1983-07-30', 'YYYY-MM-DD'), 19.0, TO_DATE('2005-06-25', 'YYYY-MM-DD'), 50);
    G8admin.capitan_insertar_SP('Capitán Mariana Peña', 35.0, TO_DATE('1989-01-19', 'YYYY-MM-DD'), 12.0, TO_DATE('2011-04-27', 'YYYY-MM-DD'), 42);
    G8admin.capitan_insertar_SP('Capitán Francisco Paredes', 48.0, TO_DATE('1976-02-05', 'YYYY-MM-DD'), 25.0, TO_DATE('1999-03-09', 'YYYY-MM-DD'), 4);
    G8admin.capitan_insertar_SP('Capitán Laura Maldonado', 44.0, TO_DATE('1980-05-23', 'YYYY-MM-DD'), 20.0, TO_DATE('2004-02-07', 'YYYY-MM-DD'), 27);
    G8admin.capitan_insertar_SP('Capitán Raúl Ávila', 47.0, TO_DATE('1977-08-14', 'YYYY-MM-DD'), 24.0, TO_DATE('2000-11-25', 'YYYY-MM-DD'), 15);
    G8admin.capitan_insertar_SP('Capitán Andrea Méndez', 36.0, TO_DATE('1988-12-29', 'YYYY-MM-DD'), 13.0, TO_DATE('2012-07-11', 'YYYY-MM-DD'), 37);
    G8admin.capitan_insertar_SP('Capitán Santiago Correa', 42.0, TO_DATE('1982-09-17', 'YYYY-MM-DD'), 19.0, TO_DATE('2005-01-22', 'YYYY-MM-DD'), 20);
    G8admin.capitan_insertar_SP('Capitán Verónica Silva', 39.0, TO_DATE('1985-04-03', 'YYYY-MM-DD'), 17.0, TO_DATE('2007-09-13', 'YYYY-MM-DD'), 30);
    G8admin.capitan_insertar_SP('Capitán Miguel Delgado', 43.0, TO_DATE('1981-11-08', 'YYYY-MM-DD'), 21.0, TO_DATE('2003-03-01', 'YYYY-MM-DD'), 43);
    G8admin.capitan_insertar_SP('Capitán Julia Martínez', 35.0, TO_DATE('1989-02-15', 'YYYY-MM-DD'), 12.0, TO_DATE('2011-11-17', 'YYYY-MM-DD'), 13);
    G8admin.capitan_insertar_SP('Capitán Luis Guzmán', 46.0, TO_DATE('1978-10-07', 'YYYY-MM-DD'), 22.0, TO_DATE('2002-08-04', 'YYYY-MM-DD'), 40);
    G8admin.capitan_insertar_SP('Capitán Elena Soto', 41.0, TO_DATE('1983-06-30', 'YYYY-MM-DD'), 18.0, TO_DATE('2006-12-29', 'YYYY-MM-DD'), 24);
    G8admin.capitan_insertar_SP('Capitán Oscar Durán', 49.0, TO_DATE('1975-09-25', 'YYYY-MM-DD'), 27.0, TO_DATE('1997-05-12', 'YYYY-MM-DD'), 53);
    G8admin.capitan_insertar_SP('Capitán Claudia Ríos', 38.0, TO_DATE('1986-08-11', 'YYYY-MM-DD'), 16.0, TO_DATE('2008-03-08', 'YYYY-MM-DD'), 48);
    G8admin.capitan_insertar_SP('Capitán José Santos', 37.0, TO_DATE('1987-07-22', 'YYYY-MM-DD'), 13.0, TO_DATE('2011-09-30', 'YYYY-MM-DD'), 52);
    G8admin.capitan_insertar_SP('Capitán Carolina Vega', 40.0, TO_DATE('1984-11-16', 'YYYY-MM-DD'), 17.0, TO_DATE('2007-05-04', 'YYYY-MM-DD'), 44);
    G8admin.capitan_insertar_SP('Capitán Diego Peña', 43.0, TO_DATE('1981-03-26', 'YYYY-MM-DD'), 20.0, TO_DATE('2004-08-21', 'YYYY-MM-DD'), 35);
    G8admin.capitan_insertar_SP('Capitán Gabriela Vargas', 36.0, TO_DATE('1988-01-28', 'YYYY-MM-DD'), 12.0, TO_DATE('2012-05-06', 'YYYY-MM-DD'), 36);
    G8admin.capitan_insertar_SP('Capitán Jorge López', 42.0, TO_DATE('1982-12-07', 'YYYY-MM-DD'), 19.0, TO_DATE('2005-07-30', 'YYYY-MM-DD'), 39);
    G8admin.capitan_insertar_SP('Capitán Carmen Ortiz', 35.0, TO_DATE('1989-03-09', 'YYYY-MM-DD'), 13.0, TO_DATE('2011-12-23', 'YYYY-MM-DD'), 29);
    G8admin.capitan_insertar_SP('Capitán Ricardo Sánchez', 47.0, TO_DATE('1977-01-14', 'YYYY-MM-DD'), 25.0, TO_DATE('1999-06-17', 'YYYY-MM-DD'), 32);
    G8admin.capitan_insertar_SP('Capitán Patricia Flores', 39.0, TO_DATE('1985-05-05', 'YYYY-MM-DD'), 15.0, TO_DATE('2009-10-13', 'YYYY-MM-DD'), 3);
    G8admin.capitan_insertar_SP('Capitán Alejandro Herrera', 41.0, TO_DATE('1983-02-19', 'YYYY-MM-DD'), 18.0, TO_DATE('2006-06-09', 'YYYY-MM-DD'), 46);
    G8admin.capitan_insertar_SP('Capitán Sonia Ramírez', 44.0, TO_DATE('1980-09-21', 'YYYY-MM-DD'), 21.0, TO_DATE('2003-11-16', 'YYYY-MM-DD'), 51);
    G8admin.capitan_insertar_SP('Capitán Nicolás Castro', 48.0, TO_DATE('1976-04-23', 'YYYY-MM-DD'), 25.0, TO_DATE('1999-02-14', 'YYYY-MM-DD'), 13);
    G8admin.capitan_insertar_SP('Capitán Paula Gómez', 36.0, TO_DATE('1988-07-12', 'YYYY-MM-DD'), 14.0, TO_DATE('2010-11-30', 'YYYY-MM-DD'), 22);
    G8admin.capitan_insertar_SP('Capitán Luis Rodríguez', 41.0, TO_DATE('1983-10-06', 'YYYY-MM-DD'), 20.0, TO_DATE('2004-04-18', 'YYYY-MM-DD'), 26);
    G8admin.capitan_insertar_SP('Capitán Marcela Soto', 39.0, TO_DATE('1985-09-25', 'YYYY-MM-DD'), 17.0, TO_DATE('2007-08-12', 'YYYY-MM-DD'), 33);
    G8admin.capitan_insertar_SP('Capitán Roberto Jiménez', 45.0, TO_DATE('1979-03-08', 'YYYY-MM-DD'), 22.0, TO_DATE('2002-01-03', 'YYYY-MM-DD'), 44);
    G8admin.capitan_insertar_SP('Capitán Daniela Morales', 37.0, TO_DATE('1987-11-21', 'YYYY-MM-DD'), 15.0, TO_DATE('2010-06-09', 'YYYY-MM-DD'), 19);
    G8admin.capitan_insertar_SP('Capitán Francisco Salgado', 49.0, TO_DATE('1975-12-30', 'YYYY-MM-DD'), 28.0, TO_DATE('1996-05-16', 'YYYY-MM-DD'), 5);
    G8admin.capitan_insertar_SP('Capitán Valentina Aguirre', 38.0, TO_DATE('1986-10-14', 'YYYY-MM-DD'), 16.0, TO_DATE('2008-02-07', 'YYYY-MM-DD'), 53);
    G8admin.capitan_insertar_SP('Capitán Alejandro Mendoza', 40.0, TO_DATE('1984-05-22', 'YYYY-MM-DD'), 18.0, TO_DATE('2006-11-11', 'YYYY-MM-DD'), 28);
    G8admin.capitan_insertar_SP('Capitán Mariana Castro', 42.0, TO_DATE('1982-06-19', 'YYYY-MM-DD'), 20.0, TO_DATE('2004-10-05', 'YYYY-MM-DD'), 16);
    G8admin.capitan_insertar_SP('Capitán Manuel Soto', 45.0, TO_DATE('1979-08-25', 'YYYY-MM-DD'), 23.0, TO_DATE('2001-12-30', 'YYYY-MM-DD'), 7);
    G8admin.capitan_insertar_SP('Capitán Andrea Gómez', 37.0, TO_DATE('1987-05-03', 'YYYY-MM-DD'), 14.0, TO_DATE('2010-04-23', 'YYYY-MM-DD'), 31);
    G8admin.capitan_insertar_SP('Capitán Diego López', 39.0, TO_DATE('1985-06-17', 'YYYY-MM-DD'), 16.0, TO_DATE('2008-09-12', 'YYYY-MM-DD'), 6);
    G8admin.capitan_insertar_SP('Capitán Carolina Reyes', 41.0, TO_DATE('1983-12-09', 'YYYY-MM-DD'), 19.0, TO_DATE('2005-08-21', 'YYYY-MM-DD'), 25);
    G8admin.capitan_insertar_SP('Capitán Sergio Fernández', 44.0, TO_DATE('1980-01-26', 'YYYY-MM-DD'), 22.0, TO_DATE('2003-06-12', 'YYYY-MM-DD'), 20);
    G8admin.capitan_insertar_SP('Capitán Laura Hernández', 35.0, TO_DATE('1989-10-30', 'YYYY-MM-DD'), 13.0, TO_DATE('2011-07-29', 'YYYY-MM-DD'), 11);
    G8admin.capitan_insertar_SP('Capitán Alejandro Rodríguez', 48.0, TO_DATE('1976-07-15', 'YYYY-MM-DD'), 26.0, TO_DATE('1998-03-20', 'YYYY-MM-DD'), 52);
    G8admin.capitan_insertar_SP('Capitán Paula Rodríguez', 38.0, TO_DATE('1986-02-22', 'YYYY-MM-DD'), 16.0, TO_DATE('2009-06-30', 'YYYY-MM-DD'), 44);
    G8admin.capitan_insertar_SP('Capitán Luis Miranda', 40.0, TO_DATE('1984-09-14', 'YYYY-MM-DD'), 18.0, TO_DATE('2006-05-08', 'YYYY-MM-DD'), 49);
    G8admin.capitan_insertar_SP('Capitán Natalia Moreno', 43.0, TO_DATE('1981-03-10', 'YYYY-MM-DD'), 21.0, TO_DATE('2002-11-11', 'YYYY-MM-DD'), 33);
    G8admin.capitan_insertar_SP('Capitán Juan Guzmán', 46.0, TO_DATE('1978-08-29', 'YYYY-MM-DD'), 23.0, TO_DATE('2000-04-06', 'YYYY-MM-DD'), 41);
    G8admin.capitan_insertar_SP('Capitán Mariana Álvarez', 37.0, TO_DATE('1987-04-20', 'YYYY-MM-DD'), 14.0, TO_DATE('2010-09-15', 'YYYY-MM-DD'), 9);
    G8admin.capitan_insertar_SP('Capitán Ricardo Gómez', 44.0, TO_DATE('1980-12-18', 'YYYY-MM-DD'), 21.0, TO_DATE('2003-07-11', 'YYYY-MM-DD'), 45);
    G8admin.capitan_insertar_SP('Capitán Gabriela López', 42.0, TO_DATE('1982-10-01', 'YYYY-MM-DD'), 19.0, TO_DATE('2004-05-22', 'YYYY-MM-DD'), 32);
    G8admin.capitan_insertar_SP('Capitán Luis Morales', 39.0, TO_DATE('1985-03-11', 'YYYY-MM-DD'), 17.0, TO_DATE('2007-02-16', 'YYYY-MM-DD'), 38);
    G8admin.capitan_insertar_SP('Capitán Carolina Vargas', 41.0, TO_DATE('1983-08-20', 'YYYY-MM-DD'), 20.0, TO_DATE('2005-03-05', 'YYYY-MM-DD'), 24);
    G8admin.capitan_insertar_SP('Capitán José Rodríguez', 46.0, TO_DATE('1978-02-03', 'YYYY-MM-DD'), 23.0, TO_DATE('2000-09-12', 'YYYY-MM-DD'), 54);
    G8admin.capitan_insertar_SP('Capitán Marcela Vega', 35.0, TO_DATE('1989-06-14', 'YYYY-MM-DD'), 12.0, TO_DATE('2011-01-22', 'YYYY-MM-DD'), 47);
    G8admin.capitan_insertar_SP('Capitán Diego Salazar', 38.0, TO_DATE('1986-12-09', 'YYYY-MM-DD'), 16.0, TO_DATE('2009-04-03', 'YYYY-MM-DD'), 23);
    G8admin.capitan_insertar_SP('Capitán Valeria Herrera', 43.0, TO_DATE('1981-11-29', 'YYYY-MM-DD'), 21.0, TO_DATE('2002-10-18', 'YYYY-MM-DD'), 18);
    G8admin.capitan_insertar_SP('Capitán Pablo Muñoz', 50.0, TO_DATE('1974-05-10', 'YYYY-MM-DD'), 29.0, TO_DATE('1995-09-15', 'YYYY-MM-DD'), 48);
    G8admin.capitan_insertar_SP('Capitán Catalina Torres', 37.0, TO_DATE('1987-09-07', 'YYYY-MM-DD'), 14.0, TO_DATE('2010-02-18', 'YYYY-MM-DD'), 50);
    G8admin.capitan_insertar_SP('Capitán Javier Muñoz', 39.0, TO_DATE('1985-06-25', 'YYYY-MM-DD'), 16.0, TO_DATE('2007-11-22', 'YYYY-MM-DD'), 22);
    G8admin.capitan_insertar_SP('Capitán Alejandra González', 42.0, TO_DATE('1982-04-12', 'YYYY-MM-DD'), 19.0, TO_DATE('2004-08-15', 'YYYY-MM-DD'), 37);
    G8admin.capitan_insertar_SP('Capitán Sergio Ortega', 47.0, TO_DATE('1977-01-20', 'YYYY-MM-DD'), 26.0, TO_DATE('1998-11-02', 'YYYY-MM-DD'), 30);
    G8admin.capitan_insertar_SP('Capitán Laura Ramírez', 40.0, TO_DATE('1984-03-27', 'YYYY-MM-DD'), 18.0, TO_DATE('2006-07-09', 'YYYY-MM-DD'), 21);
    G8admin.capitan_insertar_SP('Capitán Carlos Vargas', 44.0, TO_DATE('1980-02-11', 'YYYY-MM-DD'), 22.0, TO_DATE('2003-05-18', 'YYYY-MM-DD'), 29);
    G8admin.capitan_insertar_SP('Capitán Natalia Fernández', 38.0, TO_DATE('1986-12-31', 'YYYY-MM-DD'), 16.0, TO_DATE('2009-03-25', 'YYYY-MM-DD'), 18);
    G8admin.capitan_insertar_SP('Capitán Andrés Rodríguez', 42.0, TO_DATE('1982-05-09', 'YYYY-MM-DD'), 19.0, TO_DATE('2004-06-13', 'YYYY-MM-DD'), 6);
    G8admin.capitan_insertar_SP('Capitán Carolina Martínez', 35.0, TO_DATE('1989-02-15', 'YYYY-MM-DD'), 13.0, TO_DATE('2011-10-17', 'YYYY-MM-DD'), 10);
    G8admin.capitan_insertar_SP('Capitán José Martínez', 49.0, TO_DATE('1975-10-10', 'YYYY-MM-DD'), 27.0, TO_DATE('1997-04-23', 'YYYY-MM-DD'), 54);
    G8admin.capitan_insertar_SP('Capitán Verónica Rodríguez', 41.0, TO_DATE('1983-06-14', 'YYYY-MM-DD'), 20.0, TO_DATE('2005-12-30', 'YYYY-MM-DD'), 17);
    G8admin.capitan_insertar_SP('Capitán Miguel Ángel Silva', 39.0, TO_DATE('1985-08-22', 'YYYY-MM-DD'), 17.0, TO_DATE('2007-06-15', 'YYYY-MM-DD'), 14);
    G8admin.capitan_insertar_SP('Capitán Claudia Ramírez', 36.0, TO_DATE('1988-03-03', 'YYYY-MM-DD'), 14.0, TO_DATE('2010-11-10', 'YYYY-MM-DD'), 44);
    G8admin.capitan_insertar_SP('Capitán Andrés Gómez', 48.0, TO_DATE('1976-09-05', 'YYYY-MM-DD'), 26.0, TO_DATE('1998-01-15', 'YYYY-MM-DD'), 31);
    G8admin.capitan_insertar_SP('Capitán Paula Fernández', 37.0, TO_DATE('1987-01-16', 'YYYY-MM-DD'), 15.0, TO_DATE('2010-04-12', 'YYYY-MM-DD'), 25);
    G8admin.capitan_insertar_SP('Capitán Javier Torres', 50.0, TO_DATE('1974-07-29', 'YYYY-MM-DD'), 28.0, TO_DATE('1996-06-05', 'YYYY-MM-DD'), 3);
    G8admin.capitan_insertar_SP('Capitán Alejandra Mendoza', 43.0, TO_DATE('1981-11-11', 'YYYY-MM-DD'), 21.0, TO_DATE('2002-09-16', 'YYYY-MM-DD'), 45);
    G8admin.capitan_insertar_SP('Capitán Sergio Castro', 38.0, TO_DATE('1986-05-20', 'YYYY-MM-DD'), 16.0, TO_DATE('2009-01-09', 'YYYY-MM-DD'), 2);
    G8admin.capitan_insertar_SP('Capitán Gabriela Soto', 35.0, TO_DATE('1989-12-10', 'YYYY-MM-DD'), 13.0, TO_DATE('2011-05-16', 'YYYY-MM-DD'), 12);
    G8admin.capitan_insertar_SP('Capitán Nicolás López', 44.0, TO_DATE('1980-04-14', 'YYYY-MM-DD'), 22.0, TO_DATE('2003-02-11', 'YYYY-MM-DD'), 56);
    G8admin.capitan_insertar_SP('Capitán Mariana González', 40.0, TO_DATE('1984-08-18', 'YYYY-MM-DD'), 18.0, TO_DATE('2006-09-03', 'YYYY-MM-DD'), 50);
    G8admin.capitan_insertar_SP('Capitán Ricardo Salgado', 42.0, TO_DATE('1982-03-27', 'YYYY-MM-DD'), 19.0, TO_DATE('2004-12-14', 'YYYY-MM-DD'), 8);
    G8admin.capitan_insertar_SP('Capitán Laura Martínez', 35.0, TO_DATE('1989-07-01', 'YYYY-MM-DD'), 13.0, TO_DATE('2011-06-17', 'YYYY-MM-DD'), 37);
    G8admin.capitan_insertar_SP('Capitán Andrés Salazar', 41.0, TO_DATE('1983-02-21', 'YYYY-MM-DD'), 20.0, TO_DATE('2005-03-25', 'YYYY-MM-DD'), 21);
    G8admin.capitan_insertar_SP('Capitán Alejandra Ortega', 46.0, TO_DATE('1978-09-12', 'YYYY-MM-DD'), 24.0, TO_DATE('2000-07-19', 'YYYY-MM-DD'), 10);
    G8admin.capitan_insertar_SP('Capitán José Rodríguez', 37.0, TO_DATE('1987-04-08', 'YYYY-MM-DD'), 15.0, TO_DATE('2010-02-22', 'YYYY-MM-DD'), 5);
    G8admin.capitan_insertar_SP('Capitán Gabriela Martínez', 35.0, TO_DATE('1989-06-23', 'YYYY-MM-DD'), 13.0, TO_DATE('2011-04-15', 'YYYY-MM-DD'), 54);
    G8admin.capitan_insertar_SP('Capitán Luis Sánchez', 48.0, TO_DATE('1976-12-29', 'YYYY-MM-DD'), 27.0, TO_DATE('1997-11-04', 'YYYY-MM-DD'), 21);
    G8admin.capitan_insertar_SP('Capitán Valentina Pérez', 42.0, TO_DATE('1982-11-05', 'YYYY-MM-DD'), 20.0, TO_DATE('2004-06-07', 'YYYY-MM-DD'), 34);
    G8admin.capitan_insertar_SP('Capitán Javier González', 50.0, TO_DATE('1974-10-30', 'YYYY-MM-DD'), 29.0, TO_DATE('1995-07-21', 'YYYY-MM-DD'), 23);
    G8admin.capitan_insertar_SP('Capitán Patricia Rodríguez', 37.0, TO_DATE('1987-08-14', 'YYYY-MM-DD'), 14.0, TO_DATE('2010-01-18', 'YYYY-MM-DD'), 18);
    G8admin.capitan_insertar_SP('Capitán Ricardo Martínez', 41.0, TO_DATE('1983-11-06', 'YYYY-MM-DD'), 19.0, TO_DATE('2005-05-14', 'YYYY-MM-DD'), 8);
    G8admin.capitan_insertar_SP('Capitán Claudia Ortega', 35.0, TO_DATE('1989-01-25', 'YYYY-MM-DD'), 12.0, TO_DATE('2011-08-29', 'YYYY-MM-DD'), 12);
    G8admin.capitan_insertar_SP('Capitán Sergio Fernández', 44.0, TO_DATE('1980-04-30', 'YYYY-MM-DD'), 22.0, TO_DATE('2003-03-15', 'YYYY-MM-DD'), 28);
    G8admin.capitan_insertar_SP('Capitán Andrés Ramírez', 38.0, TO_DATE('1986-07-20', 'YYYY-MM-DD'), 16.0, TO_DATE('2009-09-14', 'YYYY-MM-DD'), 10);
    G8admin.capitan_insertar_SP('Capitán Gabriela Torres', 42.0, TO_DATE('1982-09-28', 'YYYY-MM-DD'), 20.0, TO_DATE('2004-01-16', 'YYYY-MM-DD'), 16);
    G8admin.capitan_insertar_SP('Capitán Luis Fernández', 49.0, TO_DATE('1975-03-02', 'YYYY-MM-DD'), 28.0, TO_DATE('1996-07-23', 'YYYY-MM-DD'), 33);
    G8admin.capitan_insertar_SP('Capitán Valeria González', 39.0, TO_DATE('1985-01-14', 'YYYY-MM-DD'), 17.0, TO_DATE('2007-12-31', 'YYYY-MM-DD'), 20);
    G8admin.capitan_insertar_SP('Capitán Paula Ortega', 35.0, TO_DATE('1989-06-28', 'YYYY-MM-DD'), 13.0, TO_DATE('2011-02-20', 'YYYY-MM-DD'), 55);
    G8admin.capitan_insertar_SP('Capitán Daniel Gómez', 47.0, TO_DATE('1977-09-21', 'YYYY-MM-DD'), 26.0, TO_DATE('1998-12-14', 'YYYY-MM-DD'), 11);
    G8admin.capitan_insertar_SP('Capitán Sofía Martínez', 34.0, TO_DATE('1990-06-10', 'YYYY-MM-DD'), 12.0, TO_DATE('2012-05-22', 'YYYY-MM-DD'), 16);
    G8admin.capitan_insertar_SP('Capitán Alejandro Ramírez', 40.0, TO_DATE('1984-02-01', 'YYYY-MM-DD'), 18.0, TO_DATE('2006-11-09', 'YYYY-MM-DD'), 29);
    G8admin.capitan_insertar_SP('Capitán Mariana López', 45.0, TO_DATE('1979-07-15', 'YYYY-MM-DD'), 23.0, TO_DATE('2001-12-30', 'YYYY-MM-DD'), 27);
    G8admin.capitan_insertar_SP('Capitán Esteban Morales', 38.0, TO_DATE('1986-03-12', 'YYYY-MM-DD'), 16.0, TO_DATE('2009-04-17', 'YYYY-MM-DD'), 50);
    G8admin.capitan_insertar_SP('Capitán Catalina Torres', 42.0, TO_DATE('1982-11-08', 'YYYY-MM-DD'), 20.0, TO_DATE('2004-09-21', 'YYYY-MM-DD'), 35);
    G8admin.capitan_insertar_SP('Capitán Rodrigo López', 49.0, TO_DATE('1975-08-19', 'YYYY-MM-DD'), 28.0, TO_DATE('1997-10-02', 'YYYY-MM-DD'), 23);
    G8admin.capitan_insertar_SP('Capitán Sara Vargas', 37.0, TO_DATE('1987-02-22', 'YYYY-MM-DD'), 15.0, TO_DATE('2010-07-05', 'YYYY-MM-DD'), 10);
    G8admin.capitan_insertar_SP('Capitán Felipe Fernández', 39.0, TO_DATE('1985-12-03', 'YYYY-MM-DD'), 17.0, TO_DATE('2007-08-27', 'YYYY-MM-DD'), 42);
    G8admin.capitan_insertar_SP('Capitán Camila Pérez', 44.0, TO_DATE('1980-09-15', 'YYYY-MM-DD'), 22.0, TO_DATE('2003-11-20', 'YYYY-MM-DD'), 55);
    G8admin.capitan_insertar_SP('Capitán Ricardo López', 41.0, TO_DATE('1983-01-13', 'YYYY-MM-DD'), 19.0, TO_DATE('2005-03-15', 'YYYY-MM-DD'), 32);
    G8admin.capitan_insertar_SP('Capitán Julia Ramírez', 45.0, TO_DATE('1979-11-29', 'YYYY-MM-DD'), 23.0, TO_DATE('2001-10-11', 'YYYY-MM-DD'), 11);
    G8admin.capitan_insertar_SP('Capitán Tomás González', 38.0, TO_DATE('1986-04-22', 'YYYY-MM-DD'), 16.0, TO_DATE('2009-12-06', 'YYYY-MM-DD'), 40);
    G8admin.capitan_insertar_SP('Capitán Natalia López', 34.0, TO_DATE('1990-08-30', 'YYYY-MM-DD'), 12.0, TO_DATE('2012-01-11', 'YYYY-MM-DD'), 47);
    G8admin.capitan_insertar_SP('Capitán Gabriel Fernández', 41.0, TO_DATE('1983-10-17', 'YYYY-MM-DD'), 19.0, TO_DATE('2005-06-04', 'YYYY-MM-DD'), 22);
    G8admin.capitan_insertar_SP('Capitán Valeria Ramírez', 39.0, TO_DATE('1985-05-23', 'YYYY-MM-DD'), 17.0, TO_DATE('2007-09-14', 'YYYY-MM-DD'), 28);
    G8admin.capitan_insertar_SP('Capitán Diego Martínez', 50.0, TO_DATE('1974-12-01', 'YYYY-MM-DD'), 29.0, TO_DATE('1995-02-20', 'YYYY-MM-DD'), 51);
    G8admin.capitan_insertar_SP('Capitán Laura González', 37.0, TO_DATE('1987-06-13', 'YYYY-MM-DD'), 14.0, TO_DATE('2010-09-25', 'YYYY-MM-DD'), 25);
    G8admin.capitan_insertar_SP('Capitán Camilo Rodríguez', 44.0, TO_DATE('1980-03-18', 'YYYY-MM-DD'), 22.0, TO_DATE('2003-07-30', 'YYYY-MM-DD'), 11);
    G8admin.capitan_insertar_SP('Capitán Adriana López', 42.0, TO_DATE('1982-02-05', 'YYYY-MM-DD'), 20.0, TO_DATE('2004-06-17', 'YYYY-MM-DD'), 50);
    G8admin.capitan_insertar_SP('Capitán Santiago Morales', 39.0, TO_DATE('1985-11-09', 'YYYY-MM-DD'), 17.0, TO_DATE('2007-05-14', 'YYYY-MM-DD'), 28);
    G8admin.capitan_insertar_SP('Capitán Mariana Sánchez', 47.0, TO_DATE('1977-12-24', 'YYYY-MM-DD'), 26.0, TO_DATE('1998-11-21', 'YYYY-MM-DD'), 32);
    G8admin.capitan_insertar_SP('Capitán Fernando Fernández', 45.0, TO_DATE('1979-07-03', 'YYYY-MM-DD'), 23.0, TO_DATE('2001-04-18', 'YYYY-MM-DD'), 43);
    G8admin.capitan_insertar_SP('Capitán Juliana Pérez', 34.0, TO_DATE('1990-03-12', 'YYYY-MM-DD'), 12.0, TO_DATE('2012-07-05', 'YYYY-MM-DD'), 9);
    G8admin.capitan_insertar_SP('Capitán Andrés Pérez', 41.0, TO_DATE('1983-11-22', 'YYYY-MM-DD'), 19.0, TO_DATE('2005-09-13', 'YYYY-MM-DD'), 17);
    G8admin.capitan_insertar_SP('Capitán Carolina González', 38.0, TO_DATE('1986-06-17', 'YYYY-MM-DD'), 16.0, TO_DATE('2009-03-11', 'YYYY-MM-DD'), 20);
    G8admin.capitan_insertar_SP('Capitán Tomás Fernández', 49.0, TO_DATE('1975-01-28', 'YYYY-MM-DD'), 28.0, TO_DATE('1997-09-05', 'YYYY-MM-DD'), 33);
    G8admin.capitan_insertar_SP('Capitán Elena Martínez', 35.0, TO_DATE('1989-10-10', 'YYYY-MM-DD'), 13.0, TO_DATE('2011-12-15', 'YYYY-MM-DD'), 52);
    G8admin.capitan_insertar_SP('Capitán Ricardo Salgado', 42.0, TO_DATE('1982-05-20', 'YYYY-MM-DD'), 20.0, TO_DATE('2004-11-25', 'YYYY-MM-DD'), 12);
    G8admin.capitan_insertar_SP('Capitán Alejandro Vargas', 44.0, TO_DATE('1980-10-30', 'YYYY-MM-DD'), 22.0, TO_DATE('2003-04-16', 'YYYY-MM-DD'), 7);
    G8admin.capitan_insertar_SP('Capitán Laura Pérez', 41.0, TO_DATE('1983-06-12', 'YYYY-MM-DD'), 19.0, TO_DATE('2005-01-05', 'YYYY-MM-DD'), 26);
    G8admin.capitan_insertar_SP('Capitán Manuel Morales', 39.0, TO_DATE('1985-04-08', 'YYYY-MM-DD'), 17.0, TO_DATE('2007-10-21', 'YYYY-MM-DD'), 8);
    G8admin.capitan_insertar_SP('Capitán Sara Gómez', 34.0, TO_DATE('1990-09-14', 'YYYY-MM-DD'), 12.0, TO_DATE('2012-06-30', 'YYYY-MM-DD'), 35);
    G8admin.capitan_insertar_SP('Capitán Julián Ramírez', 47.0, TO_DATE('1977-11-23', 'YYYY-MM-DD'), 26.0, TO_DATE('1998-08-18', 'YYYY-MM-DD'), 42);
    G8admin.capitan_insertar_SP('Capitán Isabel Rodríguez', 45.0, TO_DATE('1979-12-05', 'YYYY-MM-DD'), 23.0, TO_DATE('2001-03-15', 'YYYY-MM-DD'), 20);
    G8admin.capitan_insertar_SP('Capitán Javier González', 38.0, TO_DATE('1986-01-29', 'YYYY-MM-DD'), 16.0, TO_DATE('2009-11-05', 'YYYY-MM-DD'), 29);
    G8admin.capitan_insertar_SP('Capitán Patricia López', 35.0, TO_DATE('1989-07-18', 'YYYY-MM-DD'), 13.0, TO_DATE('2011-02-02', 'YYYY-MM-DD'), 31);
    G8admin.capitan_insertar_SP('Capitán Sergio Martínez', 42.0, TO_DATE('1982-08-25', 'YYYY-MM-DD'), 20.0, TO_DATE('2004-10-10', 'YYYY-MM-DD'), 41);
    G8admin.capitan_insertar_SP('Capitán Angela Pérez', 50.0, TO_DATE('1974-05-14', 'YYYY-MM-DD'), 29.0, TO_DATE('1995-01-10', 'YYYY-MM-DD'), 46);
    G8admin.capitan_insertar_SP('Capitán Cristian López', 39.0, TO_DATE('1985-09-20', 'YYYY-MM-DD'), 17.0, TO_DATE('2007-06-22', 'YYYY-MM-DD'), 22);
    G8admin.capitan_insertar_SP('Capitán Paola Vargas', 43.0, TO_DATE('1981-02-18', 'YYYY-MM-DD'), 21.0, TO_DATE('2002-08-07', 'YYYY-MM-DD'), 34);
    G8admin.capitan_insertar_SP('Capitán Eduardo Rodríguez', 45.0, TO_DATE('1979-03-04', 'YYYY-MM-DD'), 23.0, TO_DATE('2001-05-14', 'YYYY-MM-DD'), 8);
    G8admin.capitan_insertar_SP('Capitán Carolina Ramírez', 37.0, TO_DATE('1987-01-20', 'YYYY-MM-DD'), 14.0, TO_DATE('2010-10-02', 'YYYY-MM-DD'), 17);
    G8admin.capitan_insertar_SP('Capitán Andrés Gómez', 49.0, TO_DATE('1975-06-25', 'YYYY-MM-DD'), 28.0, TO_DATE('1997-12-01', 'YYYY-MM-DD'), 14);
    G8admin.capitan_insertar_SP('Capitán Natalia Rodríguez', 34.0, TO_DATE('1990-11-11', 'YYYY-MM-DD'), 12.0, TO_DATE('2012-08-05', 'YYYY-MM-DD'), 55);
    G8admin.capitan_insertar_SP('Capitán Felipe Pérez', 40.0, TO_DATE('1984-07-19', 'YYYY-MM-DD'), 18.0, TO_DATE('2006-06-29', 'YYYY-MM-DD'), 21);
    G8admin.capitan_insertar_SP('Capitán Juan Salgado', 41.0, TO_DATE('1983-04-09', 'YYYY-MM-DD'), 19.0, TO_DATE('2005-01-18', 'YYYY-MM-DD'), 40);
    G8admin.capitan_insertar_SP('Capitán Paula Gómez', 37.0, TO_DATE('1987-10-22', 'YYYY-MM-DD'), 14.0, TO_DATE('2010-12-12', 'YYYY-MM-DD'), 37);
    G8admin.capitan_insertar_SP('Capitán Laura Salgado', 34.0, TO_DATE('1990-04-14', 'YYYY-MM-DD'), 12.0, TO_DATE('2012-05-10', 'YYYY-MM-DD'), 12);
    G8admin.capitan_insertar_SP('Capitán Manuel González', 45.0, TO_DATE('1979-10-31', 'YYYY-MM-DD'), 23.0, TO_DATE('2001-06-05', 'YYYY-MM-DD'), 38);
    G8admin.capitan_insertar_SP('Capitán Valentina Martínez', 39.0, TO_DATE('1985-03-15', 'YYYY-MM-DD'), 17.0, TO_DATE('2007-04-25', 'YYYY-MM-DD'), 29);
    G8admin.capitan_insertar_SP('Capitán Alejandro García', 50.0, TO_DATE('1974-10-10', 'YYYY-MM-DD'), 29.0, TO_DATE('1995-05-12', 'YYYY-MM-DD'), 33);
    G8admin.capitan_insertar_SP('Capitán Angela Salgado', 43.0, TO_DATE('1981-05-25', 'YYYY-MM-DD'), 21.0, TO_DATE('2002-12-18', 'YYYY-MM-DD'), 50);
END;


---- DATOS DE BUQUE ----



BEGIN
  buque_insertar_SP('Santa Maria', 'Activo', 50000, 120, 85);
  buque_insertar_SP('Endeavour', 'Activo', 45000, 54, 170);
  buque_insertar_SP('HMS Victory', 'Inactivo', 60000, 3, 90);
  buque_insertar_SP('USS Constitution', 'Activo', 70000, 78, 102);
  buque_insertar_SP('Bismarck', 'Activo', 55000, 199, 66);
  buque_insertar_SP('Queen Mary 2', 'Activo', 80000, 143, 34);
  buque_insertar_SP('Titanic', 'Inactivo', 30000, 65, 45);
  buque_insertar_SP('USS Missouri', 'Activo', 90000, 132, 15);
  buque_insertar_SP('Yamato', 'Activo', 95000, 98, 67);
  buque_insertar_SP('HMS Dreadnought', 'Inactivo', 40000, 23, 153);
  buque_insertar_SP('USS Enterprise', 'Activo', 75000, 175, 89);
  buque_insertar_SP('KMS Tirpitz', 'Activo', 60000, 85, 120);
  buque_insertar_SP('USS Arizona', 'Inactivo', 67000, 190, 111);
  buque_insertar_SP('Aurora', 'Activo', 32000, 48, 47);
  buque_insertar_SP('Bismarck', 'Activo', 58000, 162, 21);
  buque_insertar_SP('USS Iowa', 'Activo', 73000, 72, 104);
  buque_insertar_SP('HMS Belfast', 'Inactivo', 36000, 81, 60);
  buque_insertar_SP('KMS Scharnhorst', 'Activo', 68000, 101, 116);
  buque_insertar_SP('USS Indianapolis', 'Inactivo', 52000, 137, 139);
  buque_insertar_SP('HMS Hood', 'Activo', 70000, 55, 75);
  buque_insertar_SP('USS Nautilus', 'Activo', 90000, 180, 130);
  buque_insertar_SP('USS Nimitz', 'Activo', 95000, 144, 78);
  buque_insertar_SP('Charles de Gaulle', 'Activo', 62000, 49, 19);
  buque_insertar_SP('KMS Prinz Eugen', 'Activo', 84000, 171, 89);
  buque_insertar_SP('USS Lexington', 'Inactivo', 53000, 66, 117);
  buque_insertar_SP('USS Yorktown', 'Activo', 67000, 112, 33);
  buque_insertar_SP('USS Saratoga', 'Inactivo', 45000, 74, 165);
  buque_insertar_SP('HMS Prince of Wales', 'Activo', 91000, 88, 24);
  buque_insertar_SP('USS Hornet', 'Activo', 78000, 121, 38);
  buque_insertar_SP('HMS King George V', 'Activo', 83000, 141, 55);
  buque_insertar_SP('USS Ranger', 'Activo', 69000, 96, 137);
  buque_insertar_SP('HMS Renown', 'Inactivo', 55000, 43, 25);
  buque_insertar_SP('HMS Repulse', 'Activo', 89000, 178, 59);
  buque_insertar_SP('USS Nevada', 'Activo', 76000, 129, 114);
  buque_insertar_SP('KMS Admiral Graf Spee', 'Inactivo', 64000, 20, 10);
  buque_insertar_SP('HMS Warspite', 'Activo', 88000, 35, 80);
  buque_insertar_SP('HMS Rodney', 'Activo', 91000, 17, 36);
  buque_insertar_SP('HMS Nelson', 'Activo', 82000, 154, 108);
  buque_insertar_SP('USS New Jersey', 'Activo', 68000, 105, 130);
  buque_insertar_SP('HMS Indomitable', 'Inactivo', 59000, 115, 14);
  buque_insertar_SP('USS Alaska', 'Activo', 97000, 97, 93);
  buque_insertar_SP('HMS Illustrious', 'Activo', 72000, 30, 57);
  buque_insertar_SP('HMS Formidable', 'Activo', 81000, 67, 101);
  buque_insertar_SP('USS South Dakota', 'Activo', 88000, 125, 140);
  buque_insertar_SP('HMS Queen Elizabeth', 'Activo', 96000, 44, 131);
  buque_insertar_SP('HMS Barham', 'Inactivo', 65000, 91, 123);
  buque_insertar_SP('HMS Courageous', 'Activo', 74000, 110, 43);
  buque_insertar_SP('USS Wasp', 'Activo', 86000, 179, 15);
  buque_insertar_SP('HMS Argus', 'Inactivo', 58000, 151, 70);
  buque_insertar_SP('USS Bunker Hill', 'Activo', 94000, 164, 48);
  buque_insertar_SP('HMS Vanguard', 'Activo', 87000, 176, 91);
  buque_insertar_SP('HMS Iron Duke', 'Activo', 70000, 136, 125);
  buque_insertar_SP('USS Essex', 'Inactivo', 75000, 8, 40);
  buque_insertar_SP('USS Ticonderoga', 'Activo', 91000, 166, 53);
  buque_insertar_SP('HMS Invincible', 'Activo', 88000, 45, 137);
  buque_insertar_SP('USS Coral Sea', 'Activo', 78000, 28, 108);
  buque_insertar_SP('USS Independence', 'Inactivo', 56000, 142, 75);
  buque_insertar_SP('USS Midway', 'Activo', 88000, 118, 145);
  buque_insertar_SP('USS Belleau Wood', 'Activo', 93000, 99, 119);
  buque_insertar_SP('USS Tarawa', 'Activo', 82000, 106, 109);
  buque_insertar_SP('HMS Invincible', 'Activo', 87000, 52, 127);
  buque_insertar_SP('HMS Ocean', 'Activo', 76000, 193, 11);
  buque_insertar_SP('USS Ranger', 'Inactivo', 62000, 71, 23);
  buque_insertar_SP('HMS Courageous', 'Activo', 67000, 53, 98);
  buque_insertar_SP('HMS Hermes', 'Activo', 78000, 185, 112);
  buque_insertar_SP('USS Hancock', 'Activo', 84000, 79, 17);
  buque_insertar_SP('USS Enterprise', 'Activo', 97000, 134, 145);
  buque_insertar_SP('HMS Unicorn', 'Activo', 71000, 15, 119);
  buque_insertar_SP('USS Long Beach', 'Activo', 95000, 116, 161);
  buque_insertar_SP('HMS Glorious', 'Activo', 69000, 109, 55);
  buque_insertar_SP('USS Franklin', 'Inactivo', 60000, 89, 28);
  buque_insertar_SP('HMS Centaur', 'Activo', 81000, 102, 150);
  buque_insertar_SP('USS Saratoga', 'Activo', 77000, 177, 138);
  buque_insertar_SP('HMS Albion', 'Activo', 63000, 122, 147);
  buque_insertar_SP('HMS Eagle', 'Activo', 71000, 148, 110);
  buque_insertar_SP('USS Forrestal', 'Activo', 90000, 6, 105);
  buque_insertar_SP('USS Lake Champlain', 'Activo', 79000, 169, 83);
  buque_insertar_SP('USS Intrepid', 'Activo', 80000, 84, 100);
  buque_insertar_SP('HMS Implacable', 'Activo', 94000, 100, 152);
  buque_insertar_SP('USS Princeton', 'Activo', 81000, 32, 154);
  buque_insertar_SP('HMS Magnificent', 'Activo', 89000, 187, 121);
  buque_insertar_SP('USS Valley Forge', 'Activo', 93000, 14, 141);
  buque_insertar_SP('HMS Courageous', 'Activo', 60000, 24, 84);
  buque_insertar_SP('USS Independence', 'Inactivo', 71000, 173, 87);
  buque_insertar_SP('USS Kitty Hawk', 'Activo', 86000, 22, 144);
  buque_insertar_SP('HMS Hermes', 'Activo', 67000, 183, 76);
  buque_insertar_SP('USS Coral Sea', 'Activo', 76000, 25, 96);
  buque_insertar_SP('HMS Illustrious', 'Activo', 82000, 168, 68);
  buque_insertar_SP('HMS Queen Elizabeth', 'Activo', 83000, 124, 40);
  buque_insertar_SP('USS Wasp', 'Activo', 71000, 189, 115);
  buque_insertar_SP('HMS Barham', 'Inactivo', 65000, 131, 54);
  buque_insertar_SP('USS Bunker Hill', 'Activo', 72000, 94, 126);
  buque_insertar_SP('HMS Prince of Wales', 'Activo', 78000, 50, 7);
  buque_insertar_SP('USS Lexington', 'Inactivo', 63000, 19, 69);
  buque_insertar_SP('HMS Ark Royal', 'Activo', 90000, 150, 121);
  buque_insertar_SP('USS Oriskany', 'Inactivo', 87000, 38, 88);
  buque_insertar_SP('HMS Centaur', 'Activo', 73000, 176, 61);
  buque_insertar_SP('USS Antietam', 'Activo', 79000, 53, 145);
  buque_insertar_SP('HMS Courageous', 'Inactivo', 64000, 99, 43);
  buque_insertar_SP('HMS Bulwark', 'Activo', 81000, 65, 22);
  buque_insertar_SP('USS Franklin', 'Activo', 83000, 129, 92);
  buque_insertar_SP('HMS Implacable', 'Activo', 91000, 143, 155);
  buque_insertar_SP('USS Boxer', 'Activo', 77000, 187, 33);
  buque_insertar_SP('HMS Eagle', 'Inactivo', 67000, 10, 18);
  buque_insertar_SP('USS Ticonderoga', 'Activo', 80000, 127, 102);
  buque_insertar_SP('HMS Invincible', 'Activo', 74000, 101, 149);
  buque_insertar_SP('USS Essex', 'Activo', 84000, 112, 25);
  buque_insertar_SP('USS Hornet', 'Activo', 89000, 19, 79);
  buque_insertar_SP('HMS Ocean', 'Inactivo', 66000, 194, 143);
  buque_insertar_SP('USS Midway', 'Activo', 87000, 67, 12);
  buque_insertar_SP('HMS Queen Elizabeth', 'Activo', 93000, 155, 137);
  buque_insertar_SP('USS Independence', 'Activo', 65000, 118, 106);
  buque_insertar_SP('USS Intrepid', 'Activo', 90000, 74, 94);
  buque_insertar_SP('HMS Vanguard', 'Inactivo', 56000, 25, 35);
  buque_insertar_SP('USS Wasp', 'Activo', 78000, 137, 142);
  buque_insertar_SP('HMS Hood', 'Activo', 85000, 166, 54);
  buque_insertar_SP('USS Iowa', 'Activo', 87000, 20, 87);
  buque_insertar_SP('HMS Hermes', 'Inactivo', 72000, 130, 153);
  buque_insertar_SP('USS Ranger', 'Activo', 81000, 84, 107);
  buque_insertar_SP('HMS Renown', 'Activo', 93000, 156, 37);
  buque_insertar_SP('USS Lexington', 'Activo', 89000, 95, 70);
  buque_insertar_SP('HMS Prince of Wales', 'Inactivo', 68000, 40, 5);
  buque_insertar_SP('HMS Warspite', 'Activo', 77000, 141, 16);
  buque_insertar_SP('USS Saratoga', 'Activo', 88000, 177, 20);
  buque_insertar_SP('HMS Illustrious', 'Activo', 80000, 158, 133);
  buque_insertar_SP('USS Enterprise', 'Inactivo', 94000, 119, 76);
  buque_insertar_SP('USS Yorktown', 'Activo', 90000, 86, 113);
  buque_insertar_SP('HMS Repulse', 'Activo', 85000, 100, 72);
  buque_insertar_SP('USS South Dakota', 'Activo', 91000, 135, 166);
  buque_insertar_SP('HMS Barham', 'Inactivo', 63000, 44, 11);
  buque_insertar_SP('HMS Rodney', 'Activo', 95000, 170, 60);
  buque_insertar_SP('USS Bunker Hill', 'Activo', 92000, 105, 95);
  buque_insertar_SP('HMS Nelson', 'Activo', 74000, 77, 36);
  buque_insertar_SP('USS Missouri', 'Activo', 83000, 165, 97);
  buque_insertar_SP('HMS King George V', 'Inactivo', 89000, 91, 126);
  buque_insertar_SP('USS New Jersey', 'Activo', 87000, 34, 151);
  buque_insertar_SP('HMS Indomitable', 'Activo', 95000, 108, 53);
  buque_insertar_SP('USS Nautilus', 'Activo', 98000, 157, 116);
  buque_insertar_SP('HMS Vanguard', 'Inactivo', 62000, 133, 65);
  buque_insertar_SP('USS Wasp', 'Activo', 90000, 120, 144);
  buque_insertar_SP('HMS Argus', 'Activo', 83000, 192, 83);
  buque_insertar_SP('USS Franklin', 'Activo', 91000, 23, 110);
  buque_insertar_SP('HMS Courageous', 'Inactivo', 64000, 128, 38);
  buque_insertar_SP('USS Kitty Hawk', 'Activo', 89000, 64, 155);
  buque_insertar_SP('HMS Ocean', 'Activo', 75000, 159, 50);
  buque_insertar_SP('HMS Invincible', 'Activo', 85000, 87, 132);
  buque_insertar_SP('USS Ticonderoga', 'Inactivo', 71000, 72, 77);
  buque_insertar_SP('HMS Hermes', 'Activo', 87000, 198, 122);
  buque_insertar_SP('USS Essex', 'Activo', 92000, 18, 129);
  buque_insertar_SP('HMS Formidable', 'Activo', 81000, 140, 66);
  buque_insertar_SP('USS Hancock', 'Activo', 84000, 182, 27);
  buque_insertar_SP('HMS Magnificent', 'Activo', 91000, 114, 100);
  buque_insertar_SP('USS Intrepid', 'Activo', 96000, 7, 9);
  buque_insertar_SP('HMS Prince of Wales', 'Activo', 86000, 79, 6);
  buque_insertar_SP('USS Bunker Hill', 'Activo', 91000, 56, 135);
  buque_insertar_SP('HMS Eagle', 'Inactivo', 67000, 4, 32);
  buque_insertar_SP('USS Hornet', 'Activo', 88000, 185, 78);
  buque_insertar_SP('HMS Invincible', 'Activo', 74000, 93, 152);
  buque_insertar_SP('USS Belleau Wood', 'Activo', 86000, 134, 8);
  buque_insertar_SP('HMS Courageous', 'Activo', 81000, 171, 109);
  buque_insertar_SP('USS Lexington', 'Activo', 93000, 146, 13);
  buque_insertar_SP('HMS Courageous', 'Inactivo', 67000, 61, 62);
  buque_insertar_SP('USS Ticonderoga', 'Activo', 90000, 21, 85);
  buque_insertar_SP('HMS Vanguard', 'Activo', 92000, 125, 24);
  buque_insertar_SP('USS Essex', 'Inactivo', 77000, 47, 64);
  buque_insertar_SP('HMS Renown', 'Activo', 89000, 80, 49);
  buque_insertar_SP('USS Princeton', 'Activo', 83000, 179, 134);
  buque_insertar_SP('HMS Hood', 'Activo', 96000, 194, 26);
  buque_insertar_SP('HMS Indomitable', 'Activo', 72000, 148, 114);
  buque_insertar_SP('USS Enterprise', 'Activo', 87000, 69, 113);
  buque_insertar_SP('HMS Illustrious', 'Activo', 95000, 26, 51);
  buque_insertar_SP('USS Ranger', 'Activo', 86000, 82, 28);
  buque_insertar_SP('HMS Ocean', 'Activo', 76000, 160, 138);
  buque_insertar_SP('USS Yorktown', 'Activo', 87000, 42, 98);
  buque_insertar_SP('HMS Nelson', 'Inactivo', 62000, 113, 59);
  buque_insertar_SP('USS Saratoga', 'Activo', 92000, 17, 141);
  buque_insertar_SP('HMS Ark Royal', 'Activo', 94000, 31, 158);
  buque_insertar_SP('USS Boxer', 'Activo', 86000, 58, 86);
  buque_insertar_SP('HMS Invincible', 'Activo', 93000, 131, 148);
  buque_insertar_SP('USS Midway', 'Activo', 84000, 106, 19);
  buque_insertar_SP('HMS Prince of Wales', 'Inactivo', 72000, 149, 118);
  buque_insertar_SP('USS Franklin', 'Activo', 89000, 159, 34);
  buque_insertar_SP('HMS Hermes', 'Activo', 84000, 18, 130);
  buque_insertar_SP('USS Hornet', 'Activo', 89000, 92, 99);
  buque_insertar_SP('HMS Ark Royal', 'Activo', 94000, 132, 85);
  buque_insertar_SP('USS Saratoga', 'Activo', 92000, 58, 117);
  buque_insertar_SP('HMS Illustrious', 'Activo', 96000, 147, 52);
  buque_insertar_SP('USS Princeton', 'Activo', 87000, 193, 105);
  buque_insertar_SP('HMS Vanguard', 'Activo', 93000, 83, 160);
  buque_insertar_SP('USS Ticonderoga', 'Activo', 91000, 144, 142);
  buque_insertar_SP('HMS Courageous', 'Activo', 85000, 24, 70);
  buque_insertar_SP('USS Ranger', 'Activo', 88000, 101, 28);
  buque_insertar_SP('HMS Ocean', 'Activo', 78000, 34, 147);
  buque_insertar_SP('USS Enterprise', 'Activo', 95000, 69, 122);
  buque_insertar_SP('HMS Hood', 'Inactivo', 74000, 90, 111);
  buque_insertar_SP('USS Bunker Hill', 'Activo', 97000, 105, 43);
  buque_insertar_SP('HMS Prince of Wales', 'Activo', 89000, 61, 76);
  buque_insertar_SP('USS Boxer', 'Activo', 86000, 159, 108);
  buque_insertar_SP('HMS Implacable', 'Activo', 91000, 26, 98);
  buque_insertar_SP('USS Midway', 'Activo', 93000, 48, 154);
  buque_insertar_SP('HMS Repulse', 'Activo', 88000, 167, 123);
  buque_insertar_SP('USS Essex', 'Activo', 89000, 77, 40);
END;




---- DATOS DE EMPLEADO ----



BEGIN
  empleado_insertar_SP('Juan Pérez');
  empleado_insertar_SP('María García');
  empleado_insertar_SP('Carlos Ramírez');
  empleado_insertar_SP('Ana López');
  empleado_insertar_SP('Luis Rodríguez');
  empleado_insertar_SP('Sofía Fernández');
  empleado_insertar_SP('José Hernández');
  empleado_insertar_SP('Laura Martínez');
  empleado_insertar_SP('Miguel Sánchez');
  empleado_insertar_SP('Valeria Díaz');
  empleado_insertar_SP('Francisco Torres');
  empleado_insertar_SP('Gabriela Ruiz');
  empleado_insertar_SP('Javier Gómez');
  empleado_insertar_SP('Andrea Ortiz');
  empleado_insertar_SP('David Flores');
  empleado_insertar_SP('Camila Morales');
  empleado_insertar_SP('Fernando Mendoza');
  empleado_insertar_SP('Isabella Gutiérrez');
  empleado_insertar_SP('Ricardo Castillo');
  empleado_insertar_SP('Emilia Castro');
  empleado_insertar_SP('Roberto Silva');
  empleado_insertar_SP('Victoria Reyes');
  empleado_insertar_SP('Manuel Delgado');
  empleado_insertar_SP('Daniela Herrera');
  empleado_insertar_SP('Pedro Aguilar');
  empleado_insertar_SP('Carmen Núñez');
  empleado_insertar_SP('Hugo Prieto');
  empleado_insertar_SP('Luisa Ríos');
  empleado_insertar_SP('Álvaro Gallardo');
  empleado_insertar_SP('Natalia Soto');
  empleado_insertar_SP('Iván Espinoza');
  empleado_insertar_SP('Paula Benítez');
  empleado_insertar_SP('Cristian Paredes');
  empleado_insertar_SP('Monica Vega');
  empleado_insertar_SP('Santiago Cabrera');
  empleado_insertar_SP('Carolina Cortés');
  empleado_insertar_SP('Pablo Figueroa');
  empleado_insertar_SP('Diana Jiménez');
  empleado_insertar_SP('Andrés Fuentes');
  empleado_insertar_SP('Patricia Molina');
  empleado_insertar_SP('Felipe Salazar');
  empleado_insertar_SP('Claudia Peña');
  empleado_insertar_SP('Mateo Castro');
  empleado_insertar_SP('Alicia Guzmán');
  empleado_insertar_SP('Esteban Rivas');
  empleado_insertar_SP('Silvia Lozano');
  empleado_insertar_SP('Sebastián Ponce');
  empleado_insertar_SP('Elena Vargas');
  empleado_insertar_SP('Tomás Bravo');
  empleado_insertar_SP('Angela León');
  empleado_insertar_SP('Diego Cárdenas');
  empleado_insertar_SP('Marta Guerra');
  empleado_insertar_SP('Eduardo Muñoz');
  empleado_insertar_SP('Inés Vázquez');
  empleado_insertar_SP('Bruno Maldonado');
  empleado_insertar_SP('Gabriela Parra');
  empleado_insertar_SP('Gustavo Quintero');
  empleado_insertar_SP('Aurora Pizarro');
  empleado_insertar_SP('Rodrigo Arias');
  empleado_insertar_SP('Elisa Barrera');
  empleado_insertar_SP('Raúl Correa');
  empleado_insertar_SP('Verónica Domínguez');
  empleado_insertar_SP('Samuel Márquez');
  empleado_insertar_SP('Antonia Jiménez');
  empleado_insertar_SP('Leandro Gil');
  empleado_insertar_SP('Victoria Ramos');
  empleado_insertar_SP('Sergio Medina');
  empleado_insertar_SP('Adriana Cruz');
  empleado_insertar_SP('Jaime Moreno');
  empleado_insertar_SP('Valentina Peña');
  empleado_insertar_SP('Ramón Soto');
  empleado_insertar_SP('Olga Ortiz');
  empleado_insertar_SP('Adolfo Acosta');
  empleado_insertar_SP('Florencia Gallo');
  empleado_insertar_SP('Martín Serrano');
  empleado_insertar_SP('Lorena Peña');
  empleado_insertar_SP('Gonzalo Aguirre');
  empleado_insertar_SP('Julia Carrillo');
  empleado_insertar_SP('Óscar Escobar');
  empleado_insertar_SP('Teresa Navarro');
  empleado_insertar_SP('Raúl Castillo');
  empleado_insertar_SP('Evelyn Montero');
  empleado_insertar_SP('Ignacio Andrade');
  empleado_insertar_SP('Rosa Ávila');
  empleado_insertar_SP('Carlos Peña');
  empleado_insertar_SP('Margarita Mena');
  empleado_insertar_SP('Vicente Rivera');
  empleado_insertar_SP('Paloma Cordero');
  empleado_insertar_SP('Eduardo León');
  empleado_insertar_SP('Isabel Medina');
  empleado_insertar_SP('Rafael Fuentes');
  empleado_insertar_SP('Lorena Cabrera');
  empleado_insertar_SP('Luis Gómez');
  empleado_insertar_SP('Camila Molina');
  empleado_insertar_SP('Jorge Rojas');
  empleado_insertar_SP('Pamela Herrera');
  empleado_insertar_SP('Antonio Flores');
  empleado_insertar_SP('Melina Gómez');
  empleado_insertar_SP('Alfredo Contreras');
  empleado_insertar_SP('Rebeca Ríos');
  empleado_insertar_SP('Guillermo Martínez');
  empleado_insertar_SP('Rita López');
  empleado_insertar_SP('Emilio Vargas');
  empleado_insertar_SP('Adela Márquez');
  empleado_insertar_SP('Francisco Medina');
  empleado_insertar_SP('Paulina Morales');
  empleado_insertar_SP('Víctor González');
  empleado_insertar_SP('Eva Serrano');
  empleado_insertar_SP('Damián Vega');
  empleado_insertar_SP('Aurora Ramírez');
  empleado_insertar_SP('Marcelo Navarro');
  empleado_insertar_SP('Regina Reyes');
  empleado_insertar_SP('Felipe Soto');
  empleado_insertar_SP('Magdalena Ruiz');
  empleado_insertar_SP('Nicolás Castillo');
  empleado_insertar_SP('Elena Guzmán');
  empleado_insertar_SP('Ignacio Jiménez');
  empleado_insertar_SP('Rocío Fuentes');
  empleado_insertar_SP('Gabriel Domínguez');
  empleado_insertar_SP('Irene López');
  empleado_insertar_SP('Mario Vargas');
  empleado_insertar_SP('Verónica Medina');
  empleado_insertar_SP('Cristian Peña');
  empleado_insertar_SP('Rosaura García');
  empleado_insertar_SP('Maximiliano Ramírez');
  empleado_insertar_SP('Luz Serrano');
  empleado_insertar_SP('Fabián Morales');
  empleado_insertar_SP('Natalia Paredes');
  empleado_insertar_SP('Esteban Martínez');
  empleado_insertar_SP('Ana Fernández');
  empleado_insertar_SP('Fernando Ortiz');
  empleado_insertar_SP('Luisa Peña');
  empleado_insertar_SP('Ricardo Pérez');
  empleado_insertar_SP('Marta Salinas');
  empleado_insertar_SP('Álvaro Ruiz');
  empleado_insertar_SP('Rosario Ponce');
  empleado_insertar_SP('Felipe Morales');
  empleado_insertar_SP('Graciela Rivas');
  empleado_insertar_SP('Raúl Medina');
  empleado_insertar_SP('Emilia Torres');
  empleado_insertar_SP('Rodrigo Suárez');
  empleado_insertar_SP('Alicia Ramos');
  empleado_insertar_SP('Miguel Herrera');
  empleado_insertar_SP('Catalina López');
  empleado_insertar_SP('Andrés Cortés');
  empleado_insertar_SP('Rita Fernández');
  empleado_insertar_SP('Javier García');
  empleado_insertar_SP('Carmen Castillo');
  empleado_insertar_SP('Eduardo Torres');
  empleado_insertar_SP('Susana Ruiz');
  empleado_insertar_SP('Pablo Medina');
  empleado_insertar_SP('Adela López');
  empleado_insertar_SP('Carlos Peña');
  empleado_insertar_SP('Claudia Gómez');
  empleado_insertar_SP('Arturo Rodríguez');
  empleado_insertar_SP('Rosa Morales');
  empleado_insertar_SP('José Pérez');
  empleado_insertar_SP('Isabella Ramírez');
  empleado_insertar_SP('Luis González');
  empleado_insertar_SP('Natalia Herrera');
  empleado_insertar_SP('Santiago López');
  empleado_insertar_SP('María Rodríguez');
  empleado_insertar_SP('Miguel Morales');
  empleado_insertar_SP('Carla García');
  empleado_insertar_SP('Jorge Castillo');
  empleado_insertar_SP('Patricia Ortiz');
  empleado_insertar_SP('Gustavo Martínez');
  empleado_insertar_SP('Sofía Hernández');
  empleado_insertar_SP('Roberto Rojas');
  empleado_insertar_SP('Verónica Jiménez');
  empleado_insertar_SP('Emilio Torres');
  empleado_insertar_SP('Valentina Ruiz');
  empleado_insertar_SP('Ángel Sánchez');
  empleado_insertar_SP('Isabel González');
  empleado_insertar_SP('Martín López');
  empleado_insertar_SP('Laura Mendoza');
  empleado_insertar_SP('Ignacio Ramírez');
  empleado_insertar_SP('Mariana López');
  empleado_insertar_SP('Gabriel Castillo');
  empleado_insertar_SP('Rocío Pérez');
  empleado_insertar_SP('Maximiliano García');
  empleado_insertar_SP('Alejandra Gómez');
  empleado_insertar_SP('Antonio Ortiz');
  empleado_insertar_SP('Paula Herrera');
  empleado_insertar_SP('Rodrigo Sánchez');
  empleado_insertar_SP('Tatiana Paredes');
  empleado_insertar_SP('Joaquín Rivera');
  empleado_insertar_SP('Ximena Ruiz');
  empleado_insertar_SP('Tomás Ramírez');
  empleado_insertar_SP('Elena González');
  empleado_insertar_SP('Sebastián Peña');
  empleado_insertar_SP('Nadia Hernández');
  empleado_insertar_SP('Pablo Gutiérrez');
  empleado_insertar_SP('Adriana López');
  empleado_insertar_SP('Jaime Torres');
  empleado_insertar_SP('Gabriela Ramírez');
  empleado_insertar_SP('Álvaro Medina');
  empleado_insertar_SP('Marta Ortiz');
  empleado_insertar_SP('Francisco Herrera');
  empleado_insertar_SP('Cristina López');
  empleado_insertar_SP('Héctor Ramírez');
  empleado_insertar_SP('Inés González');
  empleado_insertar_SP('Mario Hernández');
END;




---- DATOS DE ALMACEN ----


BEGIN
    almacen_insertar_SP('Almacén Central');
    almacen_insertar_SP('Bodega Principal');
    almacen_insertar_SP('Depósito General');
    almacen_insertar_SP('Almacén de Suministros');
    almacen_insertar_SP('Depósito de Inventario');
    almacen_insertar_SP('Almacén de Productos');
    almacen_insertar_SP('Depósito de Mercancías');
    almacen_insertar_SP('Almacén de Stock');
    almacen_insertar_SP('Depósito Secundario');
    almacen_insertar_SP('Bodega de Almacenamiento');
END;


---- DATOS DE INVENTARIO ----


BEGIN
    inventario_insertar_SP('Almacén Central', 500, 1);
    inventario_insertar_SP('Bodega Principal', 450, 2);
    inventario_insertar_SP('Depósito General', 600, 3);
    inventario_insertar_SP('Almacén de Suministros', 150, 4);
    inventario_insertar_SP('Depósito de Inventario', 650, 5);
    inventario_insertar_SP('Almacén de Productos', 200, 6);
    inventario_insertar_SP('Depósito de Mercancías', 350, 7);
    inventario_insertar_SP('Almacén de Stock', 550, 8);
    inventario_insertar_SP('Depósito Secundario', 100, 9);
    inventario_insertar_SP('Bodega de Almacenamiento', 700, 10);
    inventario_insertar_SP('Almacén Central', 400, 11);
    inventario_insertar_SP('Bodega Principal', 300, 12);
    inventario_insertar_SP('Depósito General', 500, 13);
    inventario_insertar_SP('Almacén de Suministros', 200, 14);
    inventario_insertar_SP('Depósito de Inventario', 600, 15);
    inventario_insertar_SP('Almacén de Productos', 250, 16);
    inventario_insertar_SP('Depósito de Mercancías', 370, 17);
    inventario_insertar_SP('Almacén de Stock', 530, 18);
    inventario_insertar_SP('Depósito Secundario', 180, 19);
    inventario_insertar_SP('Bodega de Almacenamiento', 670, 20);
    inventario_insertar_SP('Almacén Central', 420, 21);
    inventario_insertar_SP('Bodega Principal', 320, 22);
    inventario_insertar_SP('Depósito General', 520, 23);
    inventario_insertar_SP('Almacén de Suministros', 210, 24);
    inventario_insertar_SP('Depósito de Inventario', 680, 25);
    inventario_insertar_SP('Almacén de Productos', 480, 26);
    inventario_insertar_SP('Depósito de Mercancías', 390, 27);
    inventario_insertar_SP('Almacén de Stock', 540, 28);
    inventario_insertar_SP('Depósito Secundario', 220, 29);
    inventario_insertar_SP('Bodega de Almacenamiento', 710, 30);
    inventario_insertar_SP('Almacén Central', 450, 31);
    inventario_insertar_SP('Bodega Principal', 330, 32);
    inventario_insertar_SP('Depósito General', 550, 33);
    inventario_insertar_SP('Almacén de Suministros', 230, 34);
    inventario_insertar_SP('Depósito de Inventario', 720, 35);
    inventario_insertar_SP('Almacén de Productos', 500, 36);
    inventario_insertar_SP('Depósito de Mercancías', 350, 37);
    inventario_insertar_SP('Almacén de Stock', 570, 38);
    inventario_insertar_SP('Depósito Secundario', 240, 39);
    inventario_insertar_SP('Bodega de Almacenamiento', 730, 40);
    inventario_insertar_SP('Almacén Central', 550, 41);
    inventario_insertar_SP('Bodega Principal', 370, 42);
    inventario_insertar_SP('Depósito General', 580, 43);
    inventario_insertar_SP('Almacén de Suministros', 250, 44);
    inventario_insertar_SP('Depósito de Inventario', 740, 45);
    inventario_insertar_SP('Almacén de Productos', 600, 46);
    inventario_insertar_SP('Depósito de Mercancías', 390, 47);
    inventario_insertar_SP('Almacén de Stock', 590, 48);
    inventario_insertar_SP('Depósito Secundario', 260, 49);
    inventario_insertar_SP('Bodega de Almacenamiento', 750, 50);
    inventario_insertar_SP('Almacén Central', 620, 51);
    inventario_insertar_SP('Bodega Principal', 400, 52);
    inventario_insertar_SP('Depósito General', 600, 53);
    inventario_insertar_SP('Almacén de Suministros', 270, 54);
    inventario_insertar_SP('Depósito de Inventario', 760, 55);
    inventario_insertar_SP('Almacén de Productos', 650, 56);
    inventario_insertar_SP('Depósito de Mercancías', 420, 57);
    inventario_insertar_SP('Almacén de Stock', 620, 58);
    inventario_insertar_SP('Depósito Secundario', 280, 59);
    inventario_insertar_SP('Bodega de Almacenamiento', 770, 60);
    inventario_insertar_SP('Almacén Central', 680, 61);
    inventario_insertar_SP('Bodega Principal', 440, 62);
    inventario_insertar_SP('Depósito General', 630, 63);
    inventario_insertar_SP('Almacén de Suministros', 290, 64);
    inventario_insertar_SP('Depósito de Inventario', 780, 65);
    inventario_insertar_SP('Almacén de Productos', 700, 66);
    inventario_insertar_SP('Depósito de Mercancías', 460, 67);
    inventario_insertar_SP('Almacén de Stock', 640, 68);
    inventario_insertar_SP('Depósito Secundario', 300, 69);
    inventario_insertar_SP('Bodega de Almacenamiento', 790, 70);
    inventario_insertar_SP('Almacén Central', 720, 71);
    inventario_insertar_SP('Bodega Principal', 480, 72);
    inventario_insertar_SP('Depósito General', 650, 73);
    inventario_insertar_SP('Almacén de Suministros', 310, 74);
    inventario_insertar_SP('Depósito de Inventario', 800, 75);
    inventario_insertar_SP('Almacén de Productos', 750, 76);
    inventario_insertar_SP('Depósito de Mercancías', 500, 77);
    inventario_insertar_SP('Almacén de Stock', 660, 78);
    inventario_insertar_SP('Depósito Secundario', 320, 79);
    inventario_insertar_SP('Bodega de Almacenamiento', 810, 80);
    inventario_insertar_SP('Almacén Central', 770, 81);
    inventario_insertar_SP('Bodega Principal', 520, 82);
    inventario_insertar_SP('Depósito General', 670, 83);
    inventario_insertar_SP('Almacén de Suministros', 330, 84);
    inventario_insertar_SP('Depósito de Inventario', 820, 85);
    inventario_insertar_SP('Almacén de Productos', 790, 86);
    inventario_insertar_SP('Depósito de Mercancías', 540, 87);
    inventario_insertar_SP('Almacén de Stock', 680, 88);
    inventario_insertar_SP('Depósito Secundario', 340, 89);
    inventario_insertar_SP('Bodega de Almacenamiento', 830, 90);
    inventario_insertar_SP('Almacén Central', 800, 91);
    inventario_insertar_SP('Bodega Principal', 560, 92);
    inventario_insertar_SP('Depósito General', 690, 93);
    inventario_insertar_SP('Almacén de Suministros', 350, 94);
    inventario_insertar_SP('Depósito de Inventario', 840, 95);
    inventario_insertar_SP('Almacén de Productos', 820, 96);
    inventario_insertar_SP('Depósito de Mercancías', 580, 97);
    inventario_insertar_SP('Almacén de Stock', 700, 98);
    inventario_insertar_SP('Depósito Secundario', 360, 99);
    inventario_insertar_SP('Bodega de Almacenamiento', 850, 100);
    inventario_insertar_SP('Almacén Central', 520, 101);
    inventario_insertar_SP('Almacén Central', 500, 101);
    inventario_insertar_SP('Bodega Principal', 450, 102);
    inventario_insertar_SP('Depósito General', 600, 103);
    inventario_insertar_SP('Almacén de Suministros', 150, 104);
    inventario_insertar_SP('Depósito de Inventario', 650, 105);
    inventario_insertar_SP('Almacén de Productos', 200, 106);
    inventario_insertar_SP('Depósito de Mercancías', 350, 107);
    inventario_insertar_SP('Almacén de Stock', 550, 108);
    inventario_insertar_SP('Depósito Secundario', 100, 109);
    inventario_insertar_SP('Bodega de Almacenamiento', 700, 110);
    inventario_insertar_SP('Almacén Central', 400, 111);
    inventario_insertar_SP('Bodega Principal', 300, 112);
    inventario_insertar_SP('Depósito General', 500, 113);
    inventario_insertar_SP('Almacén de Suministros', 200, 114);
    inventario_insertar_SP('Depósito de Inventario', 600, 115);
    inventario_insertar_SP('Almacén de Productos', 250, 116);
    inventario_insertar_SP('Depósito de Mercancías', 370, 117);
    inventario_insertar_SP('Almacén de Stock', 530, 118);
    inventario_insertar_SP('Depósito Secundario', 180, 119);
    inventario_insertar_SP('Bodega de Almacenamiento', 670, 120);
    inventario_insertar_SP('Almacén Central', 420, 121);
    inventario_insertar_SP('Bodega Principal', 320, 122);
    inventario_insertar_SP('Depósito General', 520, 123);
    inventario_insertar_SP('Almacén de Suministros', 210, 124);
    inventario_insertar_SP('Depósito de Inventario', 680, 125);
    inventario_insertar_SP('Almacén de Productos', 480, 126);
    inventario_insertar_SP('Depósito de Mercancías', 390, 127);
    inventario_insertar_SP('Almacén de Stock', 540, 128);
    inventario_insertar_SP('Depósito Secundario', 220, 129);
    inventario_insertar_SP('Bodega de Almacenamiento', 710, 130);
    inventario_insertar_SP('Almacén Central', 450, 131);
    inventario_insertar_SP('Bodega Principal', 330, 132);
    inventario_insertar_SP('Depósito General', 550, 133);
    inventario_insertar_SP('Almacén de Suministros', 230, 134);
    inventario_insertar_SP('Depósito de Inventario', 720, 135);
    inventario_insertar_SP('Almacén de Productos', 500, 136);
    inventario_insertar_SP('Depósito de Mercancías', 350, 137);
    inventario_insertar_SP('Almacén de Stock', 570, 138);
    inventario_insertar_SP('Depósito Secundario', 240, 139);
    inventario_insertar_SP('Bodega de Almacenamiento', 730, 140);
    inventario_insertar_SP('Almacén Central', 550, 141);
    inventario_insertar_SP('Bodega Principal', 370, 142);
    inventario_insertar_SP('Depósito General', 580, 143);
    inventario_insertar_SP('Almacén de Suministros', 250, 144);
    inventario_insertar_SP('Depósito de Inventario', 740, 145);
    inventario_insertar_SP('Almacén de Productos', 600, 146);
    inventario_insertar_SP('Depósito de Mercancías', 390, 147);
    inventario_insertar_SP('Almacén de Stock', 590, 148);
    inventario_insertar_SP('Depósito Secundario', 260, 149);
    inventario_insertar_SP('Bodega de Almacenamiento', 750, 150);
    inventario_insertar_SP('Almacén Central', 620, 151);
    inventario_insertar_SP('Bodega Principal', 400, 152);
    inventario_insertar_SP('Depósito General', 600, 153);
    inventario_insertar_SP('Almacén de Suministros', 270, 154);
    inventario_insertar_SP('Depósito de Inventario', 760, 155);
    inventario_insertar_SP('Almacén de Productos', 650, 156);
    inventario_insertar_SP('Depósito de Mercancías', 420, 157);
    inventario_insertar_SP('Almacén de Stock', 620, 158);
    inventario_insertar_SP('Depósito Secundario', 280, 159);
    inventario_insertar_SP('Bodega de Almacenamiento', 770, 160);
    inventario_insertar_SP('Almacén Central', 680, 161);
    inventario_insertar_SP('Bodega Principal', 440, 162);
    inventario_insertar_SP('Depósito General', 630, 163);
    inventario_insertar_SP('Almacén de Suministros', 290, 164);
    inventario_insertar_SP('Depósito de Inventario', 780, 165);
    inventario_insertar_SP('Almacén de Productos', 700, 166);
    inventario_insertar_SP('Depósito de Mercancías', 460, 167);
    inventario_insertar_SP('Almacén de Stock', 640, 168);
    inventario_insertar_SP('Depósito Secundario', 300, 169);
    inventario_insertar_SP('Bodega de Almacenamiento', 790, 170);
    inventario_insertar_SP('Almacén Central', 720, 171);
    inventario_insertar_SP('Bodega Principal', 480, 172);
    inventario_insertar_SP('Depósito General', 650, 173);
    inventario_insertar_SP('Almacén de Suministros', 310, 174);
    inventario_insertar_SP('Depósito de Inventario', 800, 175);
    inventario_insertar_SP('Almacén de Productos', 750, 176);
    inventario_insertar_SP('Depósito de Mercancías', 500, 177);
    inventario_insertar_SP('Almacén de Stock', 660, 178);
    inventario_insertar_SP('Depósito Secundario', 320, 179);
    inventario_insertar_SP('Bodega de Almacenamiento', 810, 180);
    inventario_insertar_SP('Almacén Central', 770, 181);
    inventario_insertar_SP('Bodega Principal', 520, 182);
    inventario_insertar_SP('Depósito General', 670, 183);
    inventario_insertar_SP('Almacén de Suministros', 330, 184);
    inventario_insertar_SP('Depósito de Inventario', 820, 185);
    inventario_insertar_SP('Almacén de Productos', 790, 186);
    inventario_insertar_SP('Depósito de Mercancías', 540, 187);
    inventario_insertar_SP('Almacén de Stock', 680, 188);
    inventario_insertar_SP('Depósito Secundario', 340, 189);
    inventario_insertar_SP('Bodega de Almacenamiento', 830, 190);
    inventario_insertar_SP('Almacén Central', 800, 191);
    inventario_insertar_SP('Bodega Principal', 560, 192);
    inventario_insertar_SP('Depósito General', 690, 193);
    inventario_insertar_SP('Almacén de Suministros', 350, 194);
    inventario_insertar_SP('Depósito de Inventario', 840, 195);
    inventario_insertar_SP('Almacén de Productos', 820, 196);
    inventario_insertar_SP('Depósito de Mercancías', 580, 197);
    inventario_insertar_SP('Almacén de Stock', 700, 198);
    inventario_insertar_SP('Depósito Secundario', 360, 199);
    inventario_insertar_SP('Bodega de Almacenamiento', 850, 200);
END;


---- DATOS DE DESTINO ----

BEGIN
    destino_insertar_SP('Puerto de Barcelona', TO_DATE('01/09/2024', 'DD/MM/YYYY'), TO_DATE('15/09/2024', 'DD/MM/YYYY'), 'Ubicación Central', 14, 102);
    destino_insertar_SP('Puerto de Rotterdam', TO_DATE('05/09/2024', 'DD/MM/YYYY'), TO_DATE('20/09/2024', 'DD/MM/YYYY'), 'Sector 5', 8, 85);
    destino_insertar_SP('Puerto de Shanghái', TO_DATE('10/09/2024', 'DD/MM/YYYY'), TO_DATE('25/09/2024', 'DD/MM/YYYY'), 'Zona Norte', 23, 178);
    destino_insertar_SP('Puerto de Singapur', TO_DATE('15/09/2024', 'DD/MM/YYYY'), TO_DATE('30/09/2024', 'DD/MM/YYYY'), 'Distrito Sur', 37, 64);
    destino_insertar_SP('Puerto de Los Ángeles', TO_DATE('20/09/2024', 'DD/MM/YYYY'), TO_DATE('05/10/2024', 'DD/MM/YYYY'), 'Área Industrial', 49, 121);
    destino_insertar_SP('Puerto de Hamburgo', TO_DATE('25/09/2024', 'DD/MM/YYYY'), TO_DATE('10/10/2024', 'DD/MM/YYYY'), 'Sector Este', 3, 56);
    destino_insertar_SP('Puerto de Dubái', TO_DATE('30/09/2024', 'DD/MM/YYYY'), TO_DATE('15/10/2024', 'DD/MM/YYYY'), 'Zona Oeste', 41, 187);
    destino_insertar_SP('Puerto de Busan', TO_DATE('05/10/2024', 'DD/MM/YYYY'), TO_DATE('20/10/2024', 'DD/MM/YYYY'), 'Área Comercial', 25, 99);
    destino_insertar_SP('Puerto de Nueva York', TO_DATE('10/10/2024', 'DD/MM/YYYY'), TO_DATE('25/10/2024', 'DD/MM/YYYY'), 'Zona Internacional', 52, 174);
    destino_insertar_SP('Puerto de Santos', TO_DATE('15/10/2024', 'DD/MM/YYYY'), TO_DATE('30/10/2024', 'DD/MM/YYYY'), 'Distrito Norte', 11, 44);
    destino_insertar_SP('Puerto de Valencia', TO_DATE('20/10/2024', 'DD/MM/YYYY'), TO_DATE('04/11/2024', 'DD/MM/YYYY'), 'Sector Sur', 6, 102);
    destino_insertar_SP('Puerto de Tánger Med', TO_DATE('25/10/2024', 'DD/MM/YYYY'), TO_DATE('09/11/2024', 'DD/MM/YYYY'), 'Zona Logística', 30, 75);
    destino_insertar_SP('Puerto de Colombo', TO_DATE('30/10/2024', 'DD/MM/YYYY'), TO_DATE('14/11/2024', 'DD/MM/YYYY'), 'Sector Oeste', 18, 163);
    destino_insertar_SP('Puerto de Hong Kong', TO_DATE('04/11/2024', 'DD/MM/YYYY'), TO_DATE('19/11/2024', 'DD/MM/YYYY'), 'Área Central', 54, 23);
    destino_insertar_SP('Puerto de Veracruz', TO_DATE('09/11/2024', 'DD/MM/YYYY'), TO_DATE('24/11/2024', 'DD/MM/YYYY'), 'Zona Sur', 27, 98);
    destino_insertar_SP('Puerto de Algeciras', TO_DATE('14/11/2024', 'DD/MM/YYYY'), TO_DATE('29/11/2024', 'DD/MM/YYYY'), 'Distrito Este', 2, 131);
    destino_insertar_SP('Puerto de Piraeus', TO_DATE('19/11/2024', 'DD/MM/YYYY'), TO_DATE('04/12/2024', 'DD/MM/YYYY'), 'Sector Norte', 50, 167);
    destino_insertar_SP('Puerto de Miami', TO_DATE('24/11/2024', 'DD/MM/YYYY'), TO_DATE('09/12/2024', 'DD/MM/YYYY'), 'Área Metropolitana', 13, 58);
    destino_insertar_SP('Puerto de Durban', TO_DATE('29/11/2024', 'DD/MM/YYYY'), TO_DATE('14/12/2024', 'DD/MM/YYYY'), 'Zona Industrial', 21, 197);
    destino_insertar_SP('Puerto de Marsella', TO_DATE('04/12/2024', 'DD/MM/YYYY'), TO_DATE('19/12/2024', 'DD/MM/YYYY'), 'Sector Central', 44, 81);
    destino_insertar_SP('Puerto de Long Beach', TO_DATE('09/12/2024', 'DD/MM/YYYY'), TO_DATE('24/12/2024', 'DD/MM/YYYY'), 'Zona Oeste', 7, 143);
    destino_insertar_SP('Puerto de Antwerp', TO_DATE('14/12/2024', 'DD/MM/YYYY'), TO_DATE('29/12/2024', 'DD/MM/YYYY'), 'Distrito Logístico', 35, 102);
    destino_insertar_SP('Puerto de Río de Janeiro', TO_DATE('19/12/2024', 'DD/MM/YYYY'), TO_DATE('03/01/2025', 'DD/MM/YYYY'), 'Área Norte', 10, 186);
    destino_insertar_SP('Puerto de Melbourne', TO_DATE('24/12/2024', 'DD/MM/YYYY'), TO_DATE('08/01/2025', 'DD/MM/YYYY'), 'Zona Sur', 48, 29);
    destino_insertar_SP('Puerto de Ho Chi Minh', TO_DATE('29/12/2024', 'DD/MM/YYYY'), TO_DATE('13/01/2025', 'DD/MM/YYYY'), 'Sector Este', 19, 155);
    destino_insertar_SP('Puerto de Karachi', TO_DATE('03/01/2025', 'DD/MM/YYYY'), TO_DATE('18/01/2025', 'DD/MM/YYYY'), 'Distrito Oeste', 28, 77);
    destino_insertar_SP('Puerto de Jebel Ali', TO_DATE('08/01/2025', 'DD/MM/YYYY'), TO_DATE('23/01/2025', 'DD/MM/YYYY'), 'Área Comercial', 16, 199);
    destino_insertar_SP('Puerto de Incheon', TO_DATE('13/01/2025', 'DD/MM/YYYY'), TO_DATE('28/01/2025', 'DD/MM/YYYY'), 'Sector Norte', 31, 96);
    destino_insertar_SP('Puerto de Montreal', TO_DATE('18/01/2025', 'DD/MM/YYYY'), TO_DATE('02/02/2025', 'DD/MM/YYYY'), 'Zona Internacional', 46, 103);
    destino_insertar_SP('Puerto de Yokohama', TO_DATE('23/01/2025', 'DD/MM/YYYY'), TO_DATE('07/02/2025', 'DD/MM/YYYY'), 'Distrito Sur', 12, 159);
    destino_insertar_SP('Puerto de Felixstowe', TO_DATE('28/01/2025', 'DD/MM/YYYY'), TO_DATE('12/02/2025', 'DD/MM/YYYY'), 'Área Central', 4, 33);
    destino_insertar_SP('Puerto de Seattle', TO_DATE('02/02/2025', 'DD/MM/YYYY'), TO_DATE('17/02/2025', 'DD/MM/YYYY'), 'Sector Oeste', 43, 129);
    destino_insertar_SP('Puerto de Le Havre', TO_DATE('07/02/2025', 'DD/MM/YYYY'), TO_DATE('22/02/2025', 'DD/MM/YYYY'), 'Zona Norte', 24, 175);
    destino_insertar_SP('Puerto de Sídney', TO_DATE('12/02/2025', 'DD/MM/YYYY'), TO_DATE('27/02/2025', 'DD/MM/YYYY'), 'Distrito Este', 5, 82);
    destino_insertar_SP('Puerto de Durban', TO_DATE('17/02/2025', 'DD/MM/YYYY'), TO_DATE('04/03/2025', 'DD/MM/YYYY'), 'Área Sur', 33, 194);
    destino_insertar_SP('Puerto de Houston', TO_DATE('22/02/2025', 'DD/MM/YYYY'), TO_DATE('09/03/2025', 'DD/MM/YYYY'), 'Sector Norte', 39, 71);
    destino_insertar_SP('Puerto de Río Grande', TO_DATE('27/02/2025', 'DD/MM/YYYY'), TO_DATE('14/03/2025', 'DD/MM/YYYY'), 'Zona Central', 1, 187);
    destino_insertar_SP('Puerto de Cagliari', TO_DATE('04/03/2025', 'DD/MM/YYYY'), TO_DATE('21/03/2025', 'DD/MM/YYYY'), 'Distrito Oeste', 32, 58);
    destino_insertar_SP('Puerto de Zeebrugge', TO_DATE('09/03/2025', 'DD/MM/YYYY'), TO_DATE('26/03/2025', 'DD/MM/YYYY'), 'Sector Internacional', 17, 201);
    destino_insertar_SP('Puerto de Durban', TO_DATE('14/03/2025', 'DD/MM/YYYY'), TO_DATE('31/03/2025', 'DD/MM/YYYY'), 'Área Logística', 45, 100);
    destino_insertar_SP('Puerto de Gdynia', TO_DATE('19/03/2025', 'DD/MM/YYYY'), TO_DATE('05/04/2025', 'DD/MM/YYYY'), 'Zona Norte', 22, 176);
    destino_insertar_SP('Puerto de Oakland', TO_DATE('24/03/2025', 'DD/MM/YYYY'), TO_DATE('10/04/2025', 'DD/MM/YYYY'), 'Distrito Sur', 9, 41);
    destino_insertar_SP('Puerto de San Antonio', TO_DATE('29/03/2025', 'DD/MM/YYYY'), TO_DATE('15/04/2025', 'DD/MM/YYYY'), 'Sector Oeste', 53, 195);
    destino_insertar_SP('Puerto de Manzanillo', TO_DATE('03/04/2025', 'DD/MM/YYYY'), TO_DATE('20/04/2025', 'DD/MM/YYYY'), 'Área Central', 26, 116);
    destino_insertar_SP('Puerto de Santos', TO_DATE('08/04/2025', 'DD/MM/YYYY'), TO_DATE('25/04/2025', 'DD/MM/YYYY'), 'Zona Sur', 42, 153);
    destino_insertar_SP('Puerto de Salalah', TO_DATE('13/04/2025', 'DD/MM/YYYY'), TO_DATE('30/04/2025', 'DD/MM/YYYY'), 'Distrito Norte', 20, 69);
    destino_insertar_SP('Puerto de Mombasa', TO_DATE('18/04/2025', 'DD/MM/YYYY'), TO_DATE('05/05/2025', 'DD/MM/YYYY'), 'Sector Este', 15, 112);
    destino_insertar_SP('Puerto de Laem Chabang', TO_DATE('23/04/2025', 'DD/MM/YYYY'), TO_DATE('10/05/2025', 'DD/MM/YYYY'), 'Área Oeste', 36, 160);
    destino_insertar_SP('Puerto de Dunkirk', TO_DATE('28/04/2025', 'DD/MM/YYYY'), TO_DATE('15/05/2025', 'DD/MM/YYYY'), 'Zona Central', 29, 46);
    destino_insertar_SP('Puerto de Gioia Tauro', TO_DATE('03/05/2025', 'DD/MM/YYYY'), TO_DATE('20/05/2025', 'DD/MM/YYYY'), 'Sector Sur', 34, 178);
    destino_insertar_SP('Puerto de Casablanca', TO_DATE('08/05/2025', 'DD/MM/YYYY'), TO_DATE('25/05/2025', 'DD/MM/YYYY'), 'Distrito Oeste', 51, 27);
    destino_insertar_SP('Puerto de Tianjin', TO_DATE('13/05/2025', 'DD/MM/YYYY'), TO_DATE('30/05/2025', 'DD/MM/YYYY'), 'Área Norte', 38, 147);
    destino_insertar_SP('Puerto de Guayaquil', TO_DATE('18/05/2025', 'DD/MM/YYYY'), TO_DATE('04/06/2025', 'DD/MM/YYYY'), 'Zona Internacional', 40, 88);
    destino_insertar_SP('Puerto de Santos', TO_DATE('23/05/2025', 'DD/MM/YYYY'), TO_DATE('09/06/2025', 'DD/MM/YYYY'), 'Sector Central', 55, 133);
END;











---- DATOS DE USUARIO ----


BEGIN
    usuario_insertar_SP('Carlos', 'Gómez', 'cgomez', 'password123', 'carlos.gomez@example.com', 2, 'Mexicana', 'ruta_imagen1.jpg');
    usuario_insertar_SP('María', 'Rodríguez', 'mrodriguez', 'password456', 'maria.rodriguez@example.com', 2, 'Colombiana', 'ruta_imagen2.jpg');
    usuario_insertar_SP('Pedro', 'López', 'plopez', 'password789', 'pedro.lopez@example.com', 2, 'Argentina', 'ruta_imagen3.jpg');
    usuario_insertar_SP('Ana', 'Martínez', 'amartinez', 'password101', 'ana.martinez@example.com', 2, 'Española', 'ruta_imagen4.jpg');
    usuario_insertar_SP('Juan', 'Hernández', 'jhernandez', 'password102', 'juan.hernandez@example.com', 2, 'Chilena', 'ruta_imagen5.jpg');
    usuario_insertar_SP('Laura', 'Pérez', 'lperez', 'password103', 'laura.perez@example.com', 2, 'Peruana', 'ruta_imagen6.jpg');
    usuario_insertar_SP('Miguel', 'Sánchez', 'msanchez', 'password104', 'miguel.sanchez@example.com', 2, 'Mexicana', 'ruta_imagen7.jpg');
    usuario_insertar_SP('Lucía', 'Torres', 'ltorres', 'password105', 'lucia.torres@example.com', 2, 'Colombiana', 'ruta_imagen8.jpg');
    usuario_insertar_SP('David', 'Ramírez', 'dramirez', 'password106', 'david.ramirez@example.com', 2, 'Argentina', 'ruta_imagen9.jpg');
    usuario_insertar_SP('Elena', 'Díaz', 'ediaz', 'password107', 'elena.diaz@example.com', 2, 'Española', 'ruta_imagen10.jpg');
    usuario_insertar_SP('Sofía', 'Fernández', 'sfernandez', 'password108', 'sofia.fernandez@example.com', 2, 'Chilena', 'ruta_imagen11.jpg');
    usuario_insertar_SP('Andrés', 'Muñoz', 'amunoz', 'password109', 'andres.munoz@example.com', 2, 'Peruana', 'ruta_imagen12.jpg');
    usuario_insertar_SP('Raúl', 'Morales', 'rmorales', 'password110', 'raul.morales@example.com', 2, 'Mexicana', 'ruta_imagen13.jpg');
    usuario_insertar_SP('Isabel', 'Jiménez', 'ijimenez', 'password111', 'isabel.jimenez@example.com', 2, 'Colombiana', 'ruta_imagen14.jpg');
    usuario_insertar_SP('Adrián', 'Rojas', 'arojas', 'password112', 'adrian.rojas@example.com', 2, 'Argentina', 'ruta_imagen15.jpg');
    usuario_insertar_SP('Natalia', 'Navarro', 'nnavarro', 'password113', 'natalia.navarro@example.com', 2, 'Española', 'ruta_imagen16.jpg');
    usuario_insertar_SP('Javier', 'Ortega', 'jortega', 'password114', 'javier.ortega@example.com', 2, 'Chilena', 'ruta_imagen17.jpg');
    usuario_insertar_SP('Valeria', 'Castro', 'vcastro', 'password115', 'valeria.castro@example.com', 2, 'Peruana', 'ruta_imagen18.jpg');
    usuario_insertar_SP('Francisco', 'Vega', 'fvega', 'password116', 'francisco.vega@example.com', 2, 'Mexicana', 'ruta_imagen19.jpg');
    usuario_insertar_SP('Marta', 'Santos', 'msantos', 'password117', 'marta.santos@example.com', 2, 'Colombiana', 'ruta_imagen20.jpg');
    usuario_insertar_SP('Diego', 'Suárez', 'dsuarez', 'password118', 'diego.suarez@example.com', 2, 'Argentina', 'ruta_imagen21.jpg');
    usuario_insertar_SP('Patricia', 'Reyes', 'preyes', 'password119', 'patricia.reyes@example.com', 2, 'Española', 'ruta_imagen22.jpg');
    usuario_insertar_SP('Jorge', 'Aguilar', 'jaguilar', 'password120', 'jorge.aguilar@example.com', 2, 'Chilena', 'ruta_imagen23.jpg');
    usuario_insertar_SP('Silvia', 'Delgado', 'sdelgado', 'password121', 'silvia.delgado@example.com', 2, 'Peruana', 'ruta_imagen24.jpg');
    usuario_insertar_SP('Enrique', 'Mendoza', 'emendoza', 'password122', 'enrique.mendoza@example.com', 2, 'Mexicana', 'ruta_imagen25.jpg');
    usuario_insertar_SP('Rosa', 'Guerrero', 'rguerrero', 'password123', 'rosa.guerrero@example.com', 2, 'Colombiana', 'ruta_imagen26.jpg');
    usuario_insertar_SP('Oscar', 'Domínguez', 'odominguez', 'password124', 'oscar.dominguez@example.com', 2, 'Argentina', 'ruta_imagen27.jpg');
    usuario_insertar_SP('Gabriela', 'Vargas', 'gvargas', 'password125', 'gabriela.vargas@example.com', 2, 'Española', 'ruta_imagen28.jpg');
    usuario_insertar_SP('Ricardo', 'Escobar', 'rescobar', 'password126', 'ricardo.escobar@example.com', 2, 'Chilena', 'ruta_imagen29.jpg');
    usuario_insertar_SP('Alejandra', 'Peña', 'apena', 'password127', 'alejandra.pena@example.com', 2, 'Peruana', 'ruta_imagen30.jpg');
    usuario_insertar_SP('Héctor', 'Carrillo', 'hcarrillo', 'password128', 'hector.carrillo@example.com', 2, 'Mexicana', 'ruta_imagen31.jpg');
    usuario_insertar_SP('Beatriz', 'Lara', 'blara', 'password129', 'beatriz.lara@example.com', 2, 'Colombiana', 'ruta_imagen32.jpg');
    usuario_insertar_SP('Luis', 'Núñez', 'lnunez', 'password130', 'luis.nunez@example.com', 2, 'Argentina', 'ruta_imagen33.jpg');
    usuario_insertar_SP('Carolina', 'Soto', 'csoto', 'password131', 'carolina.soto@example.com', 2, 'Española', 'ruta_imagen34.jpg');
    usuario_insertar_SP('Álvaro', 'Ramos', 'aramos', 'password132', 'alvaro.ramos@example.com', 2, 'Chilena', 'ruta_imagen35.jpg');
    usuario_insertar_SP('Daniela', 'Molina', 'dmolina', 'password133', 'daniela.molina@example.com', 2, 'Peruana', 'ruta_imagen36.jpg');
    usuario_insertar_SP('Jesús', 'Paredes', 'jparedes', 'password134', 'jesus.paredes@example.com', 2, 'Mexicana', 'ruta_imagen37.jpg');
    usuario_insertar_SP('Carmen', 'Guzmán', 'cguzman', 'password135', 'carmen.guzman@example.com', 2, 'Colombiana', 'ruta_imagen38.jpg');
    usuario_insertar_SP('Felipe', 'Rivera', 'frivera', 'password136', 'felipe.rivera@example.com', 2, 'Argentina', 'ruta_imagen39.jpg');
    usuario_insertar_SP('Alicia', 'León', 'aleon', 'password137', 'alicia.leon@example.com', 2, 'Española', 'ruta_imagen40.jpg');
    usuario_insertar_SP('Esteban', 'García', 'egarcia', 'password138', 'esteban.garcia@example.com', 2, 'Chilena', 'ruta_imagen41.jpg');
    usuario_insertar_SP('Paola', 'Cabrera', 'pcabrera', 'password139', 'paola.cabrera@example.com', 2, 'Peruana', 'ruta_imagen42.jpg');
    usuario_insertar_SP('Gustavo', 'Pineda', 'gpineda', 'password140', 'gustavo.pineda@example.com', 2, 'Mexicana', 'ruta_imagen43.jpg');
    usuario_insertar_SP('Inés', 'Flores', 'iflores', 'password141', 'ines.flores@example.com', 2, 'Colombiana', 'ruta_imagen44.jpg');
    usuario_insertar_SP('Tomás', 'Montes', 'tmontes', 'password142', 'tomas.montes@example.com', 2, 'Argentina', 'ruta_imagen45.jpg');
    usuario_insertar_SP('Elvira', 'Rojas', 'erojas', 'password143', 'elvira.rojas@example.com', 2, 'Española', 'ruta_imagen46.jpg');
    usuario_insertar_SP('Ramiro', 'Salinas', 'rsalinas', 'password144', 'ramiro.salinas@example.com', 2, 'Chilena', 'ruta_imagen47.jpg');
    usuario_insertar_SP('Verónica', 'Campos', 'vcampos', 'password145', 'veronica.campos@example.com', 2, 'Peruana', 'ruta_imagen48.jpg');
    usuario_insertar_SP('Bernardo', 'López', 'blopez', 'password146', 'bernardo.lopez@example.com', 2, 'Mexicana', 'ruta_imagen49.jpg');
    usuario_insertar_SP('Alma', 'Herrera', 'aherrera', 'password147', 'alma.herrera@example.com', 2, 'Colombiana', 'ruta_imagen50.jpg');
    usuario_insertar_SP('Sebastián', 'Pérez', 'sperez', 'password148', 'sebastian.perez@example.com', 2, 'Argentina', 'ruta_imagen51.jpg');
    usuario_insertar_SP('Ester', 'Luna', 'eluna', 'password149', 'ester.luna@example.com', 2, 'Española', 'ruta_imagen52.jpg');
    usuario_insertar_SP('Emilio', 'Arroyo', 'earroyo', 'password150', 'emilio.arroyo@example.com', 2, 'Chilena', 'ruta_imagen53.jpg');
    usuario_insertar_SP('Lucero', 'Silva', 'lsilva', 'password151', 'lucero.silva@example.com', 2, 'Peruana', 'ruta_imagen54.jpg');
    usuario_insertar_SP('Nicolás', 'Molina', 'nmolina', 'password152', 'nicolas.molina@example.com', 2, 'Mexicana', 'ruta_imagen55.jpg');
    usuario_insertar_SP('Paloma', 'Fuentes', 'pfuentes', 'password153', 'paloma.fuentes@example.com', 2, 'Colombiana', 'ruta_imagen56.jpg');
    usuario_insertar_SP('Rodrigo', 'Santana', 'rsantana', 'password154', 'rodrigo.santana@example.com', 2, 'Argentina', 'ruta_imagen57.jpg');
    usuario_insertar_SP('Julieta', 'Álvarez', 'jalvarez', 'password155', 'julieta.alvarez@example.com', 2, 'Española', 'ruta_imagen58.jpg');
    usuario_insertar_SP('Mauricio', 'Pérez', 'mperez', 'password156', 'mauricio.perez@example.com', 2, 'Chilena', 'ruta_imagen59.jpg');
    usuario_insertar_SP('Vanessa', 'Nieves', 'vnieves', 'password157', 'vanessa.nieves@example.com', 2, 'Peruana', 'ruta_imagen60.jpg');
    usuario_insertar_SP('Ignacio', 'Moreno', 'imoreno', 'password158', 'ignacio.moreno@example.com', 2, 'Mexicana', 'ruta_imagen61.jpg');
    usuario_insertar_SP('Rosario', 'Ibarra', 'ribarra', 'password159', 'rosario.ibarra@example.com', 2, 'Colombiana', 'ruta_imagen62.jpg');
    usuario_insertar_SP('Bruno', 'Márquez', 'bmarquez', 'password160', 'bruno.marquez@example.com', 2, 'Argentina', 'ruta_imagen63.jpg');
    usuario_insertar_SP('Elisa', 'Villanueva', 'evillanueva', 'password161', 'elisa.villanueva@example.com', 2, 'Española', 'ruta_imagen64.jpg');
    usuario_insertar_SP('Simón', 'Pérez', 'sperez2', 'password162', 'simon.perez@example.com', 2, 'Chilena', 'ruta_imagen65.jpg');
    usuario_insertar_SP('Yolanda', 'Gutiérrez', 'ygutierrez', 'password163', 'yolanda.gutierrez@example.com', 2, 'Peruana', 'ruta_imagen66.jpg');
    usuario_insertar_SP('Manuel', 'Castillo', 'mcastillo', 'password164', 'manuel.castillo@example.com', 2, 'Mexicana', 'ruta_imagen67.jpg');
    usuario_insertar_SP('Mónica', 'Paredes', 'mparedes', 'password165', 'monica.paredes@example.com', 2, 'Colombiana', 'ruta_imagen68.jpg');
    usuario_insertar_SP('Lucas', 'Ortega', 'lortega', 'password166', 'lucas.ortega@example.com', 2, 'Argentina', 'ruta_imagen69.jpg');
    usuario_insertar_SP('Daniel', 'Reyes', 'dreyes', 'password167', 'daniel.reyes@example.com', 2, 'Española', 'ruta_imagen70.jpg');
    usuario_insertar_SP('Camila', 'Figueroa', 'cfigueroa', 'password168', 'camila.figueroa@example.com', 2, 'Chilena', 'ruta_imagen71.jpg');
    usuario_insertar_SP('Federico', 'Sosa', 'fsosa', 'password169', 'federico.sosa@example.com', 2, 'Peruana', 'ruta_imagen72.jpg');
    usuario_insertar_SP('Marisol', 'Vargas', 'mvargas', 'password170', 'marisol.vargas@example.com', 2, 'Mexicana', 'ruta_imagen73.jpg');
    usuario_insertar_SP('Ramona', 'Díaz', 'rdiaz', 'password171', 'ramona.diaz@example.com', 2, 'Colombiana', 'ruta_imagen74.jpg');
    usuario_insertar_SP('Ángela', 'Méndez', 'amendez', 'password172', 'angela.mendez@example.com', 2, 'Argentina', 'ruta_imagen75.jpg');
    usuario_insertar_SP('Rafael', 'Morales', 'rmorales2', 'password173', 'rafael.morales@example.com', 2, 'Española', 'ruta_imagen76.jpg');
    usuario_insertar_SP('Iván', 'Delgado', 'idelgado', 'password174', 'ivan.delgado@example.com', 2, 'Chilena', 'ruta_imagen77.jpg');
    usuario_insertar_SP('Paula', 'Hernández', 'phernandez', 'password175', 'paula.hernandez@example.com', 2, 'Peruana', 'ruta_imagen78.jpg');
    usuario_insertar_SP('Santiago', 'Jiménez', 'sjimenez', 'password176', 'santiago.jimenez@example.com', 2, 'Mexicana', 'ruta_imagen79.jpg');
    usuario_insertar_SP('Adriana', 'Ramos', 'aramos2', 'password177', 'adriana.ramos@example.com', 2, 'Colombiana', 'ruta_imagen80.jpg');
    usuario_insertar_SP('Arturo', 'Escamilla', 'aescamilla', 'password178', 'arturo.escamilla@example.com', 2, 'Argentina', 'ruta_imagen81.jpg');
    usuario_insertar_SP('Bárbara', 'Medina', 'bmedina', 'password179', 'barbara.medina@example.com', 2, 'Española', 'ruta_imagen82.jpg');
    usuario_insertar_SP('Joaquín', 'Sánchez', 'jsanchez', 'password180', 'joaquin.sanchez@example.com', 2, 'Chilena', 'ruta_imagen83.jpg');
    usuario_insertar_SP('Olga', 'Cruz', 'ocruz', 'password181', 'olga.cruz@example.com', 2, 'Peruana', 'ruta_imagen84.jpg');
    usuario_insertar_SP('Roberto', 'Galindo', 'rgalindo', 'password182', 'roberto.galindo@example.com', 2, 'Mexicana', 'ruta_imagen85.jpg');
    usuario_insertar_SP('Elena', 'Sánchez', 'esanchez', 'password183', 'elena.sanchez@example.com', 2, 'Colombiana', 'ruta_imagen86.jpg');
    usuario_insertar_SP('Raquel', 'Ávila', 'ravila', 'password184', 'raquel.avila@example.com', 2, 'Argentina', 'ruta_imagen87.jpg');
    usuario_insertar_SP('Leandro', 'Navarro', 'lnavarro', 'password185', 'leandro.navarro@example.com', 2, 'Española', 'ruta_imagen88.jpg');
    usuario_insertar_SP('Araceli', 'Ortiz', 'aortiz', 'password186', 'araceli.ortiz@example.com', 2, 'Chilena', 'ruta_imagen89.jpg');
    usuario_insertar_SP('Ulises', 'Muñoz', 'umunoz', 'password187', 'ulises.munoz@example.com', 2, 'Peruana', 'ruta_imagen90.jpg');
    usuario_insertar_SP('Andrea', 'Romero', 'aromero', 'password188', 'andrea.romero@example.com', 2, 'Mexicana', 'ruta_imagen91.jpg');
    usuario_insertar_SP('Fernando', 'Ferrer', 'fferrer', 'password189', 'fernando.ferrer@example.com', 2, 'Colombiana', 'ruta_imagen92.jpg');
    usuario_insertar_SP('Isabel', 'González', 'igonzalez', 'password190', 'isabel.gonzalez@example.com', 2, 'Argentina', 'ruta_imagen93.jpg');
    usuario_insertar_SP('Francisco', 'Castañeda', 'fcastaneda', 'password191', 'francisco.castaneda@example.com', 2, 'Española', 'ruta_imagen94.jpg');
    usuario_insertar_SP('Gabriel', 'Becerra', 'gbecerra', 'password192', 'gabriel.becerra@example.com', 2, 'Chilena', 'ruta_imagen95.jpg');
    usuario_insertar_SP('Amelia', 'Guzmán', 'aguzman', 'password193', 'amelia.guzman@example.com', 2, 'Peruana', 'ruta_imagen96.jpg');
    usuario_insertar_SP('César', 'Rivas', 'crivas', 'password194', 'cesar.rivas@example.com', 2, 'Mexicana', 'ruta_imagen97.jpg');
    usuario_insertar_SP('Adela', 'Fuentes', 'afuentes', 'password195', 'adela.fuentes@example.com', 2, 'Colombiana', 'ruta_imagen98.jpg');
    usuario_insertar_SP('Esteban', 'Lara', 'elara', 'password196', 'esteban.lara@example.com', 2, 'Argentina', 'ruta_imagen99.jpg');
    usuario_insertar_SP('Renata', 'Peña', 'rpena', 'password197', 'renata.pena@example.com', 2, 'Española', 'ruta_imagen100.jpg');
    usuario_insertar_SP('Julio', 'Mendoza', 'jmendoza', 'password198', 'julio.mendoza@example.com', 2, 'Chilena', 'ruta_imagen101.jpg');
    usuario_insertar_SP('Ana', 'Martínez', 'amartinez', 'password199', 'ana.martinez@example.com', 2, 'Peruana', 'ruta_imagen102.jpg');
    usuario_insertar_SP('Victor', 'Ávila', 'vavila', 'password200', 'victor.avila@example.com', 2, 'Mexicana', 'ruta_imagen103.jpg');
    usuario_insertar_SP('Carlos', 'García', 'cgarcia', 'pass123', 'cgarcia@example.com', 2, 'Mexicana', 'ruta/imagen1.jpg');
    usuario_insertar_SP('Ana', 'Pérez', 'aperez', 'pass456', 'aperez@example.com', 2, 'Colombiana', 'ruta/imagen2.jpg');
    usuario_insertar_SP('Luis', 'Fernández', 'lfernandez', 'pass789', 'lfernandez@example.com', 2, 'Argentina', 'ruta/imagen3.jpg');
    usuario_insertar_SP('María', 'Rodríguez', 'mrodriguez', 'pass101', 'mrodriguez@example.com', 2, 'Peruana', 'ruta/imagen4.jpg');
    usuario_insertar_SP('Jorge', 'Martínez', 'jmartinez', 'pass202', 'jmartinez@example.com', 2, 'Chilena', 'ruta/imagen5.jpg');
    usuario_insertar_SP('Laura', 'Gómez', 'lgomez', 'pass303', 'lgomez@example.com', 2, 'Ecuatoriana', 'ruta/imagen6.jpg');
    usuario_insertar_SP('Pedro', 'Mendoza', 'pmendoza', 'pass404', 'pmendoza@example.com', 2, 'Uruguaya', 'ruta/imagen7.jpg');
    usuario_insertar_SP('Paola', 'Vásquez', 'pvasquez', 'pass505', 'pvasquez@example.com', 2, 'Boliviana', 'ruta/imagen8.jpg');
    usuario_insertar_SP('Ricardo', 'Jiménez', 'rjimenez', 'pass606', 'rjimenez@example.com', 2, 'Paraguaya', 'ruta/imagen9.jpg');
    usuario_insertar_SP('Isabella', 'Suárez', 'isuarez', 'pass707', 'isuarez@example.com', 2, 'Salvadoreña', 'ruta/imagen10.jpg');
    usuario_insertar_SP('Juan', 'Hernández', 'jhernandez', 'pass808', 'jhernandez@example.com', 2, 'Guatemalteca', 'ruta/imagen11.jpg');
    usuario_insertar_SP('Mónica', 'Jiménez', 'mjimenez', 'pass909', 'mjimenez@example.com', 2, 'Hondureña', 'ruta/imagen12.jpg');
    usuario_insertar_SP('Andrés', 'Pardo', 'apardo', 'pass1010', 'apardo@example.com', 2, 'Cubana', 'ruta/imagen13.jpg');
    usuario_insertar_SP('Verónica', 'Ramos', 'vramos', 'pass1111', 'vramos@example.com', 2, 'Dominicana', 'ruta/imagen14.jpg');
    usuario_insertar_SP('Sergio', 'Ramírez', 'sramirez', 'pass1212', 'sramirez@example.com', 2, 'Nicaragüense', 'ruta/imagen15.jpg');
    usuario_insertar_SP('Carla', 'Moreno', 'cmoreno', 'pass1313', 'cmoreno@example.com', 2, 'Panameña', 'ruta/imagen16.jpg');
    usuario_insertar_SP('Felipe', 'Ortiz', 'fortiz', 'pass1414', 'fortiz@example.com', 2, 'Boliviana', 'ruta/imagen17.jpg');
    usuario_insertar_SP('Diana', 'López', 'dlopez', 'pass1515', 'dlopez@example.com', 2, 'Salvadoreña', 'ruta/imagen18.jpg');
    usuario_insertar_SP('Rafael', 'Cruz', 'rcruz', 'pass1616', 'rcruz@example.com', 2, 'Ecuatoriana', 'ruta/imagen19.jpg');
    usuario_insertar_SP('Natalia', 'García', 'ngarcia', 'pass1717', 'ngarcia@example.com', 2, 'Paraguaya', 'ruta/imagen20.jpg');
    usuario_insertar_SP('Gustavo', 'Vásquez', 'gvasquez', 'pass1818', 'gvasquez@example.com', 2, 'Mexicana', 'ruta/imagen21.jpg');
    usuario_insertar_SP('Sofía', 'Cordero', 'scordero', 'pass1919', 'scordero@example.com', 2, 'Colombiana', 'ruta/imagen22.jpg');
    usuario_insertar_SP('Alejandro', 'Martínez', 'amartinez', 'pass2020', 'amartinez@example.com', 2, 'Argentina', 'ruta/imagen23.jpg');
    usuario_insertar_SP('Paola', 'Ríos', 'prios', 'pass2121', 'prios@example.com', 2, 'Peruana', 'ruta/imagen24.jpg');
    usuario_insertar_SP('Luis', 'Salazar', 'lsalazar', 'pass2222', 'lsalazar@example.com', 2, 'Chilena', 'ruta/imagen25.jpg');
    usuario_insertar_SP('Alejandra', 'González', 'agonzalez', 'pass2323', 'agonzalez@example.com', 2, 'Ecuatoriana', 'ruta/imagen26.jpg');
    usuario_insertar_SP('Javier', 'Mendoza', 'jmendoza', 'pass2424', 'jmendoza@example.com', 2, 'Uruguaya', 'ruta/imagen27.jpg');
    usuario_insertar_SP('Andrea', 'Martínez', 'amartinez', 'pass2525', 'amartinez@example.com', 2, 'Boliviana', 'ruta/imagen28.jpg');
    usuario_insertar_SP('Ricardo', 'Torres', 'rtorres', 'pass2626', 'rtorres@example.com', 2, 'Paraguaya', 'ruta/imagen29.jpg');
    usuario_insertar_SP('Catalina', 'Suárez', 'csuarez', 'pass2727', 'csuarez@example.com', 2, 'Salvadoreña', 'ruta/imagen30.jpg');
    usuario_insertar_SP('Héctor', 'Ramírez', 'hramirez', 'pass2828', 'hramirez@example.com', 2, 'Guatemalteca', 'ruta/imagen31.jpg');
    usuario_insertar_SP('Samantha', 'Vega', 'svega', 'pass2929', 'svega@example.com', 2, 'Hondureña', 'ruta/imagen32.jpg');
    usuario_insertar_SP('Martin', 'Reyes', 'mreyes', 'pass3030', 'mreyes@example.com', 2, 'Cubana', 'ruta/imagen33.jpg');
    usuario_insertar_SP('Isabel', 'Serrano', 'iserrano', 'pass3131', 'iserrano@example.com', 2, 'Dominicana', 'ruta/imagen34.jpg');
    usuario_insertar_SP('Luis', 'Cabrera', 'lcabrera', 'pass3232', 'lcabrera@example.com', 2, 'Nicaragüense', 'ruta/imagen35.jpg');
    usuario_insertar_SP('Julián', 'Pérez', 'jperez', 'pass3333', 'jperez@example.com', 2, 'Panameña', 'ruta/imagen36.jpg');
    usuario_insertar_SP('Natalia', 'Cano', 'ncano', 'pass3434', 'ncano@example.com', 2, 'Boliviana', 'ruta/imagen37.jpg');
    usuario_insertar_SP('Marcelo', 'Gómez', 'mgomez', 'pass3535', 'mgomez@example.com', 2, 'Salvadoreña', 'ruta/imagen38.jpg');
    usuario_insertar_SP('Margarita', 'Téllez', 'mtellez', 'pass3636', 'mtellez@example.com', 2, 'Ecuatoriana', 'ruta/imagen39.jpg');
    usuario_insertar_SP('Eduardo', 'Rodríguez', 'erodriguez', 'pass3737', 'erodriguez@example.com', 2, 'Paraguaya', 'ruta/imagen40.jpg');
    usuario_insertar_SP('Felipe', 'García', 'fgarcia', 'pass3838', 'fgarcia@example.com', 2, 'Mexicana', 'ruta/imagen41.jpg');
    usuario_insertar_SP('Carmen', 'Martínez', 'cmartinez', 'pass3939', 'cmartinez@example.com', 2, 'Colombiana', 'ruta/imagen42.jpg');
    usuario_insertar_SP('Álvaro', 'García', 'agarcía', 'pass4040', 'agarcía@example.com', 2, 'Argentina', 'ruta/imagen43.jpg');
    usuario_insertar_SP('Gabriela', 'Valencia', 'gvalencia', 'pass4141', 'gvalencia@example.com', 2, 'Peruana', 'ruta/imagen44.jpg');
    usuario_insertar_SP('Marta', 'López', 'mlopez', 'pass4242', 'mlopez@example.com', 2, 'Chilena', 'ruta/imagen45.jpg');
    usuario_insertar_SP('Héctor', 'Jiménez', 'hjimenez', 'pass4343', 'hjimenez@example.com', 2, 'Ecuatoriana', 'ruta/imagen46.jpg');
    usuario_insertar_SP('Juliana', 'Sánchez', 'jsanchez', 'pass4444', 'jsanchez@example.com', 2, 'Uruguaya', 'ruta/imagen47.jpg');
    usuario_insertar_SP('María', 'Bermúdez', 'mbermudez', 'pass4545', 'mbermudez@example.com', 2, 'Boliviana', 'ruta/imagen48.jpg');
    usuario_insertar_SP('José', 'Hernández', 'jhernandez', 'pass4646', 'jhernandez@example.com', 2, 'Paraguaya', 'ruta/imagen49.jpg');
    usuario_insertar_SP('Cristina', 'Paredes', 'cparedes', 'pass4747', 'cparedes@example.com', 2, 'Salvadoreña', 'ruta/imagen50.jpg');
    usuario_insertar_SP('Álvaro', 'Palacios', 'apalacios', 'pass4848', 'apalacios@example.com', 2, 'Guatemalteca', 'ruta/imagen51.jpg');
    usuario_insertar_SP('Natalia', 'Cardenas', 'ncardenas', 'pass4949', 'ncardenas@example.com', 2, 'Hondureña', 'ruta/imagen52.jpg');
    usuario_insertar_SP('Samuel', 'Cuellar', 'scuellar', 'pass5050', 'scuellar@example.com', 2, 'Cubana', 'ruta/imagen53.jpg');
    usuario_insertar_SP('Daniela', 'González', 'dgonzalez', 'pass5151', 'dgonzalez@example.com', 2, 'Dominicana', 'ruta/imagen54.jpg');
    usuario_insertar_SP('Luis', 'Serrano', 'lserrano', 'pass5252', 'lserrano@example.com', 2, 'Nicaragüense', 'ruta/imagen55.jpg');
    usuario_insertar_SP('Camila', 'Arias', 'carias', 'pass5353', 'carias@example.com', 2, 'Panameña', 'ruta/imagen56.jpg');
    usuario_insertar_SP('Oscar', 'Bermúdez', 'obermudez', 'pass5454', 'obermudez@example.com', 2, 'Boliviana', 'ruta/imagen57.jpg');
    usuario_insertar_SP('Lucía', 'Vega', 'lvega', 'pass5555', 'lvega@example.com', 2, 'Salvadoreña', 'ruta/imagen58.jpg');
    usuario_insertar_SP('Ricardo', 'Pérez', 'rperez', 'pass5656', 'rperez@example.com', 2, 'Ecuatoriana', 'ruta/imagen59.jpg');
    usuario_insertar_SP('Isabel', 'Ríos', 'irios', 'pass5757', 'irios@example.com', 2, 'Paraguaya', 'ruta/imagen60.jpg');
    usuario_insertar_SP('José', 'Mora', 'jmora', 'pass5858', 'jmora@example.com', 2, 'Mexicana', 'ruta/imagen61.jpg');
    usuario_insertar_SP('Laura', 'Mendoza', 'lmendoza', 'pass5959', 'lmendoza@example.com', 2, 'Colombiana', 'ruta/imagen62.jpg');
    usuario_insertar_SP('Alejandro', 'López', 'alvarez', 'pass6060', 'alvarez@example.com', 2, 'Argentina', 'ruta/imagen63.jpg');
    usuario_insertar_SP('Valeria', 'Vásquez', 'vvasquez', 'pass6161', 'vvasquez@example.com', 2, 'Peruana', 'ruta/imagen64.jpg');
    usuario_insertar_SP('Carlos', 'Castro', 'ccastro', 'pass6262', 'ccastro@example.com', 2, 'Chilena', 'ruta/imagen65.jpg');
    usuario_insertar_SP('Andrea', 'Pérez', 'aperez', 'pass6363', 'aperez@example.com', 2, 'Ecuatoriana', 'ruta/imagen66.jpg');
    usuario_insertar_SP('Mauricio', 'García', 'mgarcia', 'pass6464', 'mgarcia@example.com', 2, 'Uruguaya', 'ruta/imagen67.jpg');
    usuario_insertar_SP('Verónica', 'Martínez', 'vmartinez', 'pass6565', 'vmartinez@example.com', 2, 'Boliviana', 'ruta/imagen68.jpg');
    usuario_insertar_SP('Ricardo', 'Morales', 'rmorales', 'pass6666', 'rmorales@example.com', 2, 'Paraguaya', 'ruta/imagen69.jpg');
    usuario_insertar_SP('Alejandra', 'Torres', 'atorres', 'pass6767', 'atorres@example.com', 2, 'Salvadoreña', 'ruta/imagen70.jpg');
    usuario_insertar_SP('Oscar', 'Martínez', 'omartinez', 'pass6868', 'omartinez@example.com', 2, 'Guatemalteca', 'ruta/imagen71.jpg');
    usuario_insertar_SP('Natalia', 'Gómez', 'ngomez', 'pass6969', 'ngomez@example.com', 2, 'Hondureña', 'ruta/imagen72.jpg');
    usuario_insertar_SP('Javier', 'Pardo', 'jpardo', 'pass7070', 'jpardo@example.com', 2, 'Cubana', 'ruta/imagen73.jpg');
    usuario_insertar_SP('Catalina', 'Ramírez', 'cramirez', 'pass7171', 'cramirez@example.com', 2, 'Dominicana', 'ruta/imagen74.jpg');
    usuario_insertar_SP('David', 'Gómez', 'dgomez', 'pass7272', 'dgomez@example.com', 2, 'Nicaragüense', 'ruta/imagen75.jpg');
    usuario_insertar_SP('Sofía', 'Suárez', 'ssuarez', 'pass7373', 'ssuarez@example.com', 2, 'Panameña', 'ruta/imagen76.jpg');
    usuario_insertar_SP('Felipe', 'Vásquez', 'fvasquez', 'pass7474', 'fvasquez@example.com', 2, 'Boliviana', 'ruta/imagen77.jpg');
    usuario_insertar_SP('Juan', 'Mendoza', 'jmendoza', 'pass7575', 'jmendoza@example.com', 2, 'Salvadoreña', 'ruta/imagen78.jpg');
    usuario_insertar_SP('Mariana', 'Cruz', 'mcruz', 'pass7676', 'mcruz@example.com', 2, 'Ecuatoriana', 'ruta/imagen79.jpg');
    usuario_insertar_SP('Andrés', 'Hernández', 'ahernandez', 'pass7777', 'ahernandez@example.com', 2, 'Paraguaya', 'ruta/imagen80.jpg');
    usuario_insertar_SP('Daniel', 'García', 'dgarcia', 'pass7878', 'dgarcia@example.com', 2, 'Mexicana', 'ruta/imagen81.jpg');
    usuario_insertar_SP('Gabriela', 'Moreno', 'gmoreno', 'pass7979', 'gmoreno@example.com', 2, 'Colombiana', 'ruta/imagen82.jpg');
    usuario_insertar_SP('Luis', 'Álvarez', 'lalvarez', 'pass8080', 'lalvarez@example.com', 2, 'Argentina', 'ruta/imagen83.jpg');
    usuario_insertar_SP('Carolina', 'Vásquez', 'cvasquez', 'pass8181', 'cvasquez@example.com', 2, 'Peruana', 'ruta/imagen84.jpg');
    usuario_insertar_SP('Rafael', 'Rodríguez', 'rrodriguez', 'pass8282', 'rrodriguez@example.com', 2, 'Chilena', 'ruta/imagen85.jpg');
    usuario_insertar_SP('Laura', 'Pérez', 'lperez', 'pass8383', 'lperez@example.com', 2, 'Ecuatoriana', 'ruta/imagen86.jpg');
    usuario_insertar_SP('Jorge', 'Ramírez', 'jramirez', 'pass8484', 'jramirez@example.com', 2, 'Uruguaya', 'ruta/imagen87.jpg');
    usuario_insertar_SP('Diana', 'Martínez', 'dmartinez', 'pass8585', 'dmartinez@example.com', 2, 'Boliviana', 'ruta/imagen88.jpg');
    usuario_insertar_SP('Marcelo', 'Gómez', 'mgomez', 'pass8686', 'mgomez@example.com', 2, 'Paraguaya', 'ruta/imagen89.jpg');
    usuario_insertar_SP('Isabella', 'Suárez', 'isuarez', 'pass8787', 'isuarez@example.com', 2, 'Salvadoreña', 'ruta/imagen90.jpg');
    usuario_insertar_SP('Gabriel', 'Ortega', 'gortega', 'pass8888', 'gortega@example.com', 2, 'Guatemalteca', 'ruta/imagen91.jpg');
    usuario_insertar_SP('Natalia', 'Arias', 'narias', 'pass8989', 'narias@example.com', 2, 'Hondureña', 'ruta/imagen92.jpg');
    usuario_insertar_SP('Sergio', 'Paredes', 'sparedes', 'pass9090', 'sparedes@example.com', 2, 'Cubana', 'ruta/imagen93.jpg');
    usuario_insertar_SP('Margarita', 'Serrano', 'mserrano', 'pass9191', 'mserrano@example.com', 2, 'Dominicana', 'ruta/imagen94.jpg');
    usuario_insertar_SP('Luis', 'Martínez', 'lmartinez', 'pass9292', 'lmartinez@example.com', 2, 'Nicaragüense', 'ruta/imagen95.jpg');
    usuario_insertar_SP('Camila', 'Rodríguez', 'crodri', 'pass9393', 'crodri@example.com', 2, 'Panameña', 'ruta/imagen96.jpg');
    usuario_insertar_SP('Oscar', 'Hernández', 'ohernandez', 'pass9494', 'ohernandez@example.com', 2, 'Boliviana', 'ruta/imagen97.jpg');
    usuario_insertar_SP('Andrea', 'Cruz', 'acruz', 'pass9595', 'acruz@example.com', 2, 'Salvadoreña', 'ruta/imagen98.jpg');
    usuario_insertar_SP('Héctor', 'Vega', 'hvega', 'pass9696', 'hvega@example.com', 2, 'Ecuatoriana', 'ruta/imagen99.jpg');
    usuario_insertar_SP('Verónica', 'Mora', 'vmora', 'pass9797', 'vmora@example.com', 2, 'Paraguaya', 'ruta/imagen100.jpg');
    usuario_insertar_SP('Felipe', 'Pérez', 'fperez', 'pass9898', 'fperez@example.com', 2, 'Mexicana', 'ruta/imagen101.jpg');
    usuario_insertar_SP('María', 'Pardo', 'mpardo', 'pass9999', 'mpardo@example.com', 2, 'Colombiana', 'ruta/imagen102.jpg');
    usuario_insertar_SP('Ricardo', 'Cano', 'rcano', 'pass10000', 'rcano@example.com', 2, 'Argentina', 'ruta/imagen103.jpg');
    usuario_insertar_SP('Daniela', 'Mendoza', 'dmendoza', 'pass10101', 'dmendoza@example.com', 2, 'Peruana', 'ruta/imagen104.jpg');
    usuario_insertar_SP('Sofía', 'Bermúdez', 'sbermudez', 'pass10202', 'sbermudez@example.com', 2, 'Chilena', 'ruta/imagen105.jpg');
    usuario_insertar_SP('Oscar', 'Gómez', 'ogomez', 'pass10303', 'ogomez@example.com', 2, 'Ecuatoriana', 'ruta/imagen106.jpg');
    usuario_insertar_SP('Natalia', 'Reyes', 'nreyes', 'pass10404', 'nreyes@example.com', 2, 'Uruguaya', 'ruta/imagen107.jpg');
    usuario_insertar_SP('Luis', 'Valencia', 'lvalencia', 'pass10505', 'lvalencia@example.com', 2, 'Boliviana', 'ruta/imagen108.jpg');
    usuario_insertar_SP('Alejandra', 'Cruz', 'acruz', 'pass10606', 'acruz@example.com', 2, 'Paraguaya', 'ruta/imagen109.jpg');
    usuario_insertar_SP('Javier', 'Moreno', 'jmoreno', 'pass10707', 'jmoreno@example.com', 2, 'Salvadoreña', 'ruta/imagen110.jpg');
    usuario_insertar_SP('Mariana', 'Paredes', 'mparedes', 'pass10808', 'mparedes@example.com', 2, 'Guatemalteca', 'ruta/imagen111.jpg');
    usuario_insertar_SP('Jorge', 'Serrano', 'jserrano', 'pass10909', 'jserrano@example.com', 2, 'Hondureña', 'ruta/imagen112.jpg');
    usuario_insertar_SP('Felipe', 'Vega', 'fvega', 'pass11010', 'fvega@example.com', 2, 'Cubana', 'ruta/imagen113.jpg');
    usuario_insertar_SP('Camila', 'Rodríguez', 'crodri', 'pass11111', 'crodri@example.com', 2, 'Dominicana', 'ruta/imagen114.jpg');
    usuario_insertar_SP('Oscar', 'García', 'ogarcia', 'pass11212', 'ogarcia@example.com', 2, 'Nicaragüense', 'ruta/imagen115.jpg');
    usuario_insertar_SP('Gabriela', 'Torres', 'gtorres', 'pass11313', 'gtorres@example.com', 2, 'Panameña', 'ruta/imagen116.jpg');
    usuario_insertar_SP('Laura', 'Pérez', 'lperez', 'pass11414', 'lperez@example.com', 2, 'Boliviana', 'ruta/imagen117.jpg');
    usuario_insertar_SP('Ricardo', 'Suárez', 'rsuarez', 'pass11515', 'rsuarez@example.com', 2, 'Salvadoreña', 'ruta/imagen118.jpg');
    usuario_insertar_SP('Javier', 'Reyes', 'jreyes', 'pass11616', 'jreyes@example.com', 2, 'Ecuatoriana', 'ruta/imagen119.jpg');
    usuario_insertar_SP('Margarita', 'García', 'mgarcia', 'pass11717', 'mgarcia@example.com', 2, 'Paraguaya', 'ruta/imagen120.jpg');
    usuario_insertar_SP('Isabella', 'Hernández', 'ihernandez', 'pass11818', 'ihernandez@example.com', 2, 'Mexicana', 'ruta/imagen121.jpg');
    usuario_insertar_SP('Luis', 'Pérez', 'lperez', 'pass11919', 'lperez@example.com', 2, 'Colombiana', 'ruta/imagen122.jpg');
    usuario_insertar_SP('Daniela', 'Valencia', 'dvalencia', 'pass12020', 'dvalencia@example.com', 2, 'Argentina', 'ruta/imagen123.jpg');
    usuario_insertar_SP('Oscar', 'Salazar', 'osalazar', 'pass12121', 'osalazar@example.com', 2, 'Peruana', 'ruta/imagen124.jpg');
    usuario_insertar_SP('Carmen', 'Gómez', 'cgomez', 'pass12222', 'cgomez@example.com', 2, 'Chilena', 'ruta/imagen125.jpg');
    usuario_insertar_SP('Sofía', 'Morales', 'smorales', 'pass12323', 'smorales@example.com', 2, 'Ecuatoriana', 'ruta/imagen126.jpg');
    usuario_insertar_SP('Felipe', 'Suárez', 'fsuarez', 'pass12424', 'fsuarez@example.com', 2, 'Uruguaya', 'ruta/imagen127.jpg');
    usuario_insertar_SP('Alejandra', 'Bermúdez', 'abermudez', 'pass12525', 'abermudez@example.com', 2, 'Boliviana', 'ruta/imagen128.jpg');
    usuario_insertar_SP('Luis', 'Mora', 'lmora', 'pass12626', 'lmora@example.com', 2, 'Paraguaya', 'ruta/imagen129.jpg');
    usuario_insertar_SP('Mariana', 'Serrano', 'mserrano', 'pass12727', 'mserrano@example.com', 2, 'Salvadoreña', 'ruta/imagen130.jpg');
    usuario_insertar_SP('Gabriel', 'González', 'ggonzalez', 'pass12828', 'ggonzalez@example.com', 2, 'Guatemalteca', 'ruta/imagen131.jpg');
    usuario_insertar_SP('Natalia', 'Reyes', 'nreyes', 'pass12929', 'nreyes@example.com', 2, 'Hondureña', 'ruta/imagen132.jpg');
    usuario_insertar_SP('Oscar', 'Cuellar', 'ocuellar', 'pass13030', 'ocuellar@example.com', 2, 'Cubana', 'ruta/imagen133.jpg');
    usuario_insertar_SP('Daniela', 'García', 'dgarcia', 'pass13131', 'dgarcia@example.com', 2, 'Dominicana', 'ruta/imagen134.jpg');
    usuario_insertar_SP('Sergio', 'Martínez', 'smartinez', 'pass13232', 'smartinez@example.com', 2, 'Nicaragüense', 'ruta/imagen135.jpg');
    usuario_insertar_SP('Laura', 'Serrano', 'lserrano', 'pass13333', 'lserrano@example.com', 2, 'Panameña', 'ruta/imagen136.jpg');
    usuario_insertar_SP('María', 'Martínez', 'mmartinez', 'pass13434', 'mmartinez@example.com', 2, 'Boliviana', 'ruta/imagen137.jpg');
    usuario_insertar_SP('Felipe', 'Hernández', 'fhernandez', 'pass13535', 'fhernandez@example.com', 2, 'Salvadoreña', 'ruta/imagen138.jpg');
    usuario_insertar_SP('Margarita', 'Bermúdez', 'mbermudez', 'pass13636', 'mbermudez@example.com', 2, 'Ecuatoriana', 'ruta/imagen139.jpg');
    usuario_insertar_SP('José', 'Vega', 'jvega', 'pass13737', 'jvega@example.com', 2, 'Paraguaya', 'ruta/imagen140.jpg');
    usuario_insertar_SP('Álvaro', 'Hernández', 'ahernandez', 'pass13838', 'ahernandez@example.com', 2, 'Mexicana', 'ruta/imagen141.jpg');
    usuario_insertar_SP('Margarita', 'Morales', 'mmorales', 'pass13939', 'mmorales@example.com', 2, 'Colombiana', 'ruta/imagen142.jpg');
    usuario_insertar_SP('Sofía', 'Reyes', 'sreyes', 'pass14040', 'sreyes@example.com', 2, 'Argentina', 'ruta/imagen143.jpg');
    usuario_insertar_SP('Ricardo', 'Salazar', 'rsalazar', 'pass14141', 'rsalazar@example.com', 2, 'Peruana', 'ruta/imagen144.jpg');
    usuario_insertar_SP('José', 'Vásquez', 'jvasquez', 'pass14242', 'jvasquez@example.com', 2, 'Chilena', 'ruta/imagen145.jpg');
    usuario_insertar_SP('Natalia', 'Hernández', 'nhernandez', 'pass14343', 'nhernandez@example.com', 2, 'Ecuatoriana', 'ruta/imagen146.jpg');
    usuario_insertar_SP('Carlos', 'Serrano', 'cserrano', 'pass14444', 'cserrano@example.com', 2, 'Uruguaya', 'ruta/imagen147.jpg');
    usuario_insertar_SP('Alejandra', 'Vásquez', 'avazquez', 'pass14545', 'avazquez@example.com', 2, 'Boliviana', 'ruta/imagen148.jpg');
    usuario_insertar_SP('Felipe', 'Cruz', 'fcruz', 'pass14646', 'fcruz@example.com', 2, 'Paraguaya', 'ruta/imagen149.jpg');
    usuario_insertar_SP('Luis', 'Martínez', 'lmartinez', 'pass14747', 'lmartinez@example.com', 2, 'Salvadoreña', 'ruta/imagen150.jpg');

END;



---- DATOS DE CONTENEDOR ----
begin
contenedor_insertar_SP(1, 'l', 20, 150, 45, 75, 3);
end;
BEGIN
    contenedor_insertar_SP(15, 'Activo', 20, 1500, 45, 75, 3);
    contenedor_insertar_SP(18, 'Activo', 25, 2000, 101, 65, 6);
    contenedor_insertar_SP(22, 'Activo', 30, 2500, 33, 80, 8);
    contenedor_insertar_SP(12, 'Activo', 15, 1200, 202, 92, 5);
    contenedor_insertar_SP(20, 'Activo', 22, 1800, 80, 90, 2);
    /*
    contenedor_insertar_SP(16.25, 'Activo', 18.00, 1600.00, 150, 55, 7);
    contenedor_insertar_SP(14.00, 'Activo', 20.00, 1300.00, 8, 145, 10);
    contenedor_insertar_SP(21.50, 'Activo', 26.00, 2200.00, 27, 99, 4);
    contenedor_insertar_SP(19.75, 'Activo', 23.00, 2100.00, 100, 87, 1);
    contenedor_insertar_SP(17.00, 'Activo', 24.00, 2000.00, 55, 77, 9);
    contenedor_insertar_SP(13.50, 'Activo', 17.00, 1400.00, 66, 45, 8);
    contenedor_insertar_SP(24.00, 'Activo', 28.00, 2300.00, 85, 60, 6);
    contenedor_insertar_SP(11.75, 'Activo', 16.00, 1200.00, 43, 120, 3);
    contenedor_insertar_SP(23.00, 'Activo', 29.00, 2400.00, 78, 142, 10);
    contenedor_insertar_SP(18.50, 'Activo', 21.00, 1900.00, 88, 65, 4);
    contenedor_insertar_SP(12.50, 'Activo', 19.00, 1300.00, 98, 75, 2);
    contenedor_insertar_SP(20.75, 'Activo', 27.00, 2200.00, 120, 50, 7);
    contenedor_insertar_SP(17.25, 'Activo', 25.00, 2000.00, 140, 80, 5);
    contenedor_insertar_SP(16.00, 'Activo', 22.00, 1900.00, 36, 105, 8);
    contenedor_insertar_SP(14.50, 'Activo', 18.00, 1700.00, 53, 90, 1);
    contenedor_insertar_SP(22.25, 'Activo', 24.00, 2100.00, 179, 95, 9);
    contenedor_insertar_SP(19.00, 'Activo', 23.00, 2000.00, 48, 60, 6);
    contenedor_insertar_SP(21.00, 'Activo', 26.00, 2300.00, 103, 110, 3);
    contenedor_insertar_SP(17.50, 'Activo', 21.00, 1900.00, 66, 130, 2);
    contenedor_insertar_SP(12.75, 'Activo', 20.00, 1400.00, 89, 80, 7);
    contenedor_insertar_SP(23.50, 'Activo', 28.00, 2500.00, 154, 70, 4);
    contenedor_insertar_SP(15.00, 'Activo', 19.00, 1600.00, 120, 150, 5);
    contenedor_insertar_SP(20.50, 'Activo', 25.00, 2200.00, 170, 110, 8);
    contenedor_insertar_SP(18.25, 'Activo', 22.00, 2000.00, 82, 85, 6);
    contenedor_insertar_SP(11.50, 'Activo', 18.00, 1300.00, 62, 140, 9);
    contenedor_insertar_SP(22.75, 'Activo', 27.00, 2400.00, 150, 60, 1);
    contenedor_insertar_SP(19.50, 'Activo', 23.00, 2100.00, 93, 75, 4);
    contenedor_insertar_SP(13.25, 'Activo', 16.00, 1200.00, 44, 100, 7);
    contenedor_insertar_SP(20.25, 'Activo', 24.00, 1900.00, 170, 55, 2);
    contenedor_insertar_SP(17.75, 'Activo', 21.00, 2000.00, 119, 90, 8);
    contenedor_insertar_SP(16.50, 'Activo', 22.00, 1800.00, 77, 120, 3);
    contenedor_insertar_SP(14.25, 'Activo', 20.00, 1700.00, 131, 70, 10);
    contenedor_insertar_SP(24.25, 'Activo', 28.00, 2300.00, 60, 80, 6);
    contenedor_insertar_SP(12.00, 'Activo', 17.00, 1400.00, 45, 130, 5);
    contenedor_insertar_SP(21.75, 'Activo', 26.00, 2200.00, 102, 60, 4);
    contenedor_insertar_SP(19.25, 'Activo', 23.00, 2000.00, 111, 75, 8);
    contenedor_insertar_SP(17.00, 'Activo', 24.00, 2100.00, 58, 90, 2);
    contenedor_insertar_SP(15.75, 'Activo', 20.00, 1500.00, 120, 100, 7);
    contenedor_insertar_SP(23.75, 'Activo', 29.00, 2400.00, 84, 70, 3);
    contenedor_insertar_SP(18.00, 'Activo', 22.00, 1900.00, 99, 55, 9);
    contenedor_insertar_SP(20.00, 'Activo', 25.00, 2300.00, 75, 80, 10);
    contenedor_insertar_SP(16.75, 'Activo', 21.00, 2000.00, 103, 70, 6);
    contenedor_insertar_SP(12.25, 'Activo', 18.00, 1300.00, 48, 130, 1);
    contenedor_insertar_SP(22.50, 'Activo', 26.00, 2200.00, 134, 90, 4);
    contenedor_insertar_SP(19.00, 'Activo', 23.00, 2000.00, 92, 50, 5);
    contenedor_insertar_SP(13.00, 'Activo', 19.00, 1600.00, 119, 60, 7);
    contenedor_insertar_SP(21.25, 'Activo', 27.00, 2400.00, 73, 80, 2);
    contenedor_insertar_SP(17.50, 'Activo', 24.00, 2100.00, 101, 100, 8);
    contenedor_insertar_SP(16.00, 'Activo', 22.00, 1900.00, 62, 110, 3);
    contenedor_insertar_SP(15.25, 'Activo', 20.00, 1800.00, 45, 95, 9);
    contenedor_insertar_SP(24.00, 'Activo', 28.00, 2500.00, 77, 60, 10);
    contenedor_insertar_SP(11.00, 'Activo', 16.00, 1300.00, 56, 120, 5);
    contenedor_insertar_SP(23.00, 'Activo', 27.00, 2300.00, 67, 55, 7);
    contenedor_insertar_SP(18.75, 'Activo', 22.00, 2000.00, 78, 70, 4);
    contenedor_insertar_SP(12.50, 'Activo', 19.00, 1400.00, 41, 80, 2);
    contenedor_insertar_SP(20.75, 'Activo', 24.00, 1900.00, 102, 95, 6);
    contenedor_insertar_SP(17.25, 'Activo', 21.00, 2000.00, 58, 70, 1);
    contenedor_insertar_SP(16.75, 'Activo', 22.00, 1800.00, 88, 60, 3);
    contenedor_insertar_SP(14.00, 'Activo', 20.00, 1700.00, 45, 120, 10);
    contenedor_insertar_SP(23.50, 'Activo', 29.00, 2400.00, 92, 50, 7);
    contenedor_insertar_SP(12.75, 'Activo', 18.00, 1300.00, 115, 75, 9);
    contenedor_insertar_SP(21.50, 'Activo', 27.00, 2200.00, 68, 100, 6);
    contenedor_insertar_SP(19.75, 'Activo', 23.00, 2100.00, 129, 85, 4);
    contenedor_insertar_SP(13.50, 'Activo', 16.00, 1400.00, 80, 90, 5);
    contenedor_insertar_SP(20.00, 'Activo', 24.00, 2000.00, 40, 110, 2);
    contenedor_insertar_SP(17.00, 'Activo', 21.00, 1900.00, 93, 55, 8);
    contenedor_insertar_SP(16.25, 'Activo', 22.00, 1800.00, 104, 95, 1);
    contenedor_insertar_SP(14.50, 'Activo', 20.00, 1700.00, 71, 90, 7);
    contenedor_insertar_SP(22.00, 'Activo', 26.00, 2200.00, 88, 60, 9);
    contenedor_insertar_SP(19.00, 'Activo', 23.00, 2000.00, 101, 110, 3);
    contenedor_insertar_SP(15.75, 'Activo', 20.00, 1600.00, 113, 85, 5);
    contenedor_insertar_SP(24.50, 'Activo', 28.00, 2300.00, 85, 70, 10);
    contenedor_insertar_SP(11.25, 'Activo', 17.00, 1400.00, 56, 100, 8);
    contenedor_insertar_SP(21.75, 'Activo', 26.00, 2200.00, 142, 95, 6);
    contenedor_insertar_SP(19.25, 'Activo', 23.00, 2000.00, 81, 60, 2);
    contenedor_insertar_SP(17.50, 'Activo', 24.00, 2100.00, 98, 70, 7);
    contenedor_insertar_SP(12.00, 'Activo', 18.00, 1300.00, 43, 130, 9);
    contenedor_insertar_SP(23.25, 'Activo', 27.00, 2300.00, 112, 75, 1);
    contenedor_insertar_SP(18.50, 'Activo', 22.00, 1900.00, 76, 50, 4);
    contenedor_insertar_SP(20.25, 'Activo', 24.00, 2000.00, 57, 85, 6);
    contenedor_insertar_SP(16.00, 'Activo', 21.00, 2000.00, 63, 90, 2);
    contenedor_insertar_SP(14.00, 'Activo', 20.00, 1800.00, 77, 60, 3);
    contenedor_insertar_SP(22.75, 'Activo', 27.00, 2200.00, 88, 75, 10);
    contenedor_insertar_SP(19.50, 'Activo', 23.00, 2100.00, 45, 100, 9);
    contenedor_insertar_SP(13.75, 'Activo', 16.00, 1400.00, 54, 60, 8);
    contenedor_insertar_SP(21.00, 'Activo', 26.00, 2300.00, 100, 95, 7);
    contenedor_insertar_SP(17.00, 'Activo', 21.00, 2000.00, 109, 85, 4);
    contenedor_insertar_SP(16.25, 'Activo', 22.00, 1800.00, 60, 70, 6);
    contenedor_insertar_SP(15.00, 'Activo', 20.00, 1500.00, 101, 120, 1);
    contenedor_insertar_SP(24.75, 'Activo', 28.00, 2500.00, 137, 90, 8);
    contenedor_insertar_SP(12.50, 'Activo', 17.00, 1300.00, 110, 75, 2);
    contenedor_insertar_SP(21.25, 'Activo', 27.00, 2200.00, 89, 60, 5);
    contenedor_insertar_SP(19.75, 'Activo', 23.00, 2000.00, 46, 95, 4);
    contenedor_insertar_SP(17.50, 'Activo', 21.00, 1900.00, 121, 85, 6);
    contenedor_insertar_SP(16.75, 'Activo', 22.00, 1800.00, 95, 55, 7);
    contenedor_insertar_SP(14.75, 'Activo', 20.00, 1700.00, 110, 70, 9);
    contenedor_insertar_SP(23.00, 'Activo', 28.00, 2300.00, 56, 90, 10);
    contenedor_insertar_SP(12.75, 'Activo', 18.00, 1400.00, 90, 65, 8);
    contenedor_insertar_SP(20.50, 'Activo', 25.00, 2200.00, 72, 80, 3);
    contenedor_insertar_SP(18.00, 'Activo', 22.00, 2000.00, 133, 55, 6);
    contenedor_insertar_SP(13.25, 'Activo', 19.00, 1600.00, 88, 60, 2);
    contenedor_insertar_SP(21.75, 'Activo', 27.00, 2300.00, 91, 95, 7);
    contenedor_insertar_SP(17.25, 'Activo', 24.00, 2100.00, 81, 70, 4);
    contenedor_insertar_SP(16.50, 'Activo', 22.00, 1900.00, 50, 100, 1);
    contenedor_insertar_SP(14.00, 'Activo', 20.00, 1700.00, 45, 110, 8);
    contenedor_insertar_SP(24.00, 'Activo', 28.00, 2500.00, 67, 60, 9);
    contenedor_insertar_SP(12.25, 'Activo', 17.00, 1300.00, 130, 75, 10);
    contenedor_insertar_SP(22.50, 'Activo', 26.00, 2200.00, 89, 80, 2);
    contenedor_insertar_SP(19.25, 'Activo', 23.00, 2000.00, 54, 90, 4);
    contenedor_insertar_SP(13.75, 'Activo', 16.00, 1400.00, 68, 120, 6);
    contenedor_insertar_SP(20.75, 'Activo', 24.00, 1900.00, 110, 55, 5);
    contenedor_insertar_SP(17.50, 'Activo', 21.00, 2000.00, 64, 95, 3);
    contenedor_insertar_SP(16.25, 'Activo', 22.00, 1800.00, 96, 70, 8);
    contenedor_insertar_SP(14.50, 'Activo', 20.00, 1700.00, 111, 90, 1);
    contenedor_insertar_SP(23.75, 'Activo', 28.00, 2300.00, 72, 100, 7);
    contenedor_insertar_SP(12.50, 'Activo', 18.00, 1300.00, 123, 80, 6);
    contenedor_insertar_SP(21.00, 'Activo', 27.00, 2200.00, 101, 95, 5);
    contenedor_insertar_SP(19.00, 'Activo', 23.00, 2000.00, 59, 65, 4);
    contenedor_insertar_SP(17.25, 'Activo', 21.00, 1900.00, 88, 55, 9);
    contenedor_insertar_SP(16.50, 'Activo', 22.00, 1800.00, 103, 75, 3);
    contenedor_insertar_SP(14.00, 'Activo', 20.00, 1700.00, 118, 80, 8);
    contenedor_insertar_SP(24.50, 'Activo', 28.00, 2500.00, 135, 70, 7);
    contenedor_insertar_SP(12.75, 'Activo', 18.00, 1400.00, 109, 60, 10);
    contenedor_insertar_SP(21.25, 'Activo', 26.00, 2300.00, 46, 95, 1);
    contenedor_insertar_SP(19.50, 'Activo', 23.00, 2000.00, 78, 100, 4);
    contenedor_insertar_SP(17.00, 'Activo', 21.00, 1900.00, 92, 70, 2);
    contenedor_insertar_SP(16.00, 'Activo', 22.00, 1800.00, 80, 85, 9);
    contenedor_insertar_SP(14.50, 'Activo', 20.00, 1700.00, 101, 55, 8);
    contenedor_insertar_SP(23.00, 'Activo', 28.00, 2300.00, 107, 75, 7);
    contenedor_insertar_SP(12.00, 'Activo', 17.00, 1300.00, 128, 80, 2);
    contenedor_insertar_SP(22.25, 'Activo', 26.00, 2200.00, 98, 65, 4);
    contenedor_insertar_SP(19.75, 'Activo', 23.00, 2000.00, 82, 90, 6);
    contenedor_insertar_SP(13.50, 'Activo', 16.00, 1400.00, 124, 75, 9);
    contenedor_insertar_SP(20.00, 'Activo', 24.00, 1900.00, 54, 100, 1);
    contenedor_insertar_SP(17.75, 'Activo', 21.00, 2000.00, 99, 95, 3);
    contenedor_insertar_SP(16.00, 'Activo', 22.00, 1800.00, 118, 70, 6);
    contenedor_insertar_SP(14.25, 'Activo', 20.00, 1700.00, 120, 80, 5);
    contenedor_insertar_SP(23.50, 'Activo', 27.00, 2300.00, 84, 90, 10);
    contenedor_insertar_SP(12.50, 'Activo', 18.00, 1300.00, 68, 95, 4);
    contenedor_insertar_SP(21.00, 'Activo', 27.00, 2200.00, 101, 100, 7);
    contenedor_insertar_SP(19.25, 'Activo', 23.00, 2000.00, 72, 85, 9);
    contenedor_insertar_SP(17.50, 'Activo', 21.00, 1900.00, 92, 75, 8);
    contenedor_insertar_SP(16.75, 'Activo', 22.00, 1800.00, 116, 60, 3);
    contenedor_insertar_SP(14.00, 'Activo', 20.00, 1700.00, 111, 90, 1);
    contenedor_insertar_SP(24.25, 'Activo', 28.00, 2400.00, 79, 100, 6);
    contenedor_insertar_SP(12.75, 'Activo', 17.00, 1300.00, 125, 85, 2);
    contenedor_insertar_SP(21.50, 'Activo', 26.00, 2300.00, 51, 95, 4);
    contenedor_insertar_SP(19.00, 'Activo', 23.00, 2000.00, 63, 75, 5);
    contenedor_insertar_SP(17.75, 'Activo', 21.00, 1900.00, 140, 80, 7);
    contenedor_insertar_SP(16.50, 'Activo', 22.00, 1800.00, 120, 70, 10);
    contenedor_insertar_SP(14.25, 'Activo', 20.00, 1700.00, 82, 60, 8);
    contenedor_insertar_SP(23.75, 'Activo', 28.00, 2300.00, 99, 100, 9);
    contenedor_insertar_SP(12.25, 'Activo', 17.00, 1300.00, 115, 70, 2);
    contenedor_insertar_SP(21.75, 'Activo', 27.00, 2200.00, 97, 85, 6);
    contenedor_insertar_SP(19.50, 'Activo', 23.00, 2000.00, 104, 55, 7);
    contenedor_insertar_SP(17.00, 'Activo', 21.00, 1900.00, 80, 65, 4);
    contenedor_insertar_SP(16.00, 'Activo', 22.00, 1800.00, 102, 95, 3);
    contenedor_insertar_SP(14.00, 'Activo', 20.00, 1700.00, 117, 80, 9);
    contenedor_insertar_SP(23.50, 'Activo', 28.00, 2400.00, 127, 70, 8);
    contenedor_insertar_SP(12.00, 'Activo', 17.00, 1300.00, 136, 75, 2);
    contenedor_insertar_SP(21.00, 'Activo', 26.00, 2200.00, 100, 90, 1);
    contenedor_insertar_SP(19.25, 'Activo', 23.00, 2000.00, 85, 100, 5);
    contenedor_insertar_SP(17.75, 'Activo', 21.00, 1900.00, 77, 85, 10);
    contenedor_insertar_SP(16.00, 'Activo', 22.00, 1800.00, 121, 70, 3);
    contenedor_insertar_SP(14.25, 'Activo', 20.00, 1700.00, 124, 65, 8);
    contenedor_insertar_SP(23.00, 'Activo', 28.00, 2300.00, 131, 55, 7);
    contenedor_insertar_SP(12.50, 'Activo', 17.00, 1300.00, 100, 95, 9);
    contenedor_insertar_SP(21.75, 'Activo', 27.00, 2200.00, 72, 85, 6);
    contenedor_insertar_SP(19.50, 'Activo', 23.00, 2000.00, 120, 60, 10);
    contenedor_insertar_SP(17.25, 'Activo', 21.00, 1900.00, 94, 75, 4);
    contenedor_insertar_SP(16.75, 'Activo', 22.00, 1800.00, 135, 80, 1);
    contenedor_insertar_SP(14.00, 'Activo', 20.00, 1700.00, 102, 70, 6);
    contenedor_insertar_SP(23.75, 'Activo', 28.00, 2400.00, 130, 55, 7);
    contenedor_insertar_SP(12.25, 'Activo', 17.00, 1300.00, 115, 80, 2);
    contenedor_insertar_SP(21.50, 'Activo', 26.00, 2200.00, 98, 75, 8);
    contenedor_insertar_SP(19.00, 'Activo', 23.00, 2000.00, 88, 100, 5);
    contenedor_insertar_SP(17.75, 'Activo', 21.00, 1900.00, 126, 65, 3);
    contenedor_insertar_SP(16.00, 'Activo', 22.00, 1800.00, 142, 90, 9);
    contenedor_insertar_SP(14.50, 'Activo', 20.00, 1700.00, 113, 80, 4);
    contenedor_insertar_SP(24.00, 'Activo', 27.00, 2300.00, 129, 95, 10);
    contenedor_insertar_SP(12.75, 'Activo', 17.00, 1300.00, 116, 70, 6);
    contenedor_insertar_SP(21.00, 'Activo', 26.00, 2200.00, 112, 90, 7);
    contenedor_insertar_SP(19.25, 'Activo', 23.00, 2000.00, 85, 80, 5);
    contenedor_insertar_SP(17.50, 'Activo', 21.00, 1900.00, 91, 65, 9);
    contenedor_insertar_SP(16.75, 'Activo', 22.00, 1800.00, 100, 100, 3);
    contenedor_insertar_SP(14.25, 'Activo', 20.00, 1700.00, 125, 75, 4);
    contenedor_insertar_SP(24.50, 'Activo', 28.00, 2300.00, 107, 90, 8);
    contenedor_insertar_SP(12.00, 'Activo', 17.00, 1300.00, 140, 85, 1);
    contenedor_insertar_SP(21.25, 'Activo', 27.00, 2200.00, 108, 70, 6);
    contenedor_insertar_SP(19.75, 'Activo', 23.00, 2000.00, 91, 100, 9);
    contenedor_insertar_SP(17.00, 'Activo', 21.00, 1900.00, 134, 75, 3);
    contenedor_insertar_SP(16.50, 'Activo', 22.00, 1800.00, 115, 60, 7);
    contenedor_insertar_SP(14.75, 'Activo', 20.00, 1700.00, 122, 80, 2);
    contenedor_insertar_SP(24.00, 'Activo', 27.00, 2300.00, 129, 90, 4);
    contenedor_insertar_SP(12.25, 'Activo', 17.00, 1300.00, 123, 70, 1);
    */
END;
 
 
 
---- DATOS DE CONTENEDOR PRODUCTO ----


BEGIN
 contenedor_producto_insertar_SP(199, 34, 300);
end;

BEGIN
    contenedor_producto_insertar_SP(199, 34, 300);
    contenedor_producto_insertar_SP(58, 76, 120);
    contenedor_producto_insertar_SP(142, 189, 150);
    contenedor_producto_insertar_SP(87, 55, 275);
    contenedor_producto_insertar_SP(101, 47, 190);
    contenedor_producto_insertar_SP(150, 92, 220);
    contenedor_producto_insertar_SP(37, 111, 450);
    contenedor_producto_insertar_SP(6, 167, 345);
    contenedor_producto_insertar_SP(74, 133, 375);
    contenedor_producto_insertar_SP(184, 59, 310);
    contenedor_producto_insertar_SP(22, 71, 215);
    contenedor_producto_insertar_SP(110, 126, 340);
    contenedor_producto_insertar_SP(99, 44, 230);
    contenedor_producto_insertar_SP(140, 85, 395);
    contenedor_producto_insertar_SP(45, 151, 275);
    contenedor_producto_insertar_SP(160, 18, 290);
    contenedor_producto_insertar_SP(3, 103, 310);
    contenedor_producto_insertar_SP(200, 75, 410);
    contenedor_producto_insertar_SP(127, 146, 180);
    contenedor_producto_insertar_SP(64, 28, 160);
    contenedor_producto_insertar_SP(132, 92, 320);
    contenedor_producto_insertar_SP(18, 133, 290);
    contenedor_producto_insertar_SP(87, 60, 360);
    contenedor_producto_insertar_SP(153, 110, 430);
    contenedor_producto_insertar_SP(98, 44, 275);
    contenedor_producto_insertar_SP(54, 82, 210);
    contenedor_producto_insertar_SP(139, 126, 240);
    contenedor_producto_insertar_SP(65, 101, 325);
    contenedor_producto_insertar_SP(176, 45, 290);
    contenedor_producto_insertar_SP(31, 157, 380);
    contenedor_producto_insertar_SP(143, 9, 140);
    contenedor_producto_insertar_SP(59, 113, 315);
    contenedor_producto_insertar_SP(126, 67, 295);
    contenedor_producto_insertar_SP(80, 175, 430);
    contenedor_producto_insertar_SP(17, 98, 230);
    contenedor_producto_insertar_SP(147, 50, 345);
    contenedor_producto_insertar_SP(72, 154, 210);
    contenedor_producto_insertar_SP(185, 36, 360);
    contenedor_producto_insertar_SP(38, 115, 180);
    contenedor_producto_insertar_SP(113, 80, 310);
    contenedor_producto_insertar_SP(5, 48, 290);
    contenedor_producto_insertar_SP(164, 120, 240);
    contenedor_producto_insertar_SP(81, 142, 410);
    contenedor_producto_insertar_SP(21, 63, 280);
    contenedor_producto_insertar_SP(137, 149, 325);
    contenedor_producto_insertar_SP(10, 96, 210);
    contenedor_producto_insertar_SP(102, 62, 275);
    contenedor_producto_insertar_SP(60, 108, 295);
    contenedor_producto_insertar_SP(178, 33, 330);
    contenedor_producto_insertar_SP(97, 143, 185);
    contenedor_producto_insertar_SP(46, 79, 150);
    contenedor_producto_insertar_SP(170, 123, 340);
    contenedor_producto_insertar_SP(32, 77, 270);
    contenedor_producto_insertar_SP(159, 41, 220);
    contenedor_producto_insertar_SP(53, 135, 180);
    contenedor_producto_insertar_SP(189, 68, 365);
    contenedor_producto_insertar_SP(12, 89, 195);
    contenedor_producto_insertar_SP(105, 130, 315);
    contenedor_producto_insertar_SP(39, 53, 290);
    contenedor_producto_insertar_SP(166, 7, 250);
    contenedor_producto_insertar_SP(73, 118, 400);
    contenedor_producto_insertar_SP(20, 104, 180);
    contenedor_producto_insertar_SP(136, 47, 285);
    contenedor_producto_insertar_SP(89, 162, 230);
    contenedor_producto_insertar_SP(158, 25, 310);
    contenedor_producto_insertar_SP(67, 114, 370);
    contenedor_producto_insertar_SP(115, 6, 155);
    contenedor_producto_insertar_SP(84, 83, 300);
    contenedor_producto_insertar_SP(13, 136, 230);
    contenedor_producto_insertar_SP(141, 61, 350);
    contenedor_producto_insertar_SP(48, 145, 265);
    contenedor_producto_insertar_SP(174, 30, 210);
    contenedor_producto_insertar_SP(75, 169, 290);
    contenedor_producto_insertar_SP(163, 56, 220);
    contenedor_producto_insertar_SP(4, 99, 305);
    contenedor_producto_insertar_SP(121, 171, 330);
    contenedor_producto_insertar_SP(23, 54, 245);
    contenedor_producto_insertar_SP(148, 119, 310);
    contenedor_producto_insertar_SP(71, 85, 395);
    contenedor_producto_insertar_SP(100, 13, 250);
    contenedor_producto_insertar_SP(168, 159, 275);
    contenedor_producto_insertar_SP(57, 38, 220);
    contenedor_producto_insertar_SP(116, 105, 300);
    contenedor_producto_insertar_SP(86, 1, 175);
    contenedor_producto_insertar_SP(41, 157, 315);
    contenedor_producto_insertar_SP(154, 29, 290);
    contenedor_producto_insertar_SP(11, 74, 250);
    contenedor_producto_insertar_SP(151, 139, 330);
    contenedor_producto_insertar_SP(69, 47, 280);
    contenedor_producto_insertar_SP(179, 78, 195);
    contenedor_producto_insertar_SP(30, 98, 320);
    contenedor_producto_insertar_SP(162, 111, 275);
    contenedor_producto_insertar_SP(92, 26, 310);
    contenedor_producto_insertar_SP(107, 131, 285);
    contenedor_producto_insertar_SP(15, 9, 410);
    contenedor_producto_insertar_SP(134, 58, 240);
    contenedor_producto_insertar_SP(55, 142, 360);
    contenedor_producto_insertar_SP(186, 21, 190);
    contenedor_producto_insertar_SP(8, 129, 250);
    contenedor_producto_insertar_SP(119, 84, 320);
    contenedor_producto_insertar_SP(12, 78, 320);
    contenedor_producto_insertar_SP(95, 143, 185);
    contenedor_producto_insertar_SP(41, 65, 290);
    contenedor_producto_insertar_SP(181, 92, 275);
    contenedor_producto_insertar_SP(24, 56, 230);
    contenedor_producto_insertar_SP(140, 104, 345);
    contenedor_producto_insertar_SP(57, 35, 225);
    contenedor_producto_insertar_SP(182, 73, 310);
    contenedor_producto_insertar_SP(69, 87, 250);
    contenedor_producto_insertar_SP(148, 51, 275);
    contenedor_producto_insertar_SP(17, 145, 230);
    contenedor_producto_insertar_SP(110, 22, 390);
    contenedor_producto_insertar_SP(77, 163, 180);
    contenedor_producto_insertar_SP(185, 14, 245);
    contenedor_producto_insertar_SP(36, 129, 305);
    contenedor_producto_insertar_SP(163, 68, 365);
    contenedor_producto_insertar_SP(28, 107, 210);
    contenedor_producto_insertar_SP(123, 39, 275);
    contenedor_producto_insertar_SP(60, 100, 320);
    contenedor_producto_insertar_SP(157, 28, 195);
    contenedor_producto_insertar_SP(42, 131, 250);
    contenedor_producto_insertar_SP(190, 80, 345);
    contenedor_producto_insertar_SP(104, 47, 225);
    contenedor_producto_insertar_SP(75, 170, 210);
    contenedor_producto_insertar_SP(132, 96, 315);
    contenedor_producto_insertar_SP(8, 147, 185);
    contenedor_producto_insertar_SP(174, 52, 295);
    contenedor_producto_insertar_SP(59, 136, 250);
    contenedor_producto_insertar_SP(161, 43, 330);
    contenedor_producto_insertar_SP(22, 119, 190);
    contenedor_producto_insertar_SP(115, 89, 240);
    contenedor_producto_insertar_SP(71, 64, 280);
    contenedor_producto_insertar_SP(180, 117, 360);
    contenedor_producto_insertar_SP(94, 155, 270);
    contenedor_producto_insertar_SP(166, 25, 200);
    contenedor_producto_insertar_SP(29, 121, 235);
    contenedor_producto_insertar_SP(149, 61, 295);
    contenedor_producto_insertar_SP(55, 139, 325);
    contenedor_producto_insertar_SP(133, 83, 310);
    contenedor_producto_insertar_SP(14, 103, 195);
    contenedor_producto_insertar_SP(169, 50, 245);
    contenedor_producto_insertar_SP(44, 146, 220);
    contenedor_producto_insertar_SP(137, 19, 305);
    contenedor_producto_insertar_SP(6, 84, 260);
    contenedor_producto_insertar_SP(154, 148, 335);
    contenedor_producto_insertar_SP(85, 57, 275);
    contenedor_producto_insertar_SP(195, 116, 180);
    contenedor_producto_insertar_SP(26, 32, 245);
    contenedor_producto_insertar_SP(141, 149, 360);
    contenedor_producto_insertar_SP(56, 11, 230);
    contenedor_producto_insertar_SP(189, 141, 285);
    contenedor_producto_insertar_SP(78, 54, 310);
    contenedor_producto_insertar_SP(120, 159, 240);
    contenedor_producto_insertar_SP(18, 74, 205);
    contenedor_producto_insertar_SP(187, 105, 300);
    contenedor_producto_insertar_SP(99, 99, 260);
    contenedor_producto_insertar_SP(62, 110, 310);
    contenedor_producto_insertar_SP(160, 18, 275);
    contenedor_producto_insertar_SP(23, 136, 365);
    contenedor_producto_insertar_SP(177, 71, 190);
    contenedor_producto_insertar_SP(11, 109, 240);
    contenedor_producto_insertar_SP(153, 67, 215);
    contenedor_producto_insertar_SP(39, 128, 300);
    contenedor_producto_insertar_SP(194, 30, 285);
    contenedor_producto_insertar_SP(87, 150, 235);
    contenedor_producto_insertar_SP(146, 9, 315);
    contenedor_producto_insertar_SP(48, 98, 345);
    contenedor_producto_insertar_SP(173, 49, 280);
    contenedor_producto_insertar_SP(10, 138, 205);
    contenedor_producto_insertar_SP(112, 94, 290);
    contenedor_producto_insertar_SP(53, 151, 220);
    contenedor_producto_insertar_SP(183, 15, 195);
    contenedor_producto_insertar_SP(65, 143, 305);
    contenedor_producto_insertar_SP(105, 85, 250);
    contenedor_producto_insertar_SP(168, 166, 215);
    contenedor_producto_insertar_SP(40, 135, 285);
    contenedor_producto_insertar_SP(122, 53, 270);
    contenedor_producto_insertar_SP(198, 81, 230);
    contenedor_producto_insertar_SP(90, 47, 320);
    contenedor_producto_insertar_SP(47, 174, 275);
    contenedor_producto_insertar_SP(150, 17, 215);
    contenedor_producto_insertar_SP(20, 148, 310);
    contenedor_producto_insertar_SP(143, 66, 185);
    contenedor_producto_insertar_SP(88, 114, 295);
    contenedor_producto_insertar_SP(113, 38, 235);
    contenedor_producto_insertar_SP(31, 162, 250);
    contenedor_producto_insertar_SP(128, 92, 335);
    contenedor_producto_insertar_SP(5, 127, 275);
    contenedor_producto_insertar_SP(138, 105, 320);
    contenedor_producto_insertar_SP(21, 165, 270);
    contenedor_producto_insertar_SP(158, 62, 345);
    contenedor_producto_insertar_SP(76, 33, 305);
    contenedor_producto_insertar_SP(19, 97, 295);
    contenedor_producto_insertar_SP(136, 140, 210);
    contenedor_producto_insertar_SP(93, 12, 260);
    contenedor_producto_insertar_SP(2, 144, 340);
    contenedor_producto_insertar_SP(193, 63, 250);
    contenedor_producto_insertar_SP(64, 26, 200);
    contenedor_producto_insertar_SP(199, 69, 240);
    contenedor_producto_insertar_SP(70, 37, 215);
    contenedor_producto_insertar_SP(27, 83, 360);
    contenedor_producto_insertar_SP(101, 93, 290);
    contenedor_producto_insertar_SP(162, 130, 325);
END;
