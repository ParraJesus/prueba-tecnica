/*
1. Salones más alquilados: Incluye un filtro por fechas y el sistema reporta el nombre del salón,
el número de veces alquilado y el valor del alquiler. El sistema también informa el valor
acumulado del alquiler de todos los inmuebles.
*/

-- Parámetros: fechas de inicio y fin
SET @FechaInicio = '2026-01-01';
SET @FechaFin = '2026-12-31';

-- Consulta
SELECT 
    ps.Name AS Salon,
    COUNT(r.ID) AS VecesAlquilado,
    SUM(r.TotalPrice) AS ValorAlquiler,
    (SELECT SUM(r2.TotalPrice) 
     FROM Reservations r2
     JOIN ReservationStates rs2 ON r2.ReservationStateID = rs2.ID
     WHERE rs2.State = 'CONFIRMADA'
       AND r2.StartDate BETWEEN @FechaInicio AND @FechaFin
    ) AS ValorTotalTodosLosInmuebles
FROM Reservations r
JOIN PhysicalSpaces ps ON r.SpaceId = ps.ID
JOIN ReservationStates rs ON r.ReservationStateID = rs.ID
WHERE rs.State = 'CONFIRMADA'
  AND r.StartDate BETWEEN @FechaInicio AND @FechaFin
GROUP BY ps.Name
ORDER BY VecesAlquilado DESC;

/*
2. Salones con más cancelaciones: Incluye un filtro por fechas y el sistema reporta el nombre
del salón, el número de veces cancelado y el valor pagado por cada cancelación. El sistema
también informa el valor acumulado de cancelación de todos los inmuebles.
*/
-- Parámetros
SET @FechaInicio = '2026-01-01';
SET @FechaFin   = '2026-12-31';

-- Consulta
SELECT 
    ps.Name AS Salon,
    COUNT(r.ID) AS VecesCancelado,
    SUM(r.TotalPrice * 0.10) AS ValorPorCancelacion,  -- 10% del total por reserva
    (SELECT SUM(r2.TotalPrice * 0.10)
     FROM Reservations r2
     JOIN ReservationStates rs2 ON r2.ReservationStateID = rs2.ID
     WHERE rs2.State = 'CANCELADA'
       AND r2.StartDate BETWEEN @FechaInicio AND @FechaFin
    ) AS ValorTotalCancelacionesTodosLosInmuebles
FROM Reservations r
JOIN PhysicalSpaces ps ON r.SpaceId = ps.ID
JOIN ReservationStates rs ON r.ReservationStateID = rs.ID
WHERE rs.State = 'CANCELADA'
  AND r.StartDate BETWEEN @FechaInicio AND @FechaFin
GROUP BY ps.ID, ps.Name
ORDER BY VecesCancelado DESC;
