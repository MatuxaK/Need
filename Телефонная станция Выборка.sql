-- 1. Выбрать пары сблокированных телефонов
SELECT S1.PhoneNumber, S2.PhoneNumber
FROM Subscribers S1
JOIN Subscribers S2 ON S1.HasBlocker = 1 AND S2.HasBlocker = 1
WHERE S1.SubscriberID < S2.SubscriberID;

-- 4. Выбрать список абонентов АТС 47, имеющих задолженность больше 100 руб
SELECT PhoneNumber, FullName
FROM Subscribers
WHERE ATSCode = '47' AND Debt > 100.00;