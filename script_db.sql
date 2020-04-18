CREATE DATABASE db_film_magic;
USE db_film_magic;

CREATE TABLE direccion
(id_direccion int auto_increment primary key,
desc_direccion varchar(80) not null
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE membresia
(cod_membresia varchar(10) primary key,
tipo_membresia varchar(10) not null,
fecha_emision date not null,
estatus_membresia int not null
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE cliente
(dpi_cliente int primary key,
nombre_cliente varchar(60) not null,
apellidos_cliente varchar(80) not null,
fecha_nacimiento date not null,
correo_cliente varchar(100) not null,
telefono_cliente int,
fk_direccion int,
fk_membresia varchar(10),
FOREIGN KEY (fk_direccion) REFERENCES direccion(id_direccion),
FOREIGN KEY (fk_membresia) REFERENCES membresia(cod_membresia)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE categoria
(id_categoria int auto_increment primary key,
categoria_desc varchar(100) not null
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE autor
(id_autor int auto_increment primary key,
nombre_autor varchar(100) not null,
nacionalidad_autor varchar(100) not null
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE clasificacion
(cod_clasificacion varchar(5) primary key,
desc_clasificacion varchar(100) not null
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE formato
(id_formato int auto_increment primary key,
formato_filme varchar(25) not null
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE filmaciones
(id_filme varchar(10) primary key,
nombre_filmacion varchar(100) not null,
desc_filmacion varchar(255) not null,
fecha_estreno date not null,
film_rating int not null,
stock_film int,
fk_categoria int,
fk_autor int,
fk_clasificacion varchar(5),
fk_formato int,
FOREIGN KEY (fk_categoria) REFERENCES categoria(id_categoria),
FOREIGN KEY (fk_autor) REFERENCES autor(id_autor),
FOREIGN KEY (fk_clasificacion) REFERENCES clasificacion(cod_clasificacion),
FOREIGN KEY (fk_formato) REFERENCES formato(id_formato)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE alquiler
(id_alquiler int auto_increment primary key,
fecha_alquiler date not null,
fecha_devolver date not null,
fk_cliente int,
FOREIGN KEY (fk_cliente) REFERENCES cliente(dpi_cliente),
total_alquiler float
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE pelicula_alquiler
(fk_filme varchar(10),
fk_alquiler int,
precio_alquiler float not null,
FOREIGN KEY (fk_filme) REFERENCES filmaciones(id_filme),
FOREIGN KEY (fk_alquiler) REFERENCES alquiler(id_alquiler)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE devolucion
(id_devolucion int auto_increment primary key,
fk_alquiler int not null,
fecha_devuelto date not null,
multa_dev float,
FOREIGN KEY (fk_alquiler) REFERENCES alquiler(id_alquiler)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE bonos
(id_bono int auto_increment primary key,
fecha_bono date not null,
fk_cliente int,
FOREIGN KEY (fk_cliente) REFERENCES cliente(dpi_cliente)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;