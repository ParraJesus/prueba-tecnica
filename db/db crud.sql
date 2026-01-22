INSERT INTO SpaceTypes (Type, Description) VALUES
('Salón de eventos', 'Espacio amplio para eventos sociales y corporativos'),
('Salón de seminarios', 'Espacio equipado para charlas, cursos y conferencias'),
('Cancha de fútbol', 'Cancha deportiva para partidos de fútbol'),
('Cancha de básquet', 'Cancha deportiva para partidos de básquet');

INSERT INTO Roles (Name, Description) VALUES
('USUARIO', 'Usuario del sistema'),
('ADMINISTRADOR', 'Administrador del sistema');

INSERT INTO ReservationStates (State, Description) VALUES
('PENDIENTE', 'Reserva creada pero aún no confirmada'),
('CONFIRMADA', 'Reserva confirmada y válida'),
('CANCELADA', 'Reserva cancelada'),
('COMPLETADA', 'Reserva finalizada');

INSERT INTO Seasons (Name, StartDate, EndDate) VALUES
('Temporada Baja', '2026-01-01', '2026-03-31'),
('Temporada Media', '2026-04-01', '2026-06-30'),
('Temporada Alta', '2026-07-01', '2026-09-30'),
('Temporada Festiva', '2026-12-15', '2027-01-15');

INSERT INTO PhysicalSpaces (Name, MaxCapacity, Description, Type) VALUES
('Salón Principal', 300, 'Salón grande para eventos sociales', 1),
('Salón Ejecutivo', 80, 'Salón para seminarios y reuniones', 2),
('Cancha Central de Fútbol', 22, 'Cancha de fútbol reglamentaria', 3),
('Cancha Norte de Básquet', 10, 'Cancha de básquet techada', 4),
('Cancha Sintética de Fútbol', 22, 'Cancha de fútbol sintética con techo', 3);

INSERT INTO Price_Space (SpaceId, SeasonId, PricePerDay) VALUES
-- Salón Principal
(1, 1, 500.00),
(1, 2, 650.00),
(1, 3, 800.00),
(1, 4, 1000.00),

-- Salón Ejecutivo
(2, 1, 300.00),
(2, 2, 400.00),
(2, 3, 500.00),
(2, 4, 650.00),

-- Cancha de fútbol
(3, 1, 200.00),
(3, 2, 250.00),
(3, 3, 300.00),

-- Cancha de básquet
(4, 1, 180.00),
(4, 2, 220.00),
(4, 3, 280.00),

-- Cancha Sintética de fútbol
(5, 1, 100.00),
(5, 2, 150.00),
(5, 3, 200.00);

INSERT INTO Users (
    IdCard, FirstName, SecondName, FirstSurname, SecondSurname,
    Email, Password, RoleID
) VALUES
('12345678', 'Jesus', NULL, 'Parra', NULL, 'juanperez@gmail.com', 'HASH_PASSWORD', 1),
('87654321', 'María', NULL, 'Gómez', NULL, 'mariagomez@gmail.com', 'HASH_PASSWORD', 2),
('12344678', 'Esteban', NULL, 'Gonzales', NULL, 'esteban@gmail.com', 'HASH_PASSWORD', 1),
('87254321', 'Mario', NULL, 'Hernandez', NULL, 'mario@gmail.com', 'HASH_PASSWORD', 2),
('87643421', 'Cintia', NULL, 'Hernandez', NULL, 'cintia@gmail.com', 'HASH_PASSWORD', 2);

INSERT INTO Reservations (
    SpaceId, UserId, ReservationStateID,
    StartDate, EndDate, TotalPrice, TotalNumberPeople
) VALUES
(2, 2, 2, '2026-02-15', '2026-02-16', 800.00, 40),
(4, 3, 4, '2026-01-20', '2026-01-20', 180.00, 10),
(3, 4, 2, '2026-03-10', '2026-03-10', 200.00, 22),
(1, 5, 1, '2026-03-18', '2026-03-19', 1000.00, 150),
(2, 1, 4, '2026-01-12', '2026-01-13', 600.00, 60),
(4, 2, 3, '2026-02-05', '2026-02-05', 180.00, 8),
(1, 3, 2, '2026-04-10', '2026-04-12', 1950.00, 200),
(3, 5, 4, '2026-01-30', '2026-01-30', 200.00, 22),
(2, 4, 2, '2026-05-05', '2026-05-06', 800.00, 50),
(1, 2, 3, '2026-02-25', '2026-02-26', 1300.00, 100);