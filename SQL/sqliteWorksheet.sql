INSERT INTO item (name, price, model, description, owner) VALUES
('Smartphone X', 799, 'SX-2023', 'A powerful and sleek smartphone with a long-lasting battery and an amazing camera.', 1),
('Laptop Pro 15', 1200, 'LP-15-MAX', 'High-performance laptop perfect for creative professionals and serious gamers.', 2),
('Wireless Earbuds', 99, 'EB-SOUND', 'Compact wireless earbuds with crystal clear audio and noise cancellation.', 1),
('Smartwatch Lite', 199, 'SW-LITE-V2', 'Feature-rich smartwatch for fitness tracking and notifications.', 3),
('Gaming Console 5', 499, 'GC-FIVE-ULT', 'Next-gen gaming console with stunning graphics and immersive gameplay.', 4);
 DELETE  FROM item;

INSERT INTO Item (name, price, model, description, owner) VALUES
('iPhone 14', 999, 'A2650', 'Latest iPhone with A15 chip.', NULL),
('MacBook Pro', 1999, 'M2PRO', 'Apple M2 Pro chip, 16GB RAM.', NULL),
('Galaxy S23', 899, 'SM-S911', 'Samsung flagship, 120Hz AMOLED.', NULL),
('AirPods Pro', 249, 'PRO2', '2nd gen with ANC and MagSafe.', NULL),
('PlayStation 5', 499, 'CFI-1216A', 'Sony’s latest gaming console.', NULL);


UPDATE user 
SET budget = budget-30000
WHERE userName='haroon';
