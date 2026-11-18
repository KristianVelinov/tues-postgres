-- Dummy data

INSERT INTO rooms (name, floor) VALUES
    ('Lab 101',        1),
    ('Lab 205',        2),
    ('Classroom 310',  3),
    ('Server Room',    0);

INSERT INTO device_kinds (name) VALUES
    ('Computer'),
    ('Monitor'),
    ('Projector'),
    ('Printer'),
    ('Router');

-- room_id NULL = device is in storage
INSERT INTO devices (inventory_number, kind_id, model, room_id, purchase_date) VALUES
    -- Lab 101: several kinds, mix of old and new
    ('INV-0001', (SELECT id FROM device_kinds WHERE name = 'Computer'),  'Dell OptiPlex 3080',     (SELECT id FROM rooms WHERE name = 'Lab 101'),       '2019-09-02'),
    ('INV-0002', (SELECT id FROM device_kinds WHERE name = 'Computer'),  'Dell OptiPlex 3090',     (SELECT id FROM rooms WHERE name = 'Lab 101'),       '2023-01-16'),
    ('INV-0003', (SELECT id FROM device_kinds WHERE name = 'Monitor'),   'Dell P2422H',            (SELECT id FROM rooms WHERE name = 'Lab 101'),       '2023-01-16'),
    ('INV-0004', (SELECT id FROM device_kinds WHERE name = 'Monitor'),   'LG 24MK430H',            (SELECT id FROM rooms WHERE name = 'Lab 101'),       '2018-03-12'),
    ('INV-0005', (SELECT id FROM device_kinds WHERE name = 'Projector'), 'Epson EB-X49',           (SELECT id FROM rooms WHERE name = 'Lab 101'),       '2020-05-20'),
    -- Lab 205
    ('INV-0006', (SELECT id FROM device_kinds WHERE name = 'Computer'),  'HP ProDesk 400 G7',      (SELECT id FROM rooms WHERE name = 'Lab 205'),       '2021-10-01'),
    ('INV-0007', (SELECT id FROM device_kinds WHERE name = 'Computer'),  'HP ProDesk 400 G9',      (SELECT id FROM rooms WHERE name = 'Lab 205'),       '2024-02-26'),
    ('INV-0008', (SELECT id FROM device_kinds WHERE name = 'Printer'),   'Brother HL-L2350DW',     (SELECT id FROM rooms WHERE name = 'Lab 205'),       '2022-11-30'),
    -- Classroom 310
    ('INV-0009', (SELECT id FROM device_kinds WHERE name = 'Projector'), 'BenQ MH535',             (SELECT id FROM rooms WHERE name = 'Classroom 310'), '2017-09-15'),
    ('INV-0010', (SELECT id FROM device_kinds WHERE name = 'Monitor'),   'Samsung S24R350',        (SELECT id FROM rooms WHERE name = 'Classroom 310'), '2025-06-10'),
    -- Server Room
    ('INV-0011', (SELECT id FROM device_kinds WHERE name = 'Router'),    'MikroTik RB4011',        (SELECT id FROM rooms WHERE name = 'Server Room'),   '2022-04-04'),
    -- In storage (room_id NULL); one is old, one is new
    ('INV-0012', (SELECT id FROM device_kinds WHERE name = 'Computer'),  'Lenovo ThinkCentre M700', NULL,                                            '2016-02-08'),
    ('INV-0013', (SELECT id FROM device_kinds WHERE name = 'Printer'),   'HP LaserJet P1102',      NULL,                                            '2015-10-19'),
    ('INV-0014', (SELECT id FROM device_kinds WHERE name = 'Monitor'),   'AOC 22B1HS',             NULL,                                            '2025-09-01');