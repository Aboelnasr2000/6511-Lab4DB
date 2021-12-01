SELECT customer_name FROM customer WHERE customer_name like 'Ma%';

SELECT order_id,COUNT(item_id),order_item.quantity*(SELECT item.unit_price FROM item WHERE item.item_id = order_item.item_id )
FROM order_item
GROUP BY order_id;

SELECT order_id FROM shipment,warehouse
WHERE shipment.warehouse_id = warehouse.warehouse_id AND warehouse.warehouse_city='Arica';

CREATE VIEW wearhouse7 AS SELECT shipment.order_id FROM shipment WHERE shipment.warehouse_id=8;
SELECT DISTINCT order_item.quantity * item.unit_price FROM shipment,warehouse8,item ,order_item WHERE order_item.order_id=warehouse8.order_id AND item.item_id = order_item.item_id
GROUP BY (order_item.order_id);

SELECT warehouse.warehouse_id,warehouse.warehouse_city,COUNT(shipment.order_id)
FROM warehouse
LEFT JOIN shipment
ON shipment.warehouse_id = warehouse.warehouse_id
GROUP BY (warehouse.warehouse_id);

SELECT customer.customer_name,COUNT(order.customer_id) FROM customer 
LEFT JOIN `order`
ON customer.customer_id = `order`.`customer_id`
GROUP BY (customer.customer_id)

SELECT item.item_id
FROM item 
WHERE Item.item_id EXCEPT (SELECT order_item.item_id
FROM order_item)
