CREATE TABLE rooms (
    id SERIAL PRIMARY KEY,
    name  VARCHAR(50) NOT NULL UNIQUE, -- e.g.'room1'
    floor SMALLINT NOT NULL
);


CREATE TABLE device_kinds ( -- kinds of device 
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE devices ( -- every device
    id SERIAL PRIMARY KEY,
    inventory_number VARCHAR(20)  NOT NULL UNIQUE,   -- number on the sticker
    kind_id INTEGER NOT NULL REFERENCES device_kinds (id),
    model VARCHAR(100) NOT NULL,
    room_id INTEGER REFERENCES rooms (id),  -- NULL = in storage
    purchase_date DATE NOT NULL,
    CONSTRAINT purchase_date_not_in_future CHECK (purchase_date <= CURRENT_DATE) -- cannot buy something in the future :)
);