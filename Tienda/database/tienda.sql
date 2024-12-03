create database if not exists tienda;
use tienda;
create table if not exists t_usuario(
    id_usuario INT (11) auto_increment not null,
    nombre VARCHAR (100) not null,
    apellidos VARCHAR (100) not null,
    email VARCHAR (255) not null,
    password VARCHAR (255) not null,
    constraint pk_usuario PRIMARY KEY (id_usuario),
    constraint uq_email UNIQUE (email)
) ENGINE=InnoDB;

INSERT INTO t_usuario values 
(null, "Adriana", "Rodriguez Caicedo", "adri.rodriguez3874@gmail.com", "567890345"),
(null, "Bladimir", "Rasputin colon", "rasputiabldcolon123@gmail.com", "24351634"),
(null, "sofia", "tanuria velez", "softtalvelez5690@gmail.com", "128790546");

create table if not exists t_categoria(
    id_categoria INT (11) auto_increment not null,
    nombre_categoria VARCHAR (100) not null,
    constraint pk_categoria PRIMARY KEY (id_categoria),
    constraint uq_nombre_categoria UNIQUE (nombre_categoria)
) ENGINE=InnoDB;

INSERT INTO t_categoria values
(null, "Electronica"),
(null, "Comida"),
(null, "Ropa");


create table if not exists t_producto(
    id_producto INT (11) auto_increment not null,
    nombre_producto VARCHAR (200) not null,
    descripcion_producto VARCHAR (200) not null,
    precio_producto float (10,2) not null,
    stock_producto INT (10) not null,
    oferta_producto VARCHAR (100) not null,
    fecha DATE not null,
    imagen_producto VARCHAR (255),
    id_categoria INT (11) not null,
    constraint pk_producto PRIMARY KEY (id_producto),
    constraint fk_categoria FOREIGN KEY (id_categoria) REFERENCES t_categoria (id_categoria) 
) ENGINE=InnoDB;

INSERT INTO t_producto values
(null, "Samsung Galaxy A53", "Celular de ultima generacion", "1200.99", "60", "Oferta, ahorra 800,99", "2024-08-15", null, 1),
(null, "Hamburguesa", "Pan, carne, lechuga, tomate, queso", "50.99", "20", "Oferta,ahorra 12.99", "2023-02-15", null, 2),
(null, "Vestido", "Color:rojo, material:algodon tipo:corto", "70.10", "30", "Oferta, ahorra 9.99", "2021-11-03", null, 3);



create table if not exists t_pedido(
    id_pedido INT (11) auto_increment not null,
    ciudad_pedido VARCHAR (100) not null,
    direccion_pedido VARCHAR (200) not null,
    costo_pedido FLOAT (10,2) not null,
    estado_pedido VARCHAR (10) not null,
    fecha_pedido DATE not null,
    hora_pedido TIME not null,
    id_usuario INT (11),
    constraint pk_pedido PRIMARY KEY (id_pedido),
    constraint fk_usuario FOREIGN KEY (id_usuario) REFERENCES t_usuario (id_usuario)
) ENGINE=InnoDB;

INSERT INTO t_pedido values
(null, "Bogota", "cra 107 Nº 78-90", "1298758.99", "Pendiente", "2020-10-03", "09:32:15", 1),
(null, "Medellin", "av 34 Nº 52-81", "14569.99", "Cancelado", "2019-03-18", "13:41:08", 2),
(null, "Cali", "cra 198 Nº 12-69", "814456.99", "Entregado", "2024-01-11", "11:58:45", 3);


create table if not exists t_listaPedido(
    id_listaPedido INT (11) auto_increment not null,
    unidades_listaPedido INT (255) not null,
    id_pedido INT (11),
    id_producto INT (11),
    constraint pk_listaPedido PRIMARY KEY (id_listaPedido),
    constraint fk_pedido FOREIGN KEY (id_pedido) REFERENCES t_pedido (id_pedido),
    constraint fk_producto FOREIGN KEY (id_producto) REFERENCES t_producto (id_producto)
) ENGINE=InnoDB;

INSERT INTO t_listaPedido values
(null, "12", 1, 1),
(null, "32", 2, 2),
(null, "2", 3, 3);