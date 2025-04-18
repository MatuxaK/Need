-- 1. Выбрать автомобиль с наименьшим расходом горючего за данный период
SELECT TOP 1 V.LicensePlate
FROM Vehicles V
JOIN Trips T ON V.VehicleID = T.VehicleID
ORDER BY V.FuelConsumption;

-- 2. Выбрать водителей, использующих заданную марку автомобиля
SELECT D.FullName
FROM Drivers D
JOIN Trips T ON D.DriverID = T.DriverID
JOIN Vehicles V ON T.VehicleID = V.VehicleID
WHERE V.Brand = 'ГАЗель';
