-- Everything in a given room, grouped by kind (inventory number, kind, model, date).

SELECT d.inventory_number,
       k.name AS kind,
       d.model,
       d.purchase_date
FROM devices d
JOIN device_kinds k ON k.id = d.kind_id
JOIN rooms r ON r.id = d.room_id
WHERE r.name = 'Lab 101'
ORDER BY k.name, d.inventory_number;

-- Equipment older than 5 years, with its exact age, oldest first.

SELECT d.inventory_number,
       k.name AS kind,
       d.model,
       COALESCE(r.name, 'in storage') AS room, -- gives r.name with NULL values 'in storage'
       d.purchase_date,
       AGE(CURRENT_DATE, d.purchase_date) AS age -- difference between today's date and the date when it was purchased as age
FROM devices d
JOIN device_kinds k ON k.id = d.kind_id
LEFT JOIN rooms r ON r.id = d.room_id -- LEFT join because d.room_id may be NULL (as addressed by COALESCE)
WHERE d.purchase_date < CURRENT_DATE - INTERVAL '5 years' -- INTERVAL accepts string to convert into date
ORDER BY d.purchase_date; -- order by purchase_date, ascending by default