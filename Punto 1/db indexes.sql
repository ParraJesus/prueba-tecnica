CREATE INDEX idx_reservation_space_dates
    ON Reservations (SpaceId, StartDate, EndDate);

CREATE INDEX idx_price_space_lookup
    ON Price_Space (SpaceId, SeasonId);
