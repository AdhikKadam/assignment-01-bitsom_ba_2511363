## Anomaly Analysis
1. Insert Anomaly : An insert anomaly happens when a database/table design forces you to insert unnecessary or incomplete data just to add a new record. 
Cell B2 - If we have new customer then we do not have separate customer_master table and we cannot add new customer into order_flat without adding a dummy order_id and selecting dummy product, some random sales person.  

2. An Update Anomaly : An update anomaly happens when the same piece of data is stored in multiple rows, and you must update it in all those places. If you miss even one, your data becomes inconsistent.
Cell D5 - If the customer has changed the email address, then we will have to update the email across all records of this customer, otherwise it will create inconsistency in the data.

3. A Delete Anomaly : A delete anomaly happens when deleting one piece of data unintentionally removes other important information.
Cell A91 - If you delete only ORDER of "Webcam" order_id=ORD1185 then we will also lose product information like category and unit price as well.


## Normalization Justification
Single flat table is simple for small dataset, however in our example we have repeat customers, products and sales rep data. From the scaling standpoint using single table is dangerous, and causes anomalies highlighted above. Whereas maintaining dataset in 3NF is beneficial as it doesn't repeat the information and instead maintain it using relationships, also it will prevent all anomalies  for insert, update and delete operations. 