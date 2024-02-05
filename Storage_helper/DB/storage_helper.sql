-- Création de la base de données
CREATE DATABASE IF NOT EXISTS warehouse_inventory;
USE warehouse_inventory;

-- Création de la table pour les types de paquets
CREATE TABLE package_types (
    package_type_id INT PRIMARY KEY,
    package_type_name VARCHAR(50) NOT NULL
);

-- Insertion des types de paquets (petit, moyen, grand)
INSERT INTO package_types (package_type_id, package_type_name) VALUES
(1, 'Small'),
(2, 'Medium'),
(3, 'Large');

-- Création de la table pour les rayons
CREATE TABLE shelves (
    shelf_id INT PRIMARY KEY,
    shelf_name VARCHAR(50) NOT NULL
);

-- Insertion des rayons (1 à 7)
INSERT INTO shelves (shelf_id, shelf_name) VALUES
(1, 'Shelf 1'),
(2, 'Shelf 2'),
(3, 'Shelf 3'),
(4, 'Shelf 4'),
(5, 'Shelf 5'),
(6, 'Shelf 6'),
(7, 'Shelf 7');

-- Création de la table pour les portes de chargement
CREATE TABLE loading_doors (
    door_id INT PRIMARY KEY,
    door_name VARCHAR(50) NOT NULL
);

-- Insertion des portes de chargement (1 à 5)
INSERT INTO loading_doors (door_id, door_name) VALUES
(1, 'Door 1'),
(2, 'Door 2'),
(3, 'Door 3'),
(4, 'Door 4'),
(5, 'Door 5');

-- Création de la table pour les paquets
CREATE TABLE packages (
    package_id INT PRIMARY KEY,
    package_type_id INT,
    shelf_id INT,
    door_id INT,
    package_name VARCHAR(50) NOT NULL,
    FOREIGN KEY (package_type_id) REFERENCES package_types(package_type_id),
    FOREIGN KEY (shelf_id) REFERENCES shelves(shelf_id),
    FOREIGN KEY (door_id) REFERENCES loading_doors(door_id)
);
